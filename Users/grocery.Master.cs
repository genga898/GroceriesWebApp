using Microsoft.VisualBasic.ApplicationServices;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp
{
    public partial class grocery : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                cartToggle.Attributes.Add("class", "disabled");
                account.Visible = false;
                userAccount.Visible = false;
            }
            else
            {
                int userID = (int)Session["UserID"];
                cartToggle.Attributes.Remove("disabled");
                account.Visible = true;
                userAccount.Visible = true;
                userReg.Visible = false;
                userRegistration.Visible = false;
                getTotal();

            }
        }

        protected void CheckoutButton_OnClick(object sender, EventArgs e)
        {
            // Check if the user has added payment details
            DataTable data;
            SqlDataAdapter dtAdapter;
            SqlConnection connection =
                new SqlConnection(ConfigurationManager.ConnectionStrings["connectDb"].ConnectionString);
            string sqlStatement = $"Select * from MpesaPayment where User_id = '{Session["UserID"]}'";
            
            //Query the database
            dtAdapter = new SqlDataAdapter(sqlStatement, connection);
            //Fill DataTable
            data = new DataTable();
            dtAdapter.Fill(data);

            //Check if the table has any values in it
            if(data.Rows.Count < 1) 
            {
                string toast = "Toastify({\r\n            " +
                               "text: \"Payment Details Required\",\r\n" +
                               "duration: 3000,\r\n" +
                               "close: true,\r\n" +
                               "gravity: \"top\",\r\n" +
                               "position: \"center\",\r\n" +
                               "style: " +
                               "{\r\n"+
                               "     background: \"blue\"\r\n" +
                               "}\r\n\r\n" +
                               "}).showToast();";
                string delay = "setTimeout(function() {\r\n  " +
                               "window.location.href = 'paymentInfo.aspx';" +
                               "\r\n}, 2000);\r\n";
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", toast+delay, true);
            }
            else
            {
                //Declare variables
                SqlCommand cmd;
                int userID = (int)Session["UserID"],
                    paymentID,
                    quantity,
                    productID;
                string status, orderNum = Guid.NewGuid().ToString();
                DateTime date = DateTime.Now;

                // Set status
                status = "Ready for shipping";

                // Insert details into Users table
                string sqlText = "Insert into Orders(order_no, Product_id, Quantity, User_id, Status, Payment_id, OrderDate)" +
                                 " values(@orderNum, @prod_id, @quantity, @user_ID, @status, @Payment_id, @OrderDate)";
                SqlConnection conn =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["connectDb"].ConnectionString);
                cmd = new SqlCommand(sqlText, conn);
                using (cmd)
                {
                    cmd.Parameters.AddWithValue("@orderNum", orderNum);
                    cmd.Parameters.AddWithValue("@user_ID", userID);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@OrderDate", date);


                    // Get product id of product being bought and the quantity
                    DataTable dt;
                    SqlDataAdapter dataAdapter;
                    string connectString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
                    conn = new SqlConnection(connectString);
                    string sqlCommand = $"Select * from Cart where User_id = '{userID}'";
                    // Create a new SqlDataAdapter object using the query and connection
                    dataAdapter = new SqlDataAdapter(sqlCommand, conn);

                    // Fill the DataTable with data from the database using the data adapter

                    dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        productID = Convert.ToInt32(dt.Rows[0]["Product_id"]);
                        quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);
                        cmd.Parameters.AddWithValue("@prod_id", productID);
                        cmd.Parameters.AddWithValue("@quantity", quantity);

                        //Update the quantity in the products table
                        string textCommand = $"Update Products set quantity = quantity - {quantity} where product_id = '{productID}'";
                        SqlCommand command = new SqlCommand(textCommand, conn);
                        conn.Open();
                        command.ExecuteNonQuery();
                        command.Dispose();

                    }

                    paymentID = Convert.ToInt32(data.Rows[0]["payment_id"]);
                    cmd.Parameters.AddWithValue("@Payment_id", paymentID);

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    conn.Close();
                    string toast = "Toastify({\r\n            " +
                                   "text: \"Details Added Successfully\",\r\n" +
                                   "duration: 3000,\r\n" +
                                   "close: true,\r\n" +
                                   "gravity: \"top\",\r\n" +
                                   "position: \"center\",\r\n" +
                                   "style: " +
                                   "{\r\n"+
                                   "     background: \"green\"\r\n" +
                                   "}\r\n\r\n" +
                                   "}).showToast();";
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", toast, true);
                }

                
            }
            

            
        }

        protected void getTotal()
        {
            DataTable dt;
            SqlDataAdapter dataAdapter;
            string connectString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
            SqlConnection conn = new SqlConnection(connectString);
            string sqlText = "SELECT SUM(c.Quantity * p.price) as Total " +
                             "FROM Cart c " +
                             "FULL JOIN Products p ON c.Product_id = p.product_id " +
                             $"WHERE c.User_id = '{Session["UserID"]}';";
            // Create a new SqlDataAdapter object using the query and connection
            dataAdapter = new SqlDataAdapter(sqlText, conn);

            // Fill the DataTable with data from the database using the data adapter

            dt = new DataTable();
            dataAdapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ltlTotal.Text = "Ksh:" + dt.Rows[0]["Total"].ToString();
            }
            else
            {
                ltlTotal.Text = "Ksh:" + "0.00";
            }
        }
    }
}