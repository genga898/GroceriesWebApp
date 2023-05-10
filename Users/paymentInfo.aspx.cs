using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Data.SqlClient;

namespace GroceriesWebApp.Users
{
    public partial class paymentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnClick(object sender, EventArgs e)
        {
            //Declare variables
            string name = txtName.Text, 
                number = txtNumber.Text,
                address = txtAddress.Text;
            SqlCommand cmd;
            int userID = Convert.ToInt32(Session["UserID"]);

            //Add the information to the database
            string sqlText = "Insert into MpesaPayment(name, mobile_number,address, User_id)" +
                "values(@name, @number, @address, @userId)";
            string connectString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
            SqlConnection conn = new SqlConnection(connectString);
            cmd = new SqlCommand(sqlText, conn);

            conn.Open();
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@number", number);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@userID", userID);

            //Execute query
            cmd.ExecuteNonQuery();

            //Dispose of the command and close the connection
            cmd.Dispose();
            conn.Close();

            //Alert user that the information has been added
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