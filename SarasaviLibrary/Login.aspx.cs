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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com, com1;
        DataTable dt;
        SqlDataAdapter da;
        SqlDataReader dr, dr1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogIn(object sender, EventArgs e)
        { 
            con.Open();
            com = new SqlCommand("SELECT * FROM Register WHERE UName='" + txtUName.Text + "' and Pass='" + txtPass.Text + "'", con);
            da = new SqlDataAdapter(com);
            
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                lbl1.Text = dr["FName"].ToString();
                lbl2.Text = dr["LName"].ToString();
            }
            dr.Close();

            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Session["User"] = txtUName.Text;
                Session["FName"] = lbl1.Text;
                Session["LName"] = lbl2.Text;
                Session["FLName"] = lbl1.Text + " " + lbl2.Text;
                Message.Visible = true;
                Message.Text = Session["FLName"].ToString() + " Login Success!!!";
            }
            else
            {
                FailureText.Visible = true;
                FailureText.Text = "Invalid username or password.";
            }

            string sql = "SELECT * FROM Register as r Inner Join MRegistration as m on r.UName = m.UName WHERE r.UName='" + txtUName.Text + "'";
            com1 = new SqlCommand(sql, con);
            dr1 = com1.ExecuteReader();
            while (dr1.Read())
            {
                lbl4.Text = dr1["MNo"].ToString();
                lbl5.Text = dr1["MName"].ToString();
                Session["MNo"] = lbl4.Text;
                Session["MName"] = lbl5.Text;
            }
            con.Close();
        }
    }
}