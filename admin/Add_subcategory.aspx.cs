using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cafe_management_Add_subcategory : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            bindDdlcat(ddlcat);
            reset();
        }
    }

    void bindgrid()
    {
        qry = "SELECT subcat_id,subcat_name,subcat_image FROM admin_subcat";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    void bindDdlcat(DropDownList ddlcat)
    {
        qry = "Select cat_id,cat_name From admin_cat order by cat_name";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        ddlcat.DataSource = ds.Tables[0];
        ddlcat.DataValueField = "cat_id";
        ddlcat.DataTextField = "cat_name";
        ddlcat.DataBind();


        ddlcat.Items.Insert(0, new ListItem("Select Category", "0"));
    }   
    protected void btnsubcat_Click1(object sender, EventArgs e)
    {
        byte[] imgByte = new Byte[fldsubcat.PostedFile.ContentLength];
        fldsubcat.PostedFile.InputStream.Read(imgByte, 0, imgByte.Length);

        qry = "INSERT INTO admin_subcat VALUES( ";
        qry += "(SELECT MAX (subcat_id)+1 FROM admin_subcat), ";
        qry += "" + ddlcat.SelectedValue.ToString() + ",";
        qry += "'" + txtsubcat.Text + "', ";
        qry += "@img, ";
        qry += "'" + fldsubcat.PostedFile.ContentType + "','True' ";
        qry += ")";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);


        cmd.Parameters.AddWithValue("@img", imgByte);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        bindgrid();
       
    }
    void reset()
    {
        txtsubcat.Text = " ";
    }
  

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        byte[] imgtype = null;

        FileUpload fld = (FileUpload)GridView1.Rows[e.RowIndex].Cells[1].FindControl("fldgrp");
        qry = "UPDATE admin_subcat SET ";
        if (fld.PostedFile.ContentLength > 0)
        {
            imgtype = new byte[fld.PostedFile.ContentLength];
            fld.PostedFile.InputStream.Read(imgtype, 0, imgtype.Length);
        }

        if (fld.PostedFile.ContentLength > 0)
        {
            qry += "subcat_image = @img, ";
            qry += "subcat_imagetype = '" + fld.PostedFile.ContentType + "', ";
        }

        qry += "subcat_name = '" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("txtname")).Text + "' ";

        qry += "WHERE subcat_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("subid")).Text;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        if (fld.PostedFile.ContentLength > 0)
            cmd.Parameters.AddWithValue("@img", imgtype);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        GridView1.EditIndex = -1;
        bindgrid();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;
        bindgrid();
   
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        qry += "DELETE FROM admin_subcat  WHERE subcat_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("subid")).Text;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        GridView1.EditIndex = -1;
        bindgrid();

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
}