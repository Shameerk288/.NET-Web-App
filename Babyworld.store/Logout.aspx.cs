using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();            

            if (Request.Cookies["AdminCookie"] != null)
            {
                Response.Cookies["AdminCookie"].Expires = DateTime.Now.AddMinutes(-1);
                Response.Redirect("AdminLogin.aspx");                              
            }
            else
            {
                Response.Cookies["Cookie"].Expires = DateTime.Now.AddMinutes(-1);
                Response.Redirect("Homepage.aspx");           
            }
        }
    }
}