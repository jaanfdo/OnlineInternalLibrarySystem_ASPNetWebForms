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
    public partial class UserRegistration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AutoNumber();
            }
            if (Session["User"] != null)
            {
                txtUName.Text = Session["User"].ToString();
            }
            if (Session["FLName"] != null)
            {
                txtMName.Text = Session["FLName"].ToString();
            }
        }

        private void AutoNumber()
        {
            con.Open();
            com = new SqlCommand("SELECT COUNT(MNo) FROM MRegistration", con);
            com.ExecuteNonQuery();
            int i = Convert.ToInt32(com.ExecuteScalar());
            i++;
            txtMNo.Text = i.ToString();
            con.Close();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "Select * From MRegistration Where UName='" + txtUName.Text + "'";
            com = new SqlCommand(sql, con);
            dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                FailerText.Text = "User Name Allready Added...";
            }
            else
            {
                dr.Close();
                try
                {
                    com = con.CreateCommand();
                    com.CommandText = "INSERT INTO MRegistration VALUES ('" + txtMNo.Text + "','" + txtMName.Text + "','"+txtUName.Text+"','" + txtAddress.Text + "','"+rdoGender.Text+"','" + txtNIC.Text + "','" + txtTelNo.Text + "')";
                    com.ExecuteNonQuery();
                    Session["MNo"] = txtMNo.Text;
                    Session["MName"] = txtMName.Text;

                    SuccessText.Text = "You are Successfully Get MemberShip...";
                }
                catch(Exception ex)
                {
                    FailerText.Text = ex.ToString();
                }
            }
            con.Close();
        }

        private void Clear()
        {
            txtAddress.Text = "";
            txtMName.Text = "";
            txtMNo.Text = "";
            txtNIC.Text = "";
            txtTelNo.Text = "";
            txtUName.Text = "";
            rdoGender.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}