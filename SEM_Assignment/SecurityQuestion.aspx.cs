using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEM_Assignment
{
    public partial class SecurityQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                QuestionDropDownList.Items.Add(new ListItem("First Pet’s Name", "First Pet’s Name"));
                QuestionDropDownList.Items.Add(new ListItem("Name of Your First School", "Name of Your First School"));
                QuestionDropDownList.Items.Add(new ListItem("City Where You Were Born", "City Where You Were Born"));
                QuestionDropDownList.Items.Add(new ListItem("Favorite Book or Movie", "Favorite Book or Movie"));
                QuestionDropDownList.Items.Add(new ListItem("Mother’s Maiden Name", "Mother’s Maiden Name"));
                QuestionDropDownList.Items.Add(new ListItem("First Car", "First Car"));
                QuestionDropDownList.Items.Add(new ListItem("Best Friend’s Name", "Best Friend’s Name"));
                QuestionDropDownList.Items.Add(new ListItem("Favorite Food", "Favorite Food"));
            }
        }

        private bool ChangeSecurityQuestion(string username, string currentPassword, string newQuestion, string newAnswer)
        {
            MembershipUser user = Membership.GetUser(username);

            if (user != null)
            {
                try
                {

                    return user.ChangePasswordQuestionAndAnswer(currentPassword, newQuestion, newAnswer);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    return false;
                }
            }
            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = Membership.GetUser().UserName;
            string password = Session["UserPassword"] as string;
            string newQuestion = QuestionDropDownList.SelectedValue;
            string newAnswer = txtAnswer.Text;

            bool result = ChangeSecurityQuestion(username, password, newQuestion, newAnswer);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "InsertSuccessful", "alert('Insert Successful');", true);

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string userId = "";
                    if (User.Identity.IsAuthenticated)
                    {

                        MembershipUser user = Membership.GetUser(username);
                        if (user != null)
                        {
                            userId = user.ProviderUserKey.ToString();
                        }
                    }

                    string updateQuery = "UPDATE [aspnet_Users] SET [IsFirst] = @status WHERE UserID = @id";

                    SqlCommand cmd = new SqlCommand(updateQuery, conn);
                    cmd.Parameters.AddWithValue("@status", false);
                    cmd.Parameters.AddWithValue("@id", userId);


                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("ChangePassword.aspx");
                Session["UserPassword"] = null;
            }
            else
            {
                lblMessage.Text = "Failed to update security question.";
            }


            
        }
    }
}