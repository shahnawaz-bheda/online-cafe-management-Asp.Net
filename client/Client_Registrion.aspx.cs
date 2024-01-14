using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Registrion : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            male.Checked = false;
            female.Checked = false;
        }

    }
    protected void Unnamed10_Click(object sender, EventArgs e)
    {
        if (male.Checked == true || female.Checked == true)
        {
            qry = "insert into client_reg Values( ";
            qry += "(select Max(client_id)+1 from client_reg) ,";
            qry += "'" + txtname.Text.ToString() + "' ,";
            if (male.Checked == true)
            {
                qry += "' Male ', ";
            }
            if (female.Checked == true)
            {
                qry += "' Female ', ";
            }
            qry += "'" + txtcity.Text.ToString() + "' ,";
            qry += "'" + txtcontact.Text.ToString() + "' ,";
            qry += "'" + txtemail.Text.ToString() + "' ,";
            qry += "'" + txtpass.Text.ToString() + "' ,";
            qry += "'TRUE' )";

            cnn = new SqlConnection(cnstr);
            cmd = new SqlCommand(qry, cnn);

            Response.Redirect("client_home.aspx");

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();

            reset();
        }
    }
   
    
    protected void Btnreset_Click(object sender, EventArgs e)
    {
        reset();    
    }
    void reset()
    {
        id.Text = "";
        txtname.Text = "";
        txtcity.Text = "";
        txtcontact.Text = "";
        txtemail.Text = "";
        txtpass.Text = "";
        txtcpass.Text = "";
  
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
            }
}