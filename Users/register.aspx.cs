using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using GroceriesWebApp.Users;

namespace GroceriesWebApp
{
    public partial class register : System.Web.UI.Page
    {
        private SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.DbConnect();
        }

        protected void rgsSubmit_Click(object sender, EventArgs e)
        {
            string full_names = txtFullnames.Text,
                email = txtEmail.Text,
                password = txtPassword.Text;
            int user_id = Convert.ToInt32(Request.QueryString["user_id"]);
            DateTime date = DateTime.Now;
            bool isValidToExecute = false;

            password = HashPassword(password);

            isValidToExecute =true;
            if (isValidToExecute)
            {
                string sqlText =
                    "INSERT INTO Users(names, email, password, created_at) " +
                    "VALUES(@full_names, @email, @password, @date)";
                cmd = new SqlCommand();
                cmd.CommandText = sqlText ;
                cmd.Connection = Database.Conn;

                cmd.Parameters.AddWithValue("@full_names", full_names);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@date", date);
                try
                {
                    cmd.ExecuteNonQuery();
                    string toast = "Toastify({\r\n            " +
                                   "text: \"Registration Successful\",\r\n" +
                                   "duration: 3000,\r\n" +
                                   "close: true,\r\n" +
                                   "gravity: \"top\",\r\n" +
                                   "position: \"center\",\r\n" +
                                   "style: " +
                                   "{\r\n"+
                                   "     background: \"linear-gradient(to right, #00b09b, #96c93d)\"\r\n" +
                                   "}\r\n\r\n" +
                                   "}).showToast();";
                    string delay = "setTimeout(function() {\r\n  " +
                                   "window.location.href = 'login.aspx';" +
                                   "\r\n}, 2000);\r\n";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect",
                        toast+delay,
                        true);
                    clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblEmailError.Visible = true;
                        lblEmailError.Text = "User with the email address "+ email+" already exists!";
                    }
                }
                catch (Exception exception)
                {
                    string toast = "Toastify({\r\n            " +
                                   $"text: \"{exception}\",\r\n" +
                                   "duration: 3000,\r\n" +
                                   "close: true,\r\n" +
                                   "gravity: \"top\",\r\n" +
                                   "position: \"center\",\r\n" +
                                   "style: " +
                                   "{\r\n"+
                                   "     background: \"red\"\r\n" +
                                   "}\r\n\r\n" +
                                   "}).showToast();";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect",
                        toast,
                        true);
                }
                finally
                {
                    cmd.Dispose();
                   Database.Conn.Close();
                }
            }
        }


        //function to hash password
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private void clear()
        {
            txtFullnames.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmpass.Text = string.Empty;
        }
    }
}