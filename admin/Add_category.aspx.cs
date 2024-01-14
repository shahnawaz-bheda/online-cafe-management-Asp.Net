using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Add_category : System.Web.UI.Page
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
            reset();
        }
    }
    void bindgrid()
    {
        qry = "select * from admin_cat";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }

    protected void btnaddcat_Click(object sender, EventArgs e)
    {
        byte[] imgByte = new Byte[fldgrp.PostedFile.ContentLength];
        fldgrp.PostedFile.InputStream.Read(imgByte, 0, imgByte.Length);

        qry = "INSERT INTO admin_cat VALUES( ";
        qry += "(SELECT MAX (cat_id)+1 FROM admin_cat), ";
        qry += "'" + txtaddcat.Text + "', ";
        qry += "@img, ";
        qry += "'" + fldgrp.PostedFile.ContentType + "','True' ";
        qry += ")";


        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry,cnn);


        cmd.Parameters.AddWithValue("@img", imgByte);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        bindgrid();
        reset();
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

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        byte[] imgtype = null;

        FileUpload fld = (FileUpload)GridView1.Rows[e.RowIndex].Cells[1].FindControl("fldgrp");
        qry = "UPDATE admin_cat SET ";
        if (fld.PostedFile.ContentLength > 0)
        {
            imgtype = new byte[fld.PostedFile.ContentLength];
            fld.PostedFile.InputStream.Read(imgtype, 0, imgtype.Length);
        }

        if (fld.PostedFile.ContentLength > 0)
        {
            qry += "cat_image = @img, ";
            qry += "cat_imagetype = '" + fld.PostedFile.ContentType + "', ";
        }

        qry += "cat_name = '" + ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("txtname")).Text + "' ";

        qry += "WHERE cat_id = " + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("lblid")).Text;

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
        qry += "DELETE FROM admin_cat WHERE cat_id =" + ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("lblid")).Text;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        GridView1.EditIndex = -1;
        bindgrid();
    }
    void reset()
    {
        txtaddcat.Text = " ";

    }

}