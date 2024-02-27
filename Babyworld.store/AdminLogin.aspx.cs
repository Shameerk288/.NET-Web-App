using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Babyworld.store
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Request.Cookies["AdminCookie"] != null)
            {
                Session["userid"] = Request.Cookies["AdminCookie"]["userid"];
                Session["username"] = Request.Cookies["AdminCookie"]["username"];
                Session.Timeout = 720;
                Response.Redirect("Adminpanel.aspx");
            }
        }

        protected void Btn_login_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                string encpassword = Encryptdata(txtpassword.Text);
                var login = db.login_user(txtemail.Text, encpassword).ToList();
                if (login.Count > 0)
                {
                    Session["userid"] = login[0].userid;
                    Session["username"] = login[0].username;
                    Session.Timeout = 720;

                    Response.Cookies["AdminCookie"]["userid"] = login[0].userid.ToString();
                    Response.Cookies["AdminCookie"]["username"] = login[0].username;
                    Response.Cookies["AdminCookie"].Expires = DateTime.Now.AddDays(1);

                    Response.Redirect("Adminpanel.aspx");

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