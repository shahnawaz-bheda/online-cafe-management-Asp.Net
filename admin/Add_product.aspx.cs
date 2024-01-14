using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class cafe_management_Add_product : System.Web.UI.Page
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
            bindddlcat();
            bindddlsubcat();
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        byte[] imgtype = null;

        FileUpload fld = (FileUpload)GridView1.Rows[e.RowIndex].Cells[1].FindControl("fldgrp");
        qry = "UPDATE admin_prod SET ";
        if (fld.PostedFile.ContentLength > 0)
        {
            imgtype = new byte[fld.PostedFile.ContentLength];
            fld.PostedFile.InputStream.Read(imgtype, 0, imgtype.Length);
        }

        if (fld.PostedFile.ContentLength > 0)
        {
            qry += "prod_image = @img, ";
            qry += "prod_imagetype = '" + fld.PostedFile.ContentType + "', ";
        }

        qry += "prod_name= '" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("txtname")).Text + "', ";
        qry += "prod_price= " + ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].FindControl("txtprice")).Text + " ,";
        qry += "prod_Descriptions= '" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].FindControl("txtdesc")).Text + "' ";
        qry += "WHERE prod_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("prodid")).Text;

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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        qry += "DELETE FROM admin_prod  WHERE prod_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("prodid")).Text;

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
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
 
    void bindgrid()
    {
        qry = "SELECT prod_id,prod_name,prod_image,prod_price,prod_Descriptions FROM admin_prod";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);


        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }

    void bindddlcat()
    {
        qry = "Select cat_id,cat_name From admin_cat order by cat_id";

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

    void bindddlsubcat()
    {
        qry = "Select * From admin_subcat where cat_id=" + ddlcat.SelectedValue;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        ddlsubcat.DataSource = ds.Tables[0];
        ddlsubcat.DataValueField = "subcat_id";
        ddlsubcat.DataTextField = "subcat_name";
        ddlsubcat.DataBind();

        ddlsubcat.Items.Insert(0, new ListItem("Select Subcategory", "0"));
    }
    protected void btnprod_Click1(object sender, EventArgs e)
    {
        byte[] imgByte = new Byte[fldprod.PostedFile.ContentLength];
        fldprod.PostedFile.InputStream.Read(imgByte, 0, imgByte.Length);

        qry = "INSERT INTO admin_prod VALUES( ";
        qry += "(SELECT MAX (prod_id)+1 FROM admin_prod), ";
        qry += "" + ddlsubcat.SelectedValue.ToString() + ",";
        qry += "'" + txtaddproduct.Text + "', ";
        qry += "'" + txtprice.Text + "',";
        qry += "@img, ";
        qry += "'" + fldprod.PostedFile.ContentType + "',";
        qry += "'" + txtdesc.Text + "','True'";
        qry += ")";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);


        cmd.Parameters.AddWithValue("@img", imgByte);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        bindgrid();
        clear();
    }
    protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindddlsubcat();
    }

    void clear()
    {
        txtaddproduct.Text = "";
        txtprice.Text = "";
        txtdesc.Text = "";
       
    }
}