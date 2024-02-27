using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Allproducts : System.Web.UI.Page
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
                fillproducts();
            }
        }

        protected void products_detail_GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void products_detail_GV_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void fillproducts()
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                var products = db.getproductdetails();
                products_detail_GV.DataSource = products;
                products_detail_GV.DataBind();
            }
        }

        protected void products_detail_GV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("Addproduct.aspx?productid=" + e.CommandArgument);
            }
            else
            {
                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    db.deleteproduct(Convert.ToInt32(e.CommandArgument));
                }
                fillproducts();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Addproduct.aspx");
        }
    }
}