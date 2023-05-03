using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;
using Microsoft.VisualBasic.CompilerServices;

namespace GroceriesWebApp.Admin
{
    public partial class categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //call the connection class
            Database.DbConnect();
            //lbl display not visible
            lbldis.Visible = false;
            lbldis2.Visible = false;

            tblcatname.Text = String.Empty;
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            int active = 1;
            DateTime date = DateTime.Now;
            string catname = tblcatname.Text,
                fileName,
                imageUploadPath,
                toast;
            string sqlText =
                "INSERT INTO Categories(name, ImageUrl, isActive, created_at) " +
                "VALUES(@catName, @imagePath, @active, @created)";
            cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@catName", catname);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@created", date);

            cmd.Connection = Database.Conn;
            cmd.CommandText = sqlText;


            if (fuCategory.HasFile)
            {
                // Get the file extension
                string fileExtension = Path.GetExtension(fuCategory.FileName);

                // List of allowed file extensions
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };

                // Check if the file extension is allowed
                if (allowedExtensions.Contains(fileExtension))
                {
                    // Set the file upload path
                    imageUploadPath = Server.MapPath("~/images/category/");
                    fileName = Path.GetFileName(fuCategory.FileName);
                    string filePath = imageUploadPath + fileName;

                    // Save the file to the server
                    fuCategory.SaveAs(filePath);
                    //Save image url
                    cmd.Parameters.AddWithValue("@imagePath", filePath);
                }
                else
                {
                    // Handle the error - Invalid file extension
                    lbldis.Visible = true;
                    lbldis.Text = "Invalid file, please upload an image file eg: x.png, x.svg, x.jpg orx.jpeg";
                    lbldis.ForeColor = System.Drawing.Color.Red;
                }
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Database.Conn.Close();
                tblcatname.Text = "";
                toast = "Toastify({\r\n            " +
                    "text: \"Category Added Successfully\",\r\n" +
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            string prodname = txtprodname.Text;
            decimal price = Convert.ToDecimal(txtprice.Text);
            int prodquantity = Convert.ToInt32(txtquantity.Text);
            string fileName;
            string name = ddlCategory.Text;
            int category_id = int.Parse(ddlCategory.SelectedValue);

            if (prodname == "" || price == 0 || prodquantity == 0)
            {
                lbldis2.Text = "Text boxes are empty";
                lbldis2.Visible = true;
                lbldis2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd;
                int active = 1;
                DateTime date = DateTime.Now;
                string imageUploadPath,
                    toast;
                string sqlText =
                    "INSERT INTO Products(name, price, quantity, ImageUrl, Category_id, isActive, created_at) " +
                    "VALUES(@name, @price, @quantity, @imagePath, @catID, @active, @created)";
                cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@name", prodname);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@quantity", prodquantity);
                cmd.Parameters.AddWithValue("@catID", category_id);
                cmd.Parameters.AddWithValue("@active", active);
                cmd.Parameters.AddWithValue("@created", date);

                cmd.Connection = Database.Conn;
                cmd.CommandText = sqlText;


                if (fuProduct.HasFile)
                {
                    // Get the file extension
                    string fileExtension = Path.GetExtension(fuProduct.FileName);

                    // List of allowed file extensions
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };

                    // Check if the file extension is allowed
                    if (allowedExtensions.Contains(fileExtension))
                    {
                        // Set the file upload path
                        imageUploadPath = Server.MapPath($"~/images/{name}/");
                        fileName = Path.GetFileName(fuProduct.FileName);
                        string filePath = imageUploadPath + fileName;

                        // Save the file to the server
                        fuProduct.SaveAs(filePath);
                        //Save image url
                        cmd.Parameters.AddWithValue("@imagePath", filePath);
                    }
                    else
                    {
                        // Handle the error - Invalid file extension
                        lbldis.Visible = true;
                        lbldis.Text = "Invalid file, please upload an image file eg: x.png, x.svg, x.jpg orx.jpeg";
                        lbldis.ForeColor = System.Drawing.Color.Red;
                    }
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Database.Conn.Close();
                    Clear();
                    toast = "Toastify({\r\n            " +
                        "text: \"Product Added Successfully\",\r\n" +
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //onclick clear the textboxes
            Clear();
        }

        protected void Clear()
        {
            txtprice.Text = "";
            txtprodname.Text = "";
            txtquantity.Text = "";
        }
    }
}