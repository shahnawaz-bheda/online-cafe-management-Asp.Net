using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cafe_management_client_Modify_order : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["srno"] != null)
            {
                dt = (DataTable)Session["Addtocart"];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int sr;
                    int sr1;

                    sr = Convert.ToInt32(dt.Rows[i]["srno"].ToString());
                    Label1.Text = Request.QueryString["srno"];
                    Label2.Text = sr.ToString();
                    sr1 = Convert.ToInt32(Label1.Text);

                    if (sr == sr1)
                    {
                        Label1.Text = dt.Rows[i]["srno"].ToString();
                        Label2.Text = dt.Rows[i]["prod_id"].ToString();
                        Label3.Text = dt.Rows[i]["prod_name"].ToString();
                        DropDownList1.Text = dt.Rows[i]["quantity"].ToString();
                        Label4.Text = dt.Rows[i]["prod_price"].ToString();
                        Label5.Text = dt.Rows[i]["totalprice"].ToString();

                        break;
                    }


                }
         
        }
           }
            else{}
            }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int qun;
        qun = Convert.ToInt32(DropDownList1.Text);
        int price;
        price = Convert.ToInt32(Label4.Text);
        int totprice;
        totprice = price * qun;
        Label5.Text = totprice.ToString();
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["Addtocart"];

        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;

            sr = Convert.ToInt32(dt.Rows[i]["srno"].ToString());

            sr1 = Convert.ToInt32(Label1.Text);

            if (sr == sr1)
            {
                dt.Rows[i]["srno"] = Label1.Text;
                dt.Rows[i]["prod_id"] = Label2.Text;
                dt.Rows[i]["prod_name"] = Label3.Text;
                dt.Rows[i]["quantity"] = DropDownList1.Text;
                dt.Rows[i]["prod_price"] = Label4.Text;
                dt.Rows[i]["totalprice"] = Label5.Text;

                dt.AcceptChanges();

                break;
            }
        }

        Response.Redirect("Shop_Cart.aspx");
    }

}
