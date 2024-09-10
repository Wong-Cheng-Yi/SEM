using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace SEM_Assignment
{
    public partial class event_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the event ID from the query string
                string eventId = Request.QueryString["eventID"];

                if (!string.IsNullOrEmpty(eventId))
                {
                    LoadEventDetails(eventId);  // Load the event details
                }
                else
                {
                    // Show an error message if no event is selected
                    Response.Write("<script>alert('No event selected.');</script>");
                }
            }
        }

        private void LoadEventDetails(string eventId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT eventName, content, startDate FROM Event WHERE eventID = @EventID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@EventID", eventId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Populate the controls with data
                        eventTitle.InnerText = reader["eventName"].ToString();
                        eventContent.InnerText = reader["content"].ToString();

                        // Display the day of the week instead of price
                        string dayOfWeek = Convert.ToDateTime(reader["startDate"]).DayOfWeek.ToString();
                        priceSpan.InnerText = dayOfWeek;

                        // Display the date in the date span
                        string month = Convert.ToDateTime(reader["startDate"]).ToString("MMM").ToUpper();
                        string day = Convert.ToDateTime(reader["startDate"]).Day.ToString();
                        dateSpan.InnerHtml = $"{month} <span>{day}</span>";
                    }
                    else
                    {
                        Response.Write("<script>alert('Event not found.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}