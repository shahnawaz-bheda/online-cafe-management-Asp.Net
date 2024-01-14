using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;


public partial class cafe_management_client_Placed_successfully : System.Web.UI.Page
{

    string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    SqlConnection cnn;
    SqlCommand cmd;
    string qry = string.Empty;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Request.QueryString["orderid"];
        findorderdate(Label1.Text);
        findaddress(Label1.Text);
        showgrid(Label1.Text);
    }
    protected void btnpdf_Click(object sender, EventArgs e)
    {
        exportpdf();
    }

    public void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-dispostion", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    void findorderdate(string orderid)
    {
        qry = "Select * from order_Details WHERE order_id='" + orderid + "'";
        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry,cnn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label6.Text = ds.Tables[0].Rows[0]["dateoforder"].ToString();
        }
        cnn.Open();
        cnn.Close();
    }

    void findaddress(string orderid)
    {
        qry = "SELECT * FROM Order_address WHERE order_id='"+orderid+"'";
        cnn = new SqlConnection(cnstr);

        cmd = new SqlCommand(qry, cnn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label7.Text = ds.Tables[0].Rows[0]["address"].ToString();
        }
        cnn.Open();
        cnn.Close();
    }
    void showgrid(string orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add("srno");
        dt.Columns.Add("prod_id");
        dt.Columns.Add("prod_name");
        dt.Columns.Add("quantity");
        dt.Columns.Add("prod_price");
        dt.Columns.Add("totalprice");
        
        qry="SELECT * FROM order_Details WHERE order_id='"+orderid+"'";

        cnn = new SqlConnection(cnstr);
        cmd = new SqlCommand(qry,cnn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        int grandtotal = 0;

        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["srno"] = ds.Tables[0].Rows[i]["srno"];
            dr["prod_id"] = ds.Tables[0].Rows[i]["prod_id"].ToString();
            dr["prod_name"] = ds.Tables[0].Rows[i]["prod_name"].ToString();
            dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
            dr["prod_price"] = ds.Tables[0].Rows[i]["prod_price"].ToString();
            int price = Convert.ToInt16(ds.Tables[0].Rows[i]["prod_price"].ToString());
            int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
            int totalprice = price * quantity;
            dr["totalprice"] = totalprice;
            grandtotal = grandtotal + totalprice;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();

        Label5.Text = grandtotal.ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
       
    }
    
}