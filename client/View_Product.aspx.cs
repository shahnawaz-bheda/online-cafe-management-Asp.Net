using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cafe_management_client_View_Product : System.Web.UI.Page
{

    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;

    int subcat_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        subcat_id = int.Parse(Session["subcat"].ToString());

        if (!IsPostBack)
            binddatalist();

        DataTable dt = new DataTable();
        dt = (DataTable)Session["Addtocart"];

       
    }

    void binddatalist()
    {
        qry = "SELECT prod_id,prod_name,prod_price,prod_image FROM admin_prod WHERE subcat_id="+subcat_id;

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DataList1.DataSource = ds.Tables[0];
        DataList1.DataBind();
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName == "Addtocart")
        {
            DropDownList ddllist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("Shop_Cart.aspx?prod_id=" + e.CommandArgument.ToString() + "&QTY=" + ddllist.SelectedItem.ToString());
        }
    }
}
