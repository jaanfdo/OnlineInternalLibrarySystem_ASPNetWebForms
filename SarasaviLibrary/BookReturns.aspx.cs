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
    public partial class BookReturns : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string ncopies;
        protected void btnSave_Click(object sender, EventArgs e)
        {      
            try
            {
                con.Open();
                com = con.CreateCommand();
                com.CommandText = "INSERT INTO BReturn VALUES ('" + txtMNo.Text + "','" + txtMName.Text + "','" + txtBNo.Text + "','" + txtBName.Text + "','" + txtNRCopies.Text + "','" + txtIDate.Text + "','" + txtDDate.Text + "','"+txtRDate.Text+"')";
                com.ExecuteNonQuery();

                com = new SqlCommand("SELECT * FROM BRegistration WHERE BNo='" + txtBNo.Text + "'", con);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    int copies = Convert.ToInt32(dr["NoCopies"].ToString());
                    int rcopies = Convert.ToInt32(txtNRCopies.Text);
                    ncopies = Convert.ToString(copies + rcopies);
                }
                dr.Close();
                SqlCommand com1 = con.CreateCommand();
                com1.CommandText = "UPDATE BRegistration SET NoCopies='" + ncopies + "' WHERE BNo='" + txtBNo.Text + "'";
                com1.ExecuteNonQuery();
                Success.Text = "Record Added Success";
            }
            catch (Exception ex)
            {
                Error.Text = ex.ToString();
            }
            con.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            txtBName.Text = "";
            txtBNo.Text = "";
            txtMName.Text = "";
            txtMNo.Text = "";
            txtRDate.Text = "";
            txtDDate.Text = "";
            txtIDate.Text = "";
            txtNRCopies.Text = "";
            txtBNo.Focus();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtBNo.Text = row.Cells[0].Text;
            txtBName.Text = row.Cells[1].Text;
        }
    }
}