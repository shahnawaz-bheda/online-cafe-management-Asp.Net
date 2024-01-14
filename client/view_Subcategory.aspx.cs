using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cafe_management_client_view_Subcategory : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;

    int cat_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        cat_id = int.Parse(Session["cat"].ToString());

        if(!IsPostBack)
        bindmygrid();

    }

    void bindmygrid()
    {
        qry = "select subcat_id, subcat_image,subcat_name from admin_subcat where cat_id="+cat_id;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);


        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "subcat")
        {
            Session["subcat"] = e.CommandArgument.ToString();
            Response.Redirect("View_Product.aspx");
        }
    }
}