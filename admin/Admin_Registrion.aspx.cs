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
            reset();
            bindmygrid();
            male.Checked = false;
            female.Checked = false;
        }

    }
    void bindmygrid()
    {
        qry = "select * from admin_reg";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

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
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindmygrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindmygrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

       
            qry = "update admin_reg set name='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("txtname")).Text+ "', ";
            qry += "gender='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("txtgender")).Text + "', ";
            qry += "city='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].FindControl("txtcity")).Text + "', ";
            qry += "contact_no='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].FindControl("txtcontact")).Text + "', ";
            qry += "email='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("txtemail")).Text + "', ";
            qry += "password='" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("txtpassword")).Text + "' ";
            qry += "where reg_id=" + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("lblid")).Text;

            cnn = new SqlConnection(cnstr);
            cmd = new SqlCommand(qry, cnn);
            cnn.Open();

            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            bindmygrid();

           
       
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
           qry = "Delete FROM admin_reg  WHERE reg_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("lblid")).Text;

            cnn = new SqlConnection(cnstr);
            cmd = new SqlCommand(qry, cnn);

            cnn.Open();

            cmd.ExecuteNonQuery();
            bindmygrid();

        
     
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (male.Checked == true || female.Checked == true)
        {
            qry = "insert into admin_reg Values( ";
            qry += "(select Max(reg_id)+1 from admin_reg) ,";
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

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            bindmygrid();
            reset();
            Response.Redirect("Admin_Home.aspx");
        }
    }
}