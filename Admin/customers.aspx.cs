using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;

namespace GroceriesWebApp.Admin
{
    public partial class customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.DbConnect();
            bindData();
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
                bindData();
            }
        }

        //method for binbding the data
        protected void bindData()
        {
            string query = "SELECT user_id, names, email, created_at FROM Users";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = Database.Conn;


            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();

            adapt.Fill(table);

            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (GridView1.DataKeys.Count > e.RowIndex)
            {
                int user_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                // the delete statement
                string del = "DELETE FROM Users WHERE user_id = @user_id";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = del;
                cmd.Connection = Database.Conn;
                cmd.Parameters.AddWithValue("@user_id", user_id);
                cmd.ExecuteNonQuery();
                Database.Conn.Close();
                bindData();
            }



        }

        protected void btn_4_Click(object sender, EventArgs e)
        {
            string name = textname.Text;
            string mail = textemail.Text;
            string pass = textpassword.Text;
            DateTime date = DateTime.Now;

            // insert statement
            string insquery = "INSERT INTO Users(names,email,password,created_at) values('"+name+"','"+mail+"','"+pass+"','"+date+"')";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText=insquery;
            cmd.Connection = Database.Conn;

            cmd.ExecuteNonQuery();
            Database.Conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}