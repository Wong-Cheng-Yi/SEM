using Microsoft.VisualBasic.Logging;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEM_Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserPassword"] = null;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(Login1.UserName, Login1.Password))
            {
                // Store the password in session (ensure this is secure)
                Session["UserPassword"] = Login1.Password;

                //// Redirect to the Change Security Question page
                //Response.Redirect("ChangePassword.aspx");
            }
        }
    }
}