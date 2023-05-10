using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;
using System.Data.SqlClient;

namespace GroceriesWebApp.Admin
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //call the data class
            Database.DbConnect();

            if (!IsPostBack)
            {
                bindData();

            }
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

            //the select statement
            string query = "SELECT p.product_id, p.name AS Name, p.price, p.quantity, p.ImageUrl, c.name AS Category, p.created_at FROM" +
                " Products p INNER JOIN Categories c ON p.Category_id = c.category_id";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = Database.Conn;


            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();

            adapter.Fill(table);

            GridView1.DataSource = table;
            GridView1.DataBind();

            //hide the update form
            PlaceHolder1.Visible = false;

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {



        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {


        }
        // deleteting statement!!!!!!!!!!!
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (GridView1.DataKeys.Count > e.RowIndex)
            {
                int product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                //  delete statement 
                string del = "DELETE FROM Products WHERE product_id = @product_id";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = del;
                cmd.Connection = Database.Conn;
                cmd.Parameters.AddWithValue("@product_id", product_id);
                cmd.ExecuteNonQuery();
                Database.Conn.Close();
                bindData();
            }



        }
        protected void bindData()
        {
            // rebind the GridView to refresh the data
            string query = "SELECT p.product_id, p.name AS Name, p.price, p.quantity, p.ImageUrl, c.name AS Category, p.created_at FROM" +
               " Products p INNER JOIN Categories c ON p.Category_id = c.category_id";
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = query;
            cmd.Connection = Database.Conn;


            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();

            adapter.Fill(table);

            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        //update statement
        protected void Button2_Click(object sender, EventArgs e)
        {
            int p_id = Convert.ToInt32(TextBox1.Text);
            string ddl = DropDownList2.SelectedValue.ToString();
            string p_name = TextBox4.Text;
            int p_price = Convert.ToInt32(TextBox5.Text);
            int p_quantity = Convert.ToInt32(TextBox6.Text);
            string p_file = Path.GetFileName(FileUpload2.FileName);



            string updatequery = "UPDATE Products SET name='" + p_name + "',price='" + p_price + "',quantity='" + p_quantity + "'," +
            "ImageUrl='" + p_file + "',Category_id=(SELECT TOP 1 category_id  FROM Categories WHERE name='" + ddl + "')" +
                "WHERE product_id='" + p_id + "'";
            SqlCommand comms = new SqlCommand();
            comms.Connection = Database.Conn;
            comms.CommandText = updatequery;
            comms.ExecuteNonQuery();
            Database.Conn.Close();

            bindData();




        }
        //called when the update link is clicked
        protected void btnupdate_Click(object sender, EventArgs e)
        {


            PlaceHolder1.Visible = true;

        }
        
    }
}