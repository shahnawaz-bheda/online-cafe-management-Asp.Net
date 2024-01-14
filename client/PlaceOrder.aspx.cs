using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class client_PlaceOrder : System.Web.UI.Page
{
    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;


    protected void Page_Load(object sender, EventArgs e)
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
                qry = "SELECT prod_id,prod_name,prod_price FROM admin_prod WHERE prod_id = " + Request.QueryString["prod_id"];

                cnn = new SqlConnection(cnstr);
                cmd = new SqlCommand(qry, cnn);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);

                dr["srno"] = 1;
                dr["prod_id"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                dr["prod_name"] = ds.Tables[0].Rows[0]["prod_name"].ToString();
                //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
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
                qry = "SELECT prod_id,prod_name,prod_price FROM admin_prod WHERE prod_id= " + Request.QueryString["prod_id"];

                cnn = new SqlConnection(cnstr);
                cmd = new SqlCommand(qry, cnn);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);


                dr["srno"] = sr + 1;
                dr["prod_id"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
                dr["prod_name"] = ds.Tables[0].Rows[0]["prod_name"].ToString();
                //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                //dr["prod_image"] = ds.Tables[0].Rows[0]["prod_id"].ToString();
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
        }
        else
        {

            dt = (DataTable)Session["Addtocart"];
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (GridView1.Rows.Count > 0)
            {
                GridView1.FooterRow.Cells[5].Text = "Total Amount";
                GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

            }


        }

        date.Text = DateTime.Now.ToShortDateString();
        findorderid();
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

    public void findorderid()
    {
        string pass = "abcdefghijklmnopqrstuvwxyz123456789";
        Random r = new Random();
        char[] mypass= new char[5];

        for (int i = 0; i < 5; i++)
        {
            mypass[i] = pass[(int)(35 * r.NextDouble())];

        }
        string orderid;
        orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);
        lblorder.Text = orderid;

    }
    public void saveaddress()
    {
        string updatepass = "INSERT INTO Order_address(order_id,address,mobileno) Values('"+lblorder.Text+"','"+txtaddress.Text+"','"+txtmobile.Text+"')";
        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(updatepass,cnn);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }



    protected void btnplaceorder_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["Addtocart"];
        
        for(int i = 0;i <= dt.Rows.Count - 1;i++)
        {
            qry = "INSERT INTO order_DetailS(order_id,srno,prod_id,prod_name,prod_price,quantity,totalprice,dateoforder) VALUES('" + lblorder.Text + "'," + dt.Rows[i]["srno"] + "," + dt.Rows[i]["prod_id"] + ",'" + dt.Rows[i]["prod_name"] + "'," + dt.Rows[i]["prod_price"] + "," + dt.Rows[i]["quantity"] + "," + dt.Rows[i]["totalprice"] +",'"+DateTime.Now.ToString("yyyy-MM-dd")+"')";

            cnn = new SqlConnection(cnstr);
            cmd = new SqlCommand(qry,cnn);

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        qry = "INSERT INTO invoice_detail VALUES (";
        qry += "(SELECT MAX(order_id) FROM order_Details), ";
        qry += "(SELECT MAX(invoice_id)+1 FROM invoice_detail), ";
        qry += "'TRUE')";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry, cnn);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        saveaddress();
        Response.Redirect("Placed_successfully.aspx?orderid="+lblorder.Text);
    }
}