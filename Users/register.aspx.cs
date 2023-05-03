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
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect", 
                        "Toastify({\r\ntext: \"Registration Successful\",\r\nduration: 3000,\r\nclose: true,\r\ngravity: \"top\",\r\nposition: \"right\",\r\nstopOnFocus: false,\r\nstyle: {\r\n background: \"linear-gradient(to right, #00b09b, #96c93d)\",\r\n}\r\n}).showToast();" +
                        "window.location.href = 'login.aspx'",
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
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Popup",
                        $"Swal.fire({{\r\n  icon: 'error',\r\n  title: {exception}}})",
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