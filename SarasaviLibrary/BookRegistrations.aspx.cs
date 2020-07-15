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
    public partial class BookRegistrations : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=E:\Assignment\ASP.Net\SarasaviLibrary\SarasaviLibrary\App_Data\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Insert();
        }

        private void Insert()
        {
            try
            {
                con.Open();
                com = new SqlCommand("SELECT * FROM BRegistration WHERE BName='" + txtBName.Text + "'", con);
                com.ExecuteNonQuery();
                dt = new DataTable();
                if (dt.Rows.Count == 1){
                    Error.Text = "Allready Added this Book....";
                }
                else
                {
                    if (txtFile.HasFile){
                        string FileName = txtFile.FileName.ToString();
                        txtFile.PostedFile.SaveAs(Server.MapPath("~/Images/" + FileName));
                        com = new SqlCommand("SELECT * FROM BRegistration WHERE BNo='" + txtBNo.Text + "'", con);
                        com.ExecuteNonQuery();
                        dt = new DataTable();
                        if (dt.Rows.Count == 1){
                            SqlCommand com1 = con.CreateCommand();
                            com1.CommandText = "UPDATE BRegistration SET NoCopies='" + txtNCopies.Text + "' WHERE BNo='" + txtBNo.Text + "' ";
                            com1.ExecuteNonQuery();
                            Success.Text = "Book Record Update Successfully";
                        }else{
                            SqlCommand com2 = con.CreateCommand();
                            com2.CommandText = "INSERT INTO BRegistration VALUES ('" + txtBNo.Text + "','" + txtBName.Text + "','" + cboBCatogarie.Text + "','" + cboBLanguage.Text + "','" + txtBISBN.Text + "','" + txtBAuthor.Text + "','" + dtpPublicatonDate.Text + "','" + txtBEdition.Text + "','" + txtNCopies.Text + "','" + FileName + "','" + txtPrice.Text + "')";
                            com2.ExecuteNonQuery();
                            Success.Text = "Book Record Insert Successfully";
                        }
                    }
                }
            }
            catch(Exception ex)
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
            txtBAuthor.Text = "";
            txtBEdition.Text = "";
            txtBISBN.Text = "";
            txtBName.Text = "";
            txtCat.Text = "";
            txtNo.Text = "";
            txtCNo.Text = "";
            txtNCopies.Text = "";
            txtPrice.Text = "";
            dtpPublicatonDate.Text = "";
            cboBCatogarie.SelectedIndex = 0;
            cboBLanguage.SelectedIndex = 0;
            txtBName.Focus();
        }

        private void AutoNumber()
        {
            com = new SqlCommand("SELECT COUNT(BNo) FROM BRegistration", con);
            con.Open();
            com.ExecuteNonQuery();
            int i = Convert.ToInt32(com.ExecuteScalar());
            i++;
            txtNo.Text = i.ToString();
            con.Close();                                              
        }

        protected void btnBNo_Click(object sender, EventArgs e)
        {
            string bno = txtCat.Text + txtNo.Text + txtCNo.Text;
            txtBNo.Text = bno.ToString();
        }

        protected void cboBCatogarie_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cat = cboBCatogarie.SelectedItem.Value;
            txtCat.Text = cat.ToString();
        }
    }
}