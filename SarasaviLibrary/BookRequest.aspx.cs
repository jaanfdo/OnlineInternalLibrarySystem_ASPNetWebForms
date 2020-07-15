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
    public partial class BookRequest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataReader dr;
        SqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            DisImage();
            DisDetails();
            DisDateTim();
            DisUser();
            Agree();
            DisImages();

        }

        private void DisDateTim()
        {
            DateTime today = DateTime.Now;
            lblBBD.Text = ("Book Barow Date is " +today.ToString("D") + ".");
            lbl4.Text = (today.ToString("d"));

            DateTime sevendays = DateTime.Now.AddDays(7);
            lblBRD.Text = ("Book Return Date is "  +sevendays.ToString("D")+ ".");
            lbl5.Text = (sevendays.ToString("d"));

            DateTime today1 = DateTime.Now;
            lblBRFD.Text = ("Book Refer Date is " +today1.ToString("D")+ ".");
            lbl1.Text = (today1.ToString("d"));

            DateTime hrs = DateTime.Now;
            lblRT.Text = ("Book Refer Time is " +hrs.ToString("t")+ ".");
            lbl2.Text = (hrs.ToString("T"));

            DateTime fivehrs = DateTime.Now.AddHours(5);
            lblRET.Text = ("Book Refer End is " +fivehrs.ToString("t")+ ".");
            lbl3.Text = (fivehrs.ToString("T"));
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

        private void DisImage()
        {
            string id = Request.QueryString["id"];
            con.Open();
            da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE BNo='" + id + "'", con);
            dt = new DataTable();
            da.Fill(dt);
            RDetails.DataSource = dt;
            RDetails.DataBind();
            con.Close();
        }

        private void DisDetails()
        {
            string id = Request.QueryString["id"];
            con.Open();
            com = new SqlCommand("SELECT * FROM BRegistration WHERE BNo='" + id + "'", con);
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                lblBNo.Text = dr["BNo"].ToString();
                lblBName.Text = dr["BName"].ToString();
            }
            con.Close();
        }

        private void DisImages()
        {
            con.Open();
            da = new SqlDataAdapter("SELECT TOP 4 * FROM BRegistration as BR INNER JOIN BReffer as R ON BR.BNo=R.BNo INNER JOIN BBarrow as B ON BR.BNo=B.BNo", con);
            ds = new DataSet();
            da.Fill(ds);
            RImages.DataSource = ds;
            RImages.DataBind();
            con.Close();
        }

        private void Agree()
        {
            if (chkBarrow.Checked == true)
            {
                btnRefer.Enabled = true;
            }
            else if (chkRefer.Checked == true)
            {
                btnBarrow.Enabled = true;
            }
        }

        protected void chkRefer_CheckedChanged(object sender, EventArgs e)
        {
            if (chkRefer.Checked == true)
            {
                btnRefer.Enabled = true;
            }
        }

        protected void chkBarrow_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBarrow.Checked == true)
            {
                btnBarrow.Enabled = true;
            }
        }

        protected void btnRefer_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                com = con.CreateCommand();
                com.CommandText = "INSERT INTO BReffer VALUES ('" + lblUName.Text + "','" + lblBNo.Text + "','" + lblBName.Text + "','" + lbl1.Text + "','" + lbl2.Text + "','" + lbl3.Text + "')";
                com.ExecuteNonQuery();
                Literal1.Visible = true;
                Literal1.Text = "Your Book Can Refer Now...";
            }
            catch(Exception ex)
            {
                Literal2.Text = ex.ToString();
            }
            con.Close();
        }

        protected void btnBarrow_Click(object sender, EventArgs e)
        {
            if (lblUName.Text == "")
            {
                Literal4.Text = "Firstly, Login to Your Account...";
            }
            else if (lblMNo.Text == "")
            {
                Literal4.Text = "Register As a Member to Barrow this Book....";
            }
            else
            {
                try
                {
                    con.Open();
                    com = con.CreateCommand();
                    com.CommandText = "INSERT INTO Cart VALUES ('" + lblUName.Text + "','" + lblMNo.Text + "','" + lblMName.Text + "','" + lblBNo.Text + "','" + lblBName.Text + "','" + txtNoCopies.Text + "','" + lbl4.Text + "','" + lbl5.Text + "')";
                    com.ExecuteNonQuery();

                    com = new SqlCommand("SELECT * FROM BRegistration WHERE BNo='" + lblBNo.Text + "'", con);
                    dr = com.ExecuteReader();
                    if (dr.Read())
                    {
                        int copies = Convert.ToInt32(dr["NoCopies"].ToString());
                        int rcopies = Convert.ToInt32(txtNoCopies.Text);
                        string ncopies = Convert.ToString(copies - rcopies);
                        dr.Close();
                        SqlCommand com1 = con.CreateCommand();
                        com1.CommandText = "UPDATE BRegistration SET NoCopies='" + ncopies + "' WHERE BNo='" + lblBNo.Text + "'";
                        com1.ExecuteNonQuery();
                        Response.Redirect("BookCart.aspx");  
                    }
                }
                catch (Exception ex)
                {
                    Literal4.Text = ex.ToString();
                }
                
                con.Close();
            }
        }

        protected void lnkRALL_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }
    }
}