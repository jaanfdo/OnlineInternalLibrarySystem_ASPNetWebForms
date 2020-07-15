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
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\aspnet-SarasaviLibrary-20160315014708.mdf;Initial Catalog=aspnet-SarasaviLibrary-20160315014708;Integrated Security=True");

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FName"] != null)
            {
                lbluser.Text = Session["FName"].ToString();
            }

            All();
            InformationTechnology();
            Engineering();
            SocialScience();
            Games();
            Sports();
            RefImages();
            BImage();
        }

        private void All()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RALL.DataSource = ds;
            RALL.DataBind();
            con.Close();
        }

        private void InformationTechnology()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE Catogarie='Information Technology'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RIT.DataSource = ds;
            RIT.DataBind();
            con.Close();
        }
        private void Engineering()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE Catogarie='Engineering'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            REngineering.DataSource = ds;
            REngineering.DataBind();
            con.Close();
        }
        private void SocialScience()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE Catogarie='Social Science'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RSScience.DataSource = ds;
            RSScience.DataBind();
            con.Close();
        }
        private void Games()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE Catogarie='Games'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RGames.DataSource = ds;
            RGames.DataBind();
            con.Close();
        }
        private void Sports()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE Catogarie='Sports'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RSports.DataSource = ds;
            RSports.DataBind();
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BRegistration WHERE  BName LIKE'%" + txtSearch.Text + "%' or  Catogarie LIKE'%" + txtSearch.Text + "%' ", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RALL.DataSource = ds;
            RALL.DataBind();
            con.Close();
        }

        private void BImage()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 8 * FROM BBarrow as B INNER JOIN BRegistration as R ON B.BNo=R.BNo", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            BImages.DataSource = ds;
            BImages.DataBind();
            con.Close();
        }

        private void RefImages()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 8 * FROM BReffer as B INNER JOIN BRegistration as R ON B.BNo=R.BNo", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            RImages.DataSource = ds;
            RImages.DataBind();
            con.Close();
        }

        protected void lnkRALL_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }
        protected void lnkRIT_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkREngineering_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkRSScience_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkRGames_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkRSports_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkRI_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }

        protected void lnkBI_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRequest.aspx?id=" + ((LinkButton)sender).Text);
        }
    }
}