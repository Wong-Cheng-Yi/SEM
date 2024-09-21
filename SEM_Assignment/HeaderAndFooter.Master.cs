using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SEM_Assignment
{
    public partial class HeaderAndFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                register.Visible = true;
                Event.Visible = true;
                LogoutButton.Text = "Logout";
            }
            else {
                register.Visible = false;
                Event.Visible = false;
                LogoutButton.Text = "Login";
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

       
            Response.Redirect("Login.aspx");
        }
    }
}
