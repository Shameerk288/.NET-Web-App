using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Homepage : System.Web.UI.Page
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
                else if (Request.Cookies["VisitorCookie"] != null)
                {
                    Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
                    btnlogout.Visible = false;
                }
                else
                {
                    Guid id = Guid.NewGuid();
                    Response.Cookies["VisitorCookie"]["visitorid"] = id.ToString();
                    Response.Cookies["VisitorCookie"].Expires = DateTime.Now.AddMonths(1);
                }

                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    if (Request.QueryString["brandname"] != null)
                    {
                        var brand = Request.QueryString["brandname"];
                        var products = db.get_specific_brand_products(brand);
                        Productrepeater.DataSource = products;
                        Productrepeater.DataBind();
                    }
                    else
                    {
                        var products = db.getproductdetails();
                        Productrepeater.DataSource = products;
                        Productrepeater.DataBind();
                    }
                }
            }
        }

        protected void btn1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Allbrands")
            {
                Response.Redirect("Homepage.aspx");
            }
            else if (e.CommandName == "Dove")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
            else if (e.CommandName == "Graco")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
            else if (e.CommandName == "Huggies")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
            else if (e.CommandName == "Johnson")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
            else if (e.CommandName == "Chico")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
            else if (e.CommandName == "Pampers")
            {
                Response.Redirect("Homepage.aspx?brandname=" + e.CommandArgument);
            }
        }

        protected void Image1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "productdetail")
            {
                Response.Redirect("ProductDetail.aspx?productid=" + e.CommandArgument);
            }
        }

        protected void btnAddtocart_Command(object sender, CommandEventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                tblshoppingcart t = new tblshoppingcart();

                if (Request.Cookies["Cookie"] != null)
                {
                    t.customerid = Convert.ToInt32(Request.Cookies["Cookie"]["customerid"]);
                    t.productid = Convert.ToInt32(e.CommandArgument);
                    db.tblshoppingcarts.Add(t);
                    db.SaveChanges();
                }
                else
                {
                    t.visitorid = Request.Cookies["VisitorCookie"]["visitorid"];
                    t.productid = Convert.ToInt32(e.CommandArgument);
                    db.tblshoppingcarts.Add(t);
                    db.SaveChanges();
                }
                dvsuccess.Visible = true;
                dvsuccess.InnerText = "Product Added To Cart Successfully";
            }
        }

        protected void Productrepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Productrepeater.Items.Count > 0)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    int qty = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "productqty"));
                    Button btn = (Button)e.Item.FindControl("btnAddtocart");

                    if (qty == 0)
                    {
                        btn.Enabled = false;
                    }
                    else
                    {
                        btn.Enabled = true;
                    }
                }
            }
        }
    }
}