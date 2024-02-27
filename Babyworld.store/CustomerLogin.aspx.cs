using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Babyworld.store
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Request.Cookies["Cookie"] != null)
            {
                Session["customerid"] = Request.Cookies["Cookie"]["customerid"];
                Session["customername"] = Request.Cookies["Cookie"]["customername"];
                Session.Timeout = 720;
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
                btnlogout.Visible = false;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerRegistration.aspx");
        }

        protected void Btn_login_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                string encpassword = Encryptdata(txtpassword.Text);
                var login = db.login_customer(txtcustomeremail.Text, encpassword).ToList();

                if (login.Count > 0)
                {
                    Session["customerid"] = login[0].customerid;
                    Session["customername"] = login[0].customername;
                    Session.Timeout = 720;

                    Response.Cookies["Cookie"]["customerid"] = login[0].customerid.ToString();
                    Response.Cookies["Cookie"]["customername"] = login[0].customername;
                    Response.Cookies["Cookie"].Expires = DateTime.Now.AddMonths(1);

                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    dvfailure.InnerText = "Invalid Credentials";
                    dvfailure.Visible = true;
                }
            }
        }
        private string Encryptdata(string password)
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }
    }
}