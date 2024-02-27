using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Babyworld.store
{
    public partial class AdminSignup : System.Web.UI.Page
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
                    if (Request.QueryString["userid"] != null)
                    {
                        btnSignup.Text = "Update";
                        int userid = Convert.ToInt32(Request.QueryString["userid"]);
                        tbladmin u = db.tbladmins.FirstOrDefault(v => v.userid == userid); //existing object on already created table

                        if (u != null)
                        {
                            txtusername.Text = u.username;
                            txtemail.Text = u.useremail;
                            string decrptpassword = Decryptdata(u.password);
                            txtpassword.Attributes["Value"] = decrptpassword;
                            txtrepassword.Attributes["Value"] = decrptpassword;
                        }
                    }
                }
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {
                var chkemail = db.chk_email(txtemail.Text).ToList();

                if (Request.QueryString["userid"] == null)
                {
                    if (chkemail.Count > 0)
                    {
                        lblerrormsg.Text = "Email Already Exists";
                    }
                    else
                    {
                        tbladmin u = new tbladmin();

                        u.useremail = txtemail.Text;
                        u.username = txtusername.Text;
                        string encpassword = Encryptdata(txtpassword.Text);
                        u.password = encpassword;
                        u.status = true;

                        db.tbladmins.Add(u);
                        db.SaveChanges();

                        dvsuccess.InnerText = "Admin Added";
                        dvsuccess.Visible = true;
                    }
                }
                else
                {
                    int userid = Convert.ToInt32(Request.QueryString["userid"]);
                    tbladmin u = db.tbladmins.FirstOrDefault(v => v.userid == userid);

                    u.useremail = txtemail.Text;
                    u.username = txtusername.Text;
                    string encpassword = Encryptdata(txtpassword.Text);
                    u.password = encpassword;
                    u.status = true;
                    db.SaveChanges();

                    dvsuccess.InnerText = "Updated Successfully";
                    dvsuccess.Visible = true;
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
        private string Decryptdata(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;
        }

    }
}