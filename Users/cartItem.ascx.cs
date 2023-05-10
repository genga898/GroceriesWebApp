using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp.Users
{
    public partial class cart : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProducts();
            }
        }

        protected void GetProducts()
        {
            DataSet ds = new DataSet();
            using (Database.Conn)
            {
                DataTable dt;
                SqlDataAdapter dataAdapter;
                string connectString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
                SqlConnection conn = new SqlConnection(connectString);
                string sqlText = "SELECT c.User_id, c.cart_id, p.ImageUrl, c.Product_id, c.Quantity, p.price, p.name,c.Quantity*p.price as TotalCost " +
                                 "FROM Cart c " +
                                 "full JOIN Products p ON c.Product_id = p.product_id " +
                                 $"WHERE c.User_id = '{Session["UserID"]}';";
                // Create a new SqlDataAdapter object using the query and connection
                dataAdapter = new SqlDataAdapter(sqlText, conn);

                // Fill the DataTable with data from the database using the data adapter

                dt = new DataTable();
                dataAdapter.Fill(dt);
                rprCartItem.DataSource = dt;
                rprCartItem.DataBind();
            }
        }

        protected void stopRefresh()
        {
            // Redirect to the same page using a GET request
            Response.Redirect(Request.Url.AbsoluteUri, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnRemove_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string btnRemove = btn.CommandArgument;
            SqlCommand cmd;
            string connectString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
            SqlConnection conn = new SqlConnection(connectString);
            string sqlText = "DELETE FROM Cart " +
                             $"WHERE User_id = '{Session["UserID"]}' AND cart_id = '{btnRemove}';";

            cmd = new SqlCommand();
            cmd.CommandText = sqlText;
            cmd.Connection = conn;

            conn.Open();
            cmd.ExecuteNonQuery();
            
            cmd.Dispose();
            conn.Close();
            string toast = "Toastify({\r\n            " +
                    "text: \"Item removed from cart\",\r\n" +
                    "duration: 3000,\r\n" +
                    "close: true,\r\n" +
                    "gravity: \"top\",\r\n" +
                    "position: \"center\",\r\n" +
                    "style: " +
                    "{\r\n"+
                    "     background: \"green\"\r\n" +
                    "}\r\n\r\n" +
                    "}).showToast();";
            ScriptManager.RegisterStartupScript(this, GetType(), "Notify", toast, true);
            stopRefresh();
        }

    }
}