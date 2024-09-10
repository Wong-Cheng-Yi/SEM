using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Linq;

namespace SEM_Assignment
{
    public partial class _event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int currentPage;
                int.TryParse(Request.QueryString["page"], out currentPage);
                if (currentPage == 0) currentPage = 1;  // Default to the first page

                int eventsPerPage = 9;  // Number of events per page

                string filter = Request.QueryString["filter"]; // Capture the filter query string (all, soon)

                if (string.IsNullOrEmpty(filter) || filter == "all")
                {
                    LoadEvents(currentPage, eventsPerPage);  // Load all events (default)
                }
                else if (filter == "soon")
                {
                    LoadSoonEvents(currentPage, eventsPerPage);  // Load "soon" events
                }
            }
        }

        protected void LoadEvents(int currentPage, int eventsPerPage)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT * FROM Event ORDER BY startDate ASC
                                OFFSET @Offset ROWS FETCH NEXT @EventsPerPage ROWS ONLY";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Offset", (currentPage - 1) * eventsPerPage);
                cmd.Parameters.AddWithValue("@EventsPerPage", eventsPerPage);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        eventsPlaceholder.Controls.Clear();  // Clear any previous events
                        LiteralControl eventsLiteral = new LiteralControl(RenderEventsHtml(dataTable));
                        eventsPlaceholder.Controls.Add(eventsLiteral);

                        int totalEvents = GetTotalEventsCount();
                        int totalPages = (int)Math.Ceiling((double)totalEvents / eventsPerPage);
                        LiteralControl paginationLiteral = new LiteralControl(RenderPagination(totalPages, currentPage));
                        paginationPlaceholder.Controls.Add(paginationLiteral);
                    }
                    else
                    {
                        Response.Write("<script>alert('No events found');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        protected void LoadSoonEvents(int currentPage, int eventsPerPage)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT * FROM Event WHERE startDate BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE()) ORDER BY startDate ASC
                                OFFSET @Offset ROWS FETCH NEXT @EventsPerPage ROWS ONLY";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Offset", (currentPage - 1) * eventsPerPage);
                cmd.Parameters.AddWithValue("@EventsPerPage", eventsPerPage);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        eventsPlaceholder.Controls.Clear();  // Clear any previous events
                        LiteralControl eventsLiteral = new LiteralControl(RenderEventsHtml(dataTable));
                        eventsPlaceholder.Controls.Add(eventsLiteral);

                        int totalEvents = GetTotalEventsCount();
                        int totalPages = (int)Math.Ceiling((double)totalEvents / eventsPerPage);
                        LiteralControl paginationLiteral = new LiteralControl(RenderPagination(totalPages, currentPage));
                        paginationPlaceholder.Controls.Add(paginationLiteral);
                    }
                    else
                    {
                        Response.Write("<script>alert('No events within the next 7 days.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        private int GetTotalEventsCount()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Event";
                SqlCommand cmd = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    return (int)cmd.ExecuteScalar();
                }
                catch
                {
                    return 0;  // Return 0 if error occurs
                }
            }
        }

        private string TruncateEventName(string eventName, int maxLength)
        {
            if (string.IsNullOrEmpty(eventName) || eventName.Length <= maxLength)
            {
                return eventName;
            }

            // Truncate the event name to the max number of letters
            return eventName.Substring(0, maxLength) + "...";
        }

        private string TruncateContent(string content, int maxWords)
        {
            if (string.IsNullOrEmpty(content))
            {
                return content;
            }

            // Split content into words
            string[] words = content.Split(' ');

            if (words.Length <= maxWords)
            {
                return content;
            }

            // Truncate the content to the max number of words
            return string.Join(" ", words.Take(maxWords)) + "...";
        }

        private string RenderEventsHtml(DataTable dataTable)
        {
            string eventsHtml = "";

            foreach (DataRow row in dataTable.Rows)
            {
                string dayOfWeek = Convert.ToDateTime(row["startDate"]).DayOfWeek.ToString();
                string month = Convert.ToDateTime(row["startDate"]).ToString("MMM").ToUpper();
                string day = Convert.ToDateTime(row["startDate"]).Day.ToString();
                string truncatedEventName = TruncateEventName(row["eventName"].ToString(), 20);
                string truncatedContent = TruncateContent(row["content"].ToString(), 3);

                eventsHtml += $@"
<div class='col-lg-4 templatemo-item-col all soon'>
    <div class='meeting-item'>
        <div class='thumb'>
            <div class='price'>
                <span>{dayOfWeek}</span>
            </div>
            <a href='event-details.aspx?eventID={row["eventID"]}'><img src='assets/images/meeting-01.jpg' alt=''></a>
        </div>
        <div class='down-content'>
            <div class='date'>
                <h6>{month} <span>{day}</span></h6>
            </div>
            <a href='event-details.aspx?eventID={row["eventID"]}'><h4>{truncatedEventName}</h4></a>
            <p>{truncatedContent}</p>
        </div>
    </div>
</div>";
            }

            return eventsHtml;
        }

        private string RenderPagination(int totalPages, int currentPage)
        {
            string paginationHtml = "<ul>";

            // Previous button
            if (currentPage > 1)
            {
                paginationHtml += $"<li><a href='event.aspx?page={currentPage - 1}#events'><i class='fa fa-angle-left'></i></a></li>";
            }

            // Page numbers
            for (int i = 1; i <= totalPages; i++)
            {
                paginationHtml += (i == currentPage)
                    ? $"<li class='active'><a href='#events'>{i}</a></li>"
                    : $"<li><a href='event.aspx?page={i}#events'>{i}</a></li>";
            }

            // Next button
            if (currentPage < totalPages)
            {
                paginationHtml += $"<li><a href='event.aspx?page={currentPage + 1}#events'><i class='fa fa-angle-right'></i></a></li>";
            }

            paginationHtml += "</ul>";
            return paginationHtml;
        }
    }
}