using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Adminpanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["AdminCookie"] != null)
            {
                Session["userid"] = Request.Cookies["AdminCookie"]["userid"];
                Session["username"] = Request.Cookies["AdminCookie"]["username"];
                Session.Timeout = 720;
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}