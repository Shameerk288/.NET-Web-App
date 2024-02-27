using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Admin_management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                Fillusers();
            }
        }

        protected void Fillusers()
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                var users = db.get_admins();
                user_detail_GV.DataSource = users;
                user_detail_GV.DataBind();
            }
        }

        protected void user_detail_GV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("AdminSignup.aspx?userid=" + e.CommandArgument);
            }
            else
            {
                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    db.delete_user(Convert.ToInt32(e.CommandArgument));
                }
                Fillusers();
            }
        }

        protected void btnAddnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignup.aspx");
        }

        protected void user_detail_GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        protected void user_detail_GV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
        }
    }
}