using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Babyworld.store
{
    public partial class Ecommerce : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }

        protected void admin_management_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_management.aspx");
        }

        protected void allproducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Allproducts.aspx");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void btnNewAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignup.aspx");
        }

        protected void btnNewProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Addproduct.aspx");
        }
    }
}