using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;

namespace GroceriesWebApp.Admin
{
    public partial class dashboard : System.Web.UI.Page
    {
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check login status
        if (Session["UserID"] == null)
        {
            string toast = "Toastify({\r\n            " +
                           "text: \"Login Required\",\r\n" +
                           "duration: 3000,\r\n" +
                           "close: true,\r\n" +
                           "gravity: \"top\",\r\n" +
                           "position: \"center\",\r\n" +
                           "style: " +
                           "{\r\n" +
                           "     background: \"red\"\r\n" +
                           "}\r\n\r\n" +
                           "}).showToast();";
            string delay = "setTimeout(function() {\r\n  " +
                           "window.location.href = 'login.aspx';" +
                           "\r\n}, 2000);\r\n";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect",
                toast + delay,
                true);
        }
        else
        {
            int userID = (int)Session["UserID"];
        }
        
        Database.DbConnect();
        //display the text on the cards
        // count the number of products
        string sqlQuery = "SELECT COUNT(*) AS ProductCount FROM Products;";

        // Create a new SqlConnection object and open the connection
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sqlQuery;
        cmd.Connection = Database.Conn;

        // Execute the query and retrieve the result as a SqlDataReader object
        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            // If the reader has rows, read the first row and retrieve the value of the "ProductCount" column
            if (reader.HasRows && reader.Read())
            {
                int productCount = reader.GetInt32(reader.GetOrdinal("ProductCount"));

                //display on the card
                Label1.Text = productCount.ToString();

            }

        }


        //dispalay the customer card
        string userquery = "SELECT COUNT(*) AS usercount FROM Users;";

        cmd.CommandText = userquery;
        cmd.Connection = Database.Conn;
        // Execute the query and retrieve the result as a SqlDataReader object
        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            // If the reader has rows, read the first row and retrieve the value of the "ProductCount" column
            if (reader.HasRows && reader.Read())
            {
                int userCount = reader.GetInt32(reader.GetOrdinal("usercount"));

                //display on the card
                Label3.Text =  userCount.ToString();

            }

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}