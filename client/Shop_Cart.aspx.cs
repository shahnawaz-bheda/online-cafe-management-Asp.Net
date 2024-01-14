using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cafe_management_client_Shop_Cart : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("srno");
            dt.Columns.Add("prod_id");
            dt.Columns.Add("prod_name");
            dt.Columns.Add("quantity");
            dt.Columns.Add("prod_price");
            dt.Columns.Add("totalprice");
            dt.Columns.Add("prod_image");


            if (Request.QueryString["prod_id"] != null)
            {
                if (Session["Addtocart"] == null)
                {
                    dr = dt.NewRow();
                    qry = "SELECT prod_id,prod_name,prod_price,prod_image FROM admin_prod WHERE prod_id = " + Request.QueryString["prod_id"];

                    cnn = new SqlConnection(cnstr);
                    cmd = new SqlCommand(qry, cnn);

                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);

                    dr["srno"] = 1;
                    dr["prod_id"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                    dr["prod_name"] = ds.Tables[0].Rows[0]["prod_name"].ToString();
                    //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                    dr["prod_image"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                    dr["quantity"] = Request.QueryString["QTY"].ToString();
                    dr["prod_price"] = ds.Tables[0].Rows[0]["prod_price"].ToString();

                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["prod_price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["QTY"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["Addtocart"] = dt;
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    Response.Redirect("Shop_Cart.aspx");


                }
                else
                {
                    dt = (DataTable)Session["Addtocart"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    qry = "SELECT prod_id,prod_name,prod_price,prod_image FROM admin_prod WHERE prod_id= " + Request.QueryString["prod_id"];

                    cnn = new SqlConnection(cnstr);
                    cmd = new SqlCommand(qry, cnn);

                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);


                    dr["srno"] = sr + 1;
                    dr["prod_id"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                    dr["prod_name"] = ds.Tables[0].Rows[0]["prod_name"].ToString();
                    //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                    dr["prod_image"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                    dr["quantity"] = Request.QueryString["QTY"].ToString();
                    dr["prod_price"] = ds.Tables[0].Rows[0]["prod_price"].ToString();

                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["prod_price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["QTY"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["Addtocart"] = dt;
                    GridView1.FooterRow.Cells[5].Text = "Total Amount:";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    Response.Redirect("Shop_Cart.aspx");
                }
            }
            else {

                dt = (DataTable)Session["Addtocart"];
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                
                }

            
            }
           
        }
       
    }
    public int grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["Addtocart"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int gtotal = 0;
        while (i < nrow)
        {
            gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

            i = i + 1;
        }
        return gtotal;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["Addtocart"];


        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["srno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);

            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                break;

            }
        }

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["srno"] = i;
            dt.AcceptChanges();
        }
        Session["Addtocart"] = dt;
        Response.Redirect("Shop_Cart.aspx");
    }
    protected void Btncheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("PlaceOrder.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Modify_order.aspx?srno="+ GridView1.SelectedRow.Cells[0].Text);
    }
}
