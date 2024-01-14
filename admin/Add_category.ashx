<%@ WebHandler Language="C#" Class="Add_category" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class Add_category : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.QueryString["myimg"] != null)
        {
            string cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString.ToString();
            string qry = "SELECT cat_image FROM admin_cat WHERE cat_isact='TRUE' AND cat_id= " + context.Request.QueryString["myimg"].ToString();
            
            SqlConnection cnn = new SqlConnection(cnstr); ;
            SqlCommand cmd = new SqlCommand(qry, cnn);
            
            cnn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                context.Response.BinaryWrite((byte[]) dr["cat_image"]);

            }
            dr.Close();
            cnn.Close();
            context.Response.Flush();
            context.Response.End();

        }
        else throw new ArgumentException("INVALIAD IMAGE....");
    }
    public bool IsReusable 
    {
        get 
        {
            return false;
        }
    }

}