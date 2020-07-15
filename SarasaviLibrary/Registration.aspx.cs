using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SarasaviLibrary
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "Select * From Register Where UName='" + txtUName.Text + "'";
            com = new SqlCommand(sql, con);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                ErrorMessage.Text = "User Name Allready Added...";
                
            }               
            else{
                dr.Close();
                com = con.CreateCommand();
                com.CommandText = "INSERT INTO Register VALUES ('" + txtFName.Text + "', '" + txtLName.Text + "','" + txtUName.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtConfirmPassword.Text + "','Visitor')";
                com.ExecuteNonQuery();
                SuccessMessage.Text = "SignUp Successfully...";
            }
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtConfirmPassword.Text = "";
            txtEmail.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtPassword.Text = "";
            txtUName.Text = "";
            txtFName.Focus();
        }
    }
}