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
    public partial class BookBarrow : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {   
            try
            {
                con.Open();
                com = con.CreateCommand();
                com.CommandText = "INSERT INTO BBarrow VALUES ('" + txtMNo.Text + "','" + txtMName.Text + "','" + txtBNo.Text + "','" + txtBName.Text + "','" + txtNACopies.Text + "','" + txtIDate.Text + "','" + txtDDate.Text + "')";
                com.ExecuteNonQuery();
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
            txtNACopies.Text = "";
            txtDDate.Text = "";
            txtIDate.Text = "";
            txtBNo.Focus();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            txtBNo.Text = row.Cells[0].Text;
            txtBName.Text = row.Cells[1].Text;
        }
    }
}