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
    public partial class BookCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataReader dr;
        SqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                string user = Session["User"].ToString();
            }
            DisCounts();
            DisUser();
        }

        private void DisCounts()
        {
            if (Session["User"] != null)
            {
                string user = Session["User"].ToString();
                con.Open();
                com = new SqlCommand("SELECT Count(BNo) as BCount, Sum(NoCopies) as BSum FROM Cart WHERE UName='" + user + "'", con);
                dr = com.ExecuteReader();
                while (dr.Read())
                {
                    lblCount.Text = dr["BCount"].ToString();
                    lblSum.Text = dr["BSum"].ToString();
                }
                con.Close();
            }    
        }

        private void DisUser()
        {
            if (Session["MNo"] != null)
            {
                lblMNo.Text = Session["MNo"].ToString();
            }
            if (Session["MName"] != null)
            {
                lblMName.Text = Session["MName"].ToString();
            }
            if (Session["User"] != null)
            {
                lblUName.Text = Session["User"].ToString();
            }
        }

        protected void btnReserv_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                int m = Convert.ToInt32(lblSum.Text);
                if (m >= 5)
                {
                    Error.Text = "No of Quantities are Increase. Deleting Quantities more than 5";
                }
                else
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        com = con.CreateCommand();
                        com.CommandText = "INSERT INTO BBooks VALUES ('" + lblUName.Text + "','" + lblMNo.Text + "','" + lblMName.Text + "','" + txtCNo.Text + "','" + dtpRDate.Text + "',@bno,@bname,@nocopies,@idate,@ddate)";
                        com.Parameters.AddWithValue("@bno", row.Cells[0].Text);
                        com.Parameters.AddWithValue("@bname", row.Cells[1].Text);
                        com.Parameters.AddWithValue("@nocopies", row.Cells[2].Text);
                        com.Parameters.AddWithValue("@idate", row.Cells[3].Text);
                        com.Parameters.AddWithValue("@ddate", row.Cells[4].Text);
                        com.ExecuteNonQuery();
                    }                 

                    com = con.CreateCommand();
                    com.CommandText = "INSERT INTO BReserve VALUES ('" + lblUName.Text + "','" + lblMNo.Text + "','" + lblMName.Text + "','" + txtCNo.Text + "','" + dtpRDate.Text + "','" + lblCount.Text + "','" + lblSum.Text + "')";
                    com.ExecuteNonQuery();
                    Success.Visible = true;

                    SqlCommand com2 = con.CreateCommand();
                    com2.CommandText = "DELETE FROM Cart WHERE UName='" + lblUName.Text + "'";
                    com2.ExecuteNonQuery();
                    Success.Visible = true;
                    Success.Text = "Your Can Barrow Book Now...";
                }
            }
            catch (Exception ex)
            {
                Error.Text = ex.ToString();
            }
            con.Close();
        }
    }
}