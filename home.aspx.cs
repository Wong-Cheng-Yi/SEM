using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEM_Assignment
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUpcomingEvents(); // Load upcoming events
            }
        }

        protected void LoadUpcomingEvents()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT TOP 4 * FROM Event WHERE startDate BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE()) ORDER BY startDate ASC";
                SqlCommand cmd = new SqlCommand(query, connection);

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
                    }
                    else
                    {
                        Response.Write("<script>alert('No upcoming events found.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        private string RenderEventsHtml(DataTable dataTable)
        {
            string eventsHtml = "";

            foreach (DataRow row in dataTable.Rows)
            {
                string dayOfWeek = Convert.ToDateTime(row["startDate"]).DayOfWeek.ToString();
                string month = Convert.ToDateTime(row["startDate"]).ToString("MMM").ToUpper();
                string day = Convert.ToDateTime(row["startDate"]).Day.ToString();
                string truncatedEventName = TruncateEventName(row["eventName"].ToString(), 24);
                string truncatedContent = TruncateContent(row["content"].ToString(), 5);

                eventsHtml += $@"
<div class='col-lg-6'>
    <div class='meeting-item'>
        <div class='thumb'>
            <div class='price'>
                <span>{dayOfWeek}</span> <!-- Change the price accordingly if needed -->
            </div>
            <a href='event-details.aspx?eventID={row["eventID"]}'>
                <img src='assets/images/meeting-01.jpg' alt='{truncatedEventName}'></a>
        </div>
        <div class='down-content'>
            <div class='date'>
                <h6>{month} <span>{day}</span></h6>
            </div>
            <a href='event-details.aspx?eventID={row["eventID"]}'>
                <h4>{truncatedEventName}</h4>
            </a>
            <p>{truncatedContent}</p>
        </div>
    </div>
</div>";
            }

            return eventsHtml;
        }

        private string TruncateEventName(string eventName, int maxLength)
        {
            if (string.IsNullOrEmpty(eventName) || eventName.Length <= maxLength)
            {
                return eventName;
            }
            return eventName.Substring(0, maxLength) + "...";
        }

        private string TruncateContent(string content, int maxWords)
        {
            if (string.IsNullOrEmpty(content))
            {
                return content;
            }

            string[] words = content.Split(' ');
            if (words.Length <= maxWords)
            {
                return content;
            }

            return string.Join(" ", words.Take(maxWords)) + "...";
        }
    }
}