using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class frm_tea : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            bindgrid();
    }
    void bindgrid()
    {
        qry = "SELECT cat_id,cat_image,cat_name FROM admin_cat";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);


        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }

    //protected void Btnview_Click(object sender, EventArgs e)
    //{
    //   Session["cat"] = 

        
    //}
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cat")
        {
            Session["cat"] = e.CommandArgument.ToString();
            Response.Redirect("view_Subcategory.aspx");
        }
    }
}