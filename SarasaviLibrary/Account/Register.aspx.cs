using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SarasaviLibrary.Models;
using System.Data.SqlClient;

namespace SarasaviLibrary.Account
{
    public partial class Register : Page
    {

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { 
                UserName = txtEmail.Text, Email = txtEmail.Text
            };
            IdentityResult result = manager.Create(user, txtPassword.Text);
            if (result.Succeeded)
            {
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }


            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
            con.Open();
            SqlCommand com = con.CreateCommand();
            com.CommandText = "INSERT INTO Register VALUES ('"+ txtFName.Text +"', '" + txtLName.Text +"','"+txtUName.Text+"','"+txtEmail+"','"+txtPassword.Text+"','"+txtConfirmPassword.Text+"')";

            com.ExecuteNonQuery();

            Response.Redirect("~/Default.aspx");

        }
    }
}