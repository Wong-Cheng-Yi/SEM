using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;



namespace SEM_Assignment
{
    public partial class EventBcast : System.Web.UI.Page
    {
        // List to hold email addresses
        private static List<string> emailList = new List<string>();
        // Database connection string
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmailsFromDatabase();  // Load emails from database
                BindEmailList();           // Bind emails to checkbox list
            }
        }

        private void LoadEmailsFromDatabase()
        {
            emailList.Clear(); // Clear the local list before fetching from the database

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT EmailAddress FROM EmailBroadcast";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string email = reader["EmailAddress"].ToString();
                            emailList.Add(email); // Add to local list
                        }
                    }
                }
            }
        }

        // Function to add email to the list
        protected void btnAddEmail_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            if (!string.IsNullOrEmpty(email) && !EmailExistsInDatabase(email))
            {
                // Add the email to the database
                SaveEmailToDatabase(email);

                // Add to the local email list
                emailList.Add(email);

                lblStatus.Text = "Email added successfully!";
            }
            else
            {
                lblStatus.Text = "Email is invalid or already exists.";
            }

            txtEmail.Text = ""; // Clear the textbox
            BindEmailList(); // Refresh the table
        }

        // Function to save email to the database
        private void SaveEmailToDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO EmailBroadcast (EmailAddress, IsLinkSent) VALUES (@EmailAddress, 0)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmailAddress", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private bool EmailExistsInDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM EmailBroadcast WHERE EmailAddress = @EmailAddress";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmailAddress", email);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void DeleteEmailFromDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM EmailBroadcast WHERE EmailAddress = @EmailAddress";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmailAddress", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }


        // Delete an email from the list
        protected void gvEmailList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the email to be deleted using DataKeys
            string emailToDelete = gvEmailList.DataKeys[e.RowIndex].Value.ToString();

            // Remove the email from both the in-memory list and the database
            emailList.Remove(emailToDelete);
            DeleteEmailFromDatabase(emailToDelete);

            // Re-bind the updated list to the GridView
            BindEmailList();
        }


        // Function to broadcast the event link to selected emails
        protected void btnBroadcast_Click(object sender, EventArgs e)
        {

            string eventLink = txtEventLink.Text;
            if (string.IsNullOrEmpty(eventLink))
            {
                lblStatus.Text = "Please provide an event link.";
                return;
            }

            List<string> selectedEmails = new List<string>();
            foreach (GridViewRow row in gvEmailList.Rows)
            {
                CheckBox chkSelectEmail = (CheckBox)row.FindControl("chkSelectEmail");
                if (chkSelectEmail != null && chkSelectEmail.Checked)
                {
                    string email = row.Cells[2].Text; // Email is in the 2nd cell
                    selectedEmails.Add(email);
                }
            }

            if (selectedEmails.Count == 0)
            {
                lblStatus.Text = "No emails selected.";
                return;
            }

            // Send the event link to selected emails
            foreach (var email in selectedEmails)
            {

                SendEmail(email, "FOCS Event Invitation", $" \n Hi there, \nHere are FOCS faculty, an new event will be held! You are invited! \n\nFeel interesting? Click here for more information : {eventLink}");
                UpdateEmailStatusInDatabase(email); // Update the email status in the database
            }

            lblStatus.Text = "Event link has been sent to the selected email addresses!";

       
        }

        // Search function to filter the email list
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text;
            BindEmailList(searchTerm);
        }

        private void UpdateEmailStatusInDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE EmailBroadcast SET IsLinkSent = 1, SentDate = GETDATE() WHERE EmailAddress = @EmailAddress";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmailAddress", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Bind email list to GridView
        private void BindEmailList(string searchTerm = "")
        {
            // Filter the email list based on the search term
            var filteredEmails = string.IsNullOrEmpty(searchTerm)
                ? emailList
                : emailList.Where(email => email.Contains(searchTerm)).ToList();

            // Create a DataTable to store emails with sequence numbers
            DataTable dt = new DataTable();
            dt.Columns.Add("RowNumber");
            dt.Columns.Add("Email");

            for (int i = 0; i < filteredEmails.Count; i++)
            {
                DataRow row = dt.NewRow();
                row["RowNumber"] = (i + 1).ToString();
                row["Email"] = filteredEmails[i];
                dt.Rows.Add(row);
            }

            gvEmailList.DataSource = dt;
            gvEmailList.DataBind();
        }

        // Function to send email
        private void SendEmail(string toEmail, string subject, string body)
        {
            var fromEmail = "semassignmentg3@gmail.com";
            var fromPassword = "fcsh pzbq esrg jaqy";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com", // e.g., smtp.gmail.com
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail, fromPassword)
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
            {
                smtp.Send(message);
            }
        }



        // Function to handle "Select All" checkbox
        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkSelectAll = (CheckBox)sender;
            foreach (GridViewRow row in gvEmailList.Rows)
            {
                CheckBox chkSelectEmail = (CheckBox)row.FindControl("chkSelectEmail");
                if (chkSelectEmail != null)
                {
                    chkSelectEmail.Checked = chkSelectAll.Checked;
                }
            }
        }
    }
}


//Here are the database table
/*
CREATE TABLE[dbo].[EmailBroadcast] (
    [Id]           INT IDENTITY(1, 1) NOT NULL,
    [EmailAddress] NVARCHAR (255) NULL,
    [EventLink]    NVARCHAR (MAX) NULL,
    [IsLinkSent]   BIT            NULL,
    [SentDate]     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
*/