<%@ WebHandler Language="C#" Class="view_Subcategory" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class view_Subcategory : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       
        if (context.Request.QueryString["myimg"] != null)
        {
            string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString.ToString();
            string qry = "SELECT subcat_image FROM admin_subcat WHERE subcat_isact='TRUE' AND subcat_id= " + context.Request.QueryString["myimg"].ToString();

            SqlConnection cnn = new SqlConnection(cnstr); ;
            SqlCommand cmd = new SqlCommand(qry, cnn);

            cnn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                context.Response.BinaryWrite((byte[])dr["subcat_image"]);

            }
            dr.Close();
            cnn.Close();
            context.Response.Flush();
            context.Response.End();

        }
        else throw new ArgumentException("INVALIAD IMAGE....");
         
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}