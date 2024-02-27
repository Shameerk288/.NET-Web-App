using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class ProductDetail : System.Web.UI.Page
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

                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    if (Request.QueryString["productid"] != null)
                    {
                        int productid = Convert.ToInt32(Request.QueryString["productid"]);
                        tblproduct p = db.tblproducts.FirstOrDefault(v => v.productid == productid); //existing object on already created table

                        if (p != null)
                        {
                            lblproductname.Text = p.productname;
                            lblproductdesc.Text = p.productdesc;
                            lblproductprice.Text = Convert.ToString(p.productprice);
                            productimage.ImageUrl = p.productimage;

                            if (p.productqty >= 1)
                            {
                                lblproductqty.Text = "Available";
                                btnAddtocart.Enabled = true;
                            }
                            else
                            {
                                lblproductqty.Text = "Out Of Stock";
                                btnAddtocart.Enabled = false;
                            }
                        }
                    }
                }
            }
        }

        protected void btnAddtocart_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                tblshoppingcart t = new tblshoppingcart();

                if (Request.Cookies["Cookie"] != null)
                {
                    int productid = Convert.ToInt32(Request.QueryString["productid"]);
                    t.customerid = Convert.ToInt32(Request.Cookies["Cookie"]["customerid"]);
                    t.productid = productid;
                    db.tblshoppingcarts.Add(t);
                    db.SaveChanges();
                }
                else
                {
                    int productid = Convert.ToInt32(Request.QueryString["productid"]);
                    t.visitorid = Request.Cookies["VisitorCookie"]["visitorid"];
                    t.productid = productid;
                    db.tblshoppingcarts.Add(t);
                    db.SaveChanges();
                }
                dvsuccess.Visible = true;
                dvsuccess.InnerText = "Product Added To Cart Successfully";
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}