using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
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
                    fileName = Path.GetFileName(fuCategory.PostedFile.FileName);
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
            int prodquantity = Convert.ToInt32(txtquantity.Text);
            decimal price;
            string fileName,
                imageUploadPath,
                toast,
                linkPath;
            int category_id = int.Parse(ddlCategory.SelectedValue);

            if (decimal.TryParse(txtprice.Text, out price) && int.TryParse(txtquantity.Text, out prodquantity))
            {

                SqlCommand cmd;
                int active = 1;
                DateTime date = DateTime.Now;
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


                //Check if the fileUpload control has an image item
                if (fuProduct.HasFile)
                {
                    // Get the file extension
                    string fileExtension = Path.GetExtension(fuProduct.FileName);

                    // List of allowed file extensions
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".svg" };
                    double fileSizeKB = (double)fuProduct.PostedFile.ContentLength / 1024;

                    // Check if the file extension is allowed
                    if (allowedExtensions.Contains(fileExtension))
                    {
                        // Set the file upload path
                        imageUploadPath = Server.MapPath("~/images/Product/");
                        fileName = Path.GetFileName(fuProduct.PostedFile.FileName);
                        string filePath = imageUploadPath + fileName;
                        linkPath = "~/images/Product/" + fileName;

                        // Save the file to the server
                        fuProduct.SaveAs(filePath);
                        //Save image url
                        cmd.Parameters.AddWithValue("@imagePath", linkPath);
                    }
                    else
                    {
                        // Handle the error - Invalid file extension
                        lbldis.Visible = true;
                        lbldis.Text = "Invalid file, please upload an image file eg: x.png, x.svg, x.jpg orx.jpeg";
                        lbldis.ForeColor = System.Drawing.Color.Red;
                    }
                    // Execute the query and notify the user of the completion of transaction
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Database.Conn.Close();
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

                    // Clear the textboxes
                    Clear();
                }
                else
                {
                    toast = "Toastify({\r\n            " +
                            "text: \"Please insert an image\",\r\n" +
                            "duration: 3000,\r\n" +
                            "close: true,\r\n" +
                            "gravity: \"top\",\r\n" +
                            "position: \"center\",\r\n" +
                            "style: " +
                            "{\r\n"+
                            "     background: \"blue\"\r\n" +
                            "}\r\n\r\n" +
                            "}).showToast();";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", toast, true);
                    Clear();
                }
            }
            else
            {
                toast = "Toastify({\r\n            " +
                        "text: \"Incorrect price or quantity\",\r\n" +
                        "duration: 3000,\r\n" +
                        "close: true,\r\n" +
                        "gravity: \"top\",\r\n" +
                        "position: \"center\",\r\n" +
                        "style: " +
                        "{\r\n"+
                        "     background: \"red\"\r\n" +
                        "}\r\n\r\n" +
                        "}).showToast();";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", toast, true);
                Clear();
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