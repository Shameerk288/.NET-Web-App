using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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
                using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
                {
                    var brands = db.getbrands();
                    brandlist.DataSource = brands;
                    brandlist.DataTextField = "brandname";
                    brandlist.DataValueField = "brand_id";
                    brandlist.DataBind();

                    if (Request.QueryString["productid"] != null)
                    {
                        lblimg.Visible = true;
                        displayimg.Visible = false;
                        btnAdd.Text = "Update";

                        int productid = Convert.ToInt32(Request.QueryString["productid"]);
                        tblproduct p = db.tblproducts.FirstOrDefault(v => v.productid == productid); //existing object on already created table

                        if (p != null)
                        {
                            txtproductname.Text = p.productname;
                            txtproductdesc.Text = p.productdesc;
                            txtproductqty.Text = Convert.ToString(p.productqty);
                            txtproductprice.Text = Convert.ToString(p.productprice);

                            displayimg.Visible = true;
                            displayimg.ImageUrl = p.productimage;

                            brandlist.SelectedValue = p.brand_id.ToString();
                        }
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                if (Request.QueryString["Productid"] == null)
                {
                    tblproduct p = new tblproduct();

                    p.productname = txtproductname.Text;
                    p.productdesc = txtproductdesc.Text;
                    p.productprice = Convert.ToDecimal(txtproductprice.Text);
                    p.productqty = Convert.ToInt32(txtproductqty.Text);

                    if (productimage.HasFile)
                    {
                        productimage.SaveAs(Server.MapPath("Images/" + productimage.FileName));
                        p.productimage = "Images/" + productimage.FileName;
                    }

                    p.brand_id = Convert.ToInt32(brandlist.SelectedValue);

                    db.tblproducts.Add(p);
                    db.SaveChanges();
                    dvsuccess.InnerText = "Product Added";
                    dvsuccess.Visible = true;

                    Response.Redirect("Allproducts.aspx");

                }
                else
                {
                    int productid = Convert.ToInt32(Request.QueryString["productid"]);
                    tblproduct p = db.tblproducts.FirstOrDefault(v => v.productid == productid);

                    p.productname = txtproductname.Text;
                    p.productdesc = txtproductdesc.Text;
                    p.productprice = Convert.ToDecimal(txtproductprice.Text);
                    p.productqty = Convert.ToInt32(txtproductqty.Text);

                    if (productimage.HasFile)
                    {
                        productimage.SaveAs(Server.MapPath("Images/" + productimage.FileName));
                        p.productimage = "Images/" + productimage.FileName;
                    }

                    p.brand_id = Convert.ToInt32(brandlist.SelectedValue);

                    db.SaveChanges();

                    dvsuccess.InnerText = "Updated Successfully";
                    dvsuccess.Visible = true;
                    Response.Redirect("Allproducts.aspx");
                }

            }
        }
    }
}