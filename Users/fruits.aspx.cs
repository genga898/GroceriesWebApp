using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;

namespace GroceriesWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.DbConnect();
            if (!IsPostBack)
            {
                GetProducts();
            }
        }

        protected void btnAddToCart_OnClick(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect", "Toastify({\\r\\ntext: \\\"Login Required before adding to cart\\\",\\r\\nduration: 3000,\\r\\nclose: true,\\r\\ngravity: \\\"top\\\",\\r\\nposition: \\\"right\\\",\\r\\nstopOnFocus: false,\\r\\nstyle: {\\r\\n background: \\\"red\\\",\\r\\n}\\r\\n}).showToast();\" +\r\n\"" +
                    "window.location.href = 'login.aspx'");
            }
            else
            {
                SqlCommand cmd;
                int userID = Convert.ToInt32(Session["UserID"]),
                    quantity = 1,
                    productID = 0;
                string toast;


                string sqlText = "Insert into Cart(Product_id, Quantity, UserId)" +
                                 " values(@prod_id, @quantity, @user_ID)";
                cmd = new SqlCommand();
                cmd.CommandText = sqlText;
                cmd.Connection = Database.Conn;
                /*DataView dv = (DataView)sdsFruits.Select(DataSourceSelectArguments.Empty);
                if (dv != null && dv.Count > 0)
                {
                    productID = (int)dv[0]["product_id"];
                    cmd.Parameters.AddWithValue("@prod_id", productID);
                }*/
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@user_ID", userID);

                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Database.Conn.Close();
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
            }
        }

        protected void GetProducts()
        {
            DataTable dt;
            SqlCommand cmd;
            SqlDataAdapter dataAdapter;
            string sqlText = "Select product_id, name, price, quantity, ImageUrl, Category_id, created_at " +
                             "from Products " +
                             "where quantity > 0 and Category_id = 2 " +
                             "order by created_at;";
            cmd = new SqlCommand();
            cmd.Connection = Database.Conn;
            cmd.CommandText = sqlText;
            dataAdapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            dataAdapter.Fill(dt);
            rpFruits.DataSource = dt;
            rpFruits.DataBind();

        }
    }
}