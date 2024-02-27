using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["Cookie"] != null)
                {
                    Session["customerid"] = Request.Cookies["Cookie"]["customerid"];
                    Session["customername"] = Request.Cookies["Cookie"]["customername"];
                    Session.Timeout = 720;

                    Button btnlogin = (Button)Page.Master.FindControl("btnlogin");
                    btnlogin.Visible = false;

                    Button btnSignup = (Button)Page.Master.FindControl("btnSignup");
                    btnSignup.Visible = false;

                    Label lblUserVal = (Label)Page.Master.FindControl("lblname");
                    lblUserVal.Text = Request.Cookies["Cookie"]["customername"];
                }
                else
                {
                    Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
                    btnlogout.Visible = false;
                }
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}