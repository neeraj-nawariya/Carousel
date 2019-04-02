using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Crousel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    public void BindGrid()
    {
        SqlDataAdapter adp = new SqlDataAdapter("Select * from Tb_photo", con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        mylist.DataSource = dt;
        mylist.DataBind();
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if (file.HasFile)  //fileupload control contains a file  
            file.SaveAs(Server.MapPath("~/img/") + file.FileName);
        string PhotoPath = tb_imagename.Text;
        tb_imagename.Text = "";
        string query = "INSERT INTO Tb_photo VALUES(@photoname, @PhotoPath)";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@photoname", PhotoPath);
                cmd.Parameters.AddWithValue("@PhotoPath", file.FileName);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                msg.InnerText = "Data Submit Successfully!";
                BindGrid();
                con.Close();
            }
        }
    }
    protected void Submit_btn_Click(object sender, EventArgs e)
    {
        if (file.HasFile)  //fileupload control contains a file  
        file.SaveAs(Server.MapPath("~/img/") + file.FileName);
        string ImageName = tb_imagename.Text;
        tb_imagename.Text = "";
        string query = "INSERT INTO Tb_photo VALUES(@photoname, @PhotoPath)";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@photoname", ImageName);
                cmd.Parameters.AddWithValue("@PhotoPath", file.FileName);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                msg.InnerText = "Data Submit Successfully!";
                BindGrid();
                con.Close();
            }
        }
    }
}