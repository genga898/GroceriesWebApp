using GroceriesWebApp.Users;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace GroceriesWebApp
{
    public partial class vegetables : System.Web.UI.Page
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
                string sqlText = "Select * " +
                                 "from Products " +
                                 "where quantity > 0 and Category_id = 1 " +
                                 "order by created_at;";
                // Create a new SqlDataAdapter object using the query and connection
                dataAdapter = new SqlDataAdapter(sqlText, conn);

                // Fill the DataTable with data from the database using the data adapter

                dt = new DataTable();
                dataAdapter.Fill(dt);
                rpVegetables.DataSource = dt;
                rpVegetables.DataBind();
            }
        }

        protected void stopRefresh()
        {
            // Redirect to the same page using a GET request
            Response.Redirect(Request.Url.AbsoluteUri, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnAddToCart_OnClick(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                string toast = "Toastify({\r\n            " +
                               "text: \"Login Required before adding to cart\",\r\n" +
                               "duration: 3000,\r\n" +
                               "close: true,\r\n" +
                               "gravity: \"top\",\r\n" +
                               "position: \"center\",\r\n" +
                               "style: " +
                               "{\r\n"+
                               "     background: \"red\"\r\n" +
                               "}\r\n\r\n" +
                               "}).showToast();";
                string delay = "setTimeout(function() {\r\n  " +
                               "window.location.href = 'login.aspx';" +
                               "\r\n}, 2000);\r\n";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect", toast + delay, true);
            }
            else
            {
                SqlCommand cmd;
                int userID = Convert.ToInt32(Session["UserID"]),
                    quantity = 1;
                string toast;

                // Insert details into cart table
                string sqlText = "Insert into Cart(Product_id, Quantity, User_id)" +
                                 " values(@prod_id, @quantity, @user_ID)";
                SqlConnection conn =
                       new SqlConnection(ConfigurationManager.ConnectionStrings["connectDb"].ConnectionString) ;
                using (cmd = new SqlCommand(sqlText, conn))
                {
                    //Get product ID
                    Button btn = (Button)sender;
                    int productID = Convert.ToInt32(btn.CommandArgument);

                    cmd.Parameters.AddWithValue("@prod_id", productID);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@user_ID", userID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    conn.Close();
                    toast = "Toastify({\r\n            " +
                            "text: \"Item Successfully added to cart\",\r\n" +
                            "duration: 3000,\r\n" +
                            "close: true,\r\n" +
                            "gravity: \"top\",\r\n" +
                            "position: \"center\",\r\n" +
                            "style: " +
                            "{\r\n"+
                            "     background: \"green\"\r\n" +
                            "}\r\n\r\n" +
                            "}).showToast();";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", toast, true);
                    stopRefresh();
                    
                }

            }
        }
    }
}