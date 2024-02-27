using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Babyworld.store
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Button btnlogout = (Button)Page.Master.FindControl("btnlogout");
            btnlogout.Visible = false;
        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            using (EcommerceProjectDBEntities db = new EcommerceProjectDBEntities())
            {

                var chkemail = db.chk_customer_email(txtcustomeremail.Text).ToList();

                if (chkemail.Count > 0)
                {
                    lblerrormsg.Text = "Email Already Exists";
                }
                else
                {
                    tblcustomer c = new tblcustomer();
                    c.customeremail = txtcustomeremail.Text;
                    c.customername = txtcustomername.Text;
                    string encpassword = Encryptdata(txtpassword.Text);
                    c.password = encpassword;
                    c.status = true;

                    db.tblcustomers.Add(c);
                    db.SaveChanges();

                    dvsuccess.InnerText = "Registration Successful";
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