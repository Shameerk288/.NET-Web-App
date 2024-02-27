using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        decimal grdTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
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

                        int customerid;
                        customerid = Convert.ToInt32(Request.Cookies["Cookie"]["customerid"]);

                        var CustomerCart = db.customershoppingcartdetails(customerid);
                        CartGrid.DataSource = CustomerCart;
                        CartGrid.DataBind();
                        subtotal.InnerText = grdTotal.ToString("c");
                        total.InnerText = grdTotal.ToString("c");
                    }
                    else
                    {
                        Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
                        btnlogout.Visible = false;

                        var visitorid = Request.Cookies["VisitorCookie"]["visitorid"];

                        var VisitorCart = db.shoppingcartdetails(visitorid);
                        CartGrid.DataSource = VisitorCart;
                        CartGrid.DataBind();
                        subtotal.InnerText = grdTotal.ToString("c");
                        total.InnerText = grdTotal.ToString("c");
                    }
                }
            }
        }

        protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void CartGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void CartGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                if (e.CommandName == "remove")
                {
                    db.deleteCartProduct(Convert.ToInt32(e.CommandArgument));
                    Response.Redirect("ShoppingCart.aspx");
                }
            }
        }

        protected void btnAddnewProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void CartGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "productprice"));

                grdTotal = grdTotal + rowTotal;
            }
        }
    }
}