using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Babyworld.store.App_Code;

namespace Babyworld.store
{
    public partial class Checkout : System.Web.UI.Page
    {
        decimal grdTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

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

                        int customerid = Convert.ToInt32(Request.Cookies["Cookie"]["customerid"]);

                        var CustomerCart = db.customershoppingcartdetails(customerid);
                        checkoutgrid.DataSource = CustomerCart;
                        checkoutgrid.DataBind();
                        subtotal.InnerText = grdTotal.ToString("c");
                        total.InnerText = grdTotal.ToString("c");
                    }
                    else
                    {
                        Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
                        btnlogout.Visible = false;

                        var visitorid = Convert.ToString(Request.Cookies["VisitorCookie"]["visitorid"]);

                        var VisitorCart = db.shoppingcartdetails(visitorid);
                        checkoutgrid.DataSource = VisitorCart;
                        checkoutgrid.DataBind();
                        subtotal.InnerText = grdTotal.ToString("c");
                        total.InnerText = grdTotal.ToString("c");
                    }
                }
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void checkoutgrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "productprice"));

                grdTotal = grdTotal + rowTotal;
            }
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
            if (CashOndelivery.Checked == true)
            {
                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    if (Request.Cookies["Cookie"] != null)
                    {
                        int customerid = Convert.ToInt32(Request.Cookies["Cookie"]["customerid"]);

                        var CustomerCart = db.customershoppingcartdetails(customerid).ToList();

                        if (CustomerCart.Count > 0)
                        {
                            Email em = new Email();
                            em.SendEmail(txtemail.Text, "Your Order Details from BABYWORLD.STORE", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.");

                            //db.EmptyCustomerCart(customerid);
                            dvsuccess.Visible = true;
                            dvsuccess.InnerText = "Your order has been placed.Please check your email for order details.";
                        }
                        else
                        {
                            dvfailure.Visible = true;
                            dvfailure.InnerText = "Please Add Some Products To Cart";
                        }
                    }
                    else
                    {
                        var visitorid = Convert.ToString(Request.Cookies["VisitorCookie"]["visitorid"]);
                        var VisitorCart = db.shoppingcartdetails(visitorid).ToList();

                        if (VisitorCart.Count > 0)
                        {
                            Email em = new Email();
                            em.SendEmail(txtemail.Text, "Your Order Details from BABYWORLD.STORE", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.");

                            //db.EmptyVisitorCart(visitorid);
                            dvsuccess.Visible = true;
                            dvsuccess.InnerText = "Your order has been placed.Please check your email for order details.";
                        }
                        else
                        {
                            dvfailure.Visible = true;
                            dvfailure.InnerText = "Please Add Some Products To Cart";
                        }
                    }
                }
            }
        }
    }
}