using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Unnamed5_Click(object sender, EventArgs e)
    {
        qry = "select * from client_reg ";
        qry += "where ";
        qry += "email='" + name.Text.Trim() + "' AND ";
        qry += "password='" + password.Text.Trim() + "'";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
       

        if (ds.Tables[0].Rows.Count == 1)
        {
            this.Visible = false;
            Response.Redirect("client_home.aspx");
            
        }
        else
        {
            Response.Write("Invalid....!");

        }
    }
}