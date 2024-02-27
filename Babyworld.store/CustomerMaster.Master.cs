using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class CustomerMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerRegistration.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }

        protected void btnhome_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "home")
            {
                Response.Redirect("Homepage.aspx");
            }
            else if (e.CommandName == "cart")
            {
                Response.Redirect("ShoppingCart.aspx");
            }
            else if (e.CommandName == "checkout")
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                Response.Redirect("Contact.aspx");
            }
        }

        protected void btncart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void logo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}