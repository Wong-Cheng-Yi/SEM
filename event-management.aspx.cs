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
    public partial class event_management : System.Web.UI.Page
    {
        // START OF PAGE
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        // READ
        protected void LoadEvents()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Event ORDER BY startDate ASC";
                SqlCommand cmd = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    EventGridView.DataSource = dataTable;
                    EventGridView.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        // CREATE
        protected void CreateNewEvent_Click(object sender, EventArgs e)
        {
            string eventName = NewEventName.Text;
            string startDate = NewStartDate.Text;
            string endDate = NewEndDate.Text;
            string content = NewContent.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Event (eventName, startDate, endDate, content) VALUES (@eventName, @startDate, @endDate, @content)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@eventName", eventName);
                cmd.Parameters.AddWithValue("@startDate", startDate);
                cmd.Parameters.AddWithValue("@endDate", endDate);
                cmd.Parameters.AddWithValue("@content", content);
                connection.Open();
                cmd.ExecuteNonQuery();
            }

            NewEventName.Text = "";
            NewStartDate.Text = "";
            NewEndDate.Text = "";
            NewContent.Text = "";
            LoadEvents();
        }

        // EDITING
        protected void EventGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EventGridView.EditIndex = e.NewEditIndex;
            LoadEvents();
        }

        // UPDATE
        protected void EventGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Find the row being updated
            GridViewRow row = EventGridView.Rows[e.RowIndex];

            // Get the eventID from the DataKeys
            string eventID = EventGridView.DataKeys[e.RowIndex].Value.ToString();

            // Find the TextBox controls for eventName, startDate, and endDate inside EditItemTemplate
            TextBox txtEventName = (TextBox)row.FindControl("txtEventName");
            TextBox txtStartDate = (TextBox)row.FindControl("txtStartDate");
            TextBox txtEndDate = (TextBox)row.FindControl("txtEndDate");
            TextBox txtContent = (TextBox)row.FindControl("txtContent");

            // Get the updated values
            string eventName = txtEventName.Text;
            string content = txtContent.Text;

            // Parse the startDate and endDate to DateTime
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            // Update the event in the database
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Event SET eventName=@eventName, startDate=@startDate, endDate=@endDate, content=@content WHERE eventID=@eventID", conn);
                cmd.Parameters.AddWithValue("@eventID", eventID);
                cmd.Parameters.AddWithValue("@eventName", eventName);
                cmd.Parameters.AddWithValue("@startDate", startDate);
                cmd.Parameters.AddWithValue("@endDate", endDate);
                cmd.Parameters.AddWithValue("@content", content);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Reset the edit index
            EventGridView.EditIndex = -1;

            // Rebind the GridView to reflect the updated data
            LoadEvents();
        }

        // CANCEL UPDATE
        protected void EventGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EventGridView.EditIndex = -1;
            LoadEvents();
        }

        // DELETE
        protected void EventGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string eventID = EventGridView.DataKeys[e.RowIndex].Value.ToString();
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Event WHERE eventID = @eventID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@eventID", eventID);
                connection.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEvents();
        }

        // INDEXING
        protected void EventGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            EventGridView.PageIndex = e.NewPageIndex;
            LoadEvents();
        }
    }
}