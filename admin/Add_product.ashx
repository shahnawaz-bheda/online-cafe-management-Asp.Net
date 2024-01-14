<%@ WebHandler Language="C#" Class="Add_product" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Add_product : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.QueryString["myimg"] != null)
        {
            string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString.ToString();
            string qry = "SELECT prod_image FROM admin_prod WHERE prod_isact='TRUE' AND prod_id= " + context.Request.QueryString["myimg"].ToString();

            SqlConnection cnn = new SqlConnection(cnstr); ;
            SqlCommand cmd = new SqlCommand(qry, cnn);

            cnn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                try
                {
                    context.Response.BinaryWrite((byte[])dr["prod_image"]);
                }
                catch { }

            }
            dr.Close();
            cnn.Close();
            context.Response.Flush();
            context.Response.End();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}