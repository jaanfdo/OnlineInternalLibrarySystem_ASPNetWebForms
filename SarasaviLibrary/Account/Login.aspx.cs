using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SarasaviLibrary.Models;
using System.Data.SqlClient;
using System.Data;

namespace SarasaviLibrary.Account
{
    public partial class Login : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {          

        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = manager.Find(txtUName.Text, txtPass.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }

            valPass.Visible = true;
            valUName.Visible = true;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
            SqlCommand com;
            con.Open();
            com = new SqlCommand ("SELECT * FROM Register WHERE UName='"+txtUName.Text+"', Pass='"+txtPass.Text+"'", con);
            com.ExecuteNonQuery();

            DataTable dt = new DataTable();
            if(dt.Rows[0][0].ToString()=="1"){
                Session["User"] = txtUName.Text;
                Response.Redirect("~/Default.aspx");
            }else{
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
                //Response.Redirect("~/Login.aspx");
            }


        }
    }
}