using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceriesWebApp.Users;
using GroceriesWebApp.usersTableAdapters;

namespace GroceriesWebApp
{
    public partial class login : System.Web.UI.Page
    {
        private SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = string.Empty, password = string.Empty;
            email = txtEmail.Text;
            password = txtPassword.Text;
            cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", HashPassword(password));

            DataTable dt = new DataTable();

            usersTableAdapters.UsersTableAdapter users = new usersTableAdapters.UsersTableAdapter();
            password = HashPassword(password);
            dt = users.GetData(email, password);

            if (dt.Rows.Count > 0)
            {
                // Login successful
                // Generate a unique session ID and store it in a session variable
                string sessionID = Guid.NewGuid().ToString();
                Session["SessionID"] = sessionID;

                // Store the user ID in a session variable
                int userID = (int)dt.Rows[0]["user_id"];
                Session["UserID"] = userID;
                string toast = "Toastify({\r\n            " +
                               "text: \"Login Successful\",\r\n" +
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
                               "window.location.href = 'index.aspx';" +
                               "\r\n}, 2000);\r\n";
                clear();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Redirect",
                    toast+delay,
                    true);

            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Enter correct email or password";
                clear();
            }

        }
        //Password hashing algorithm
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


        //Hash password verification
        private bool VerifyPassword(string password, string hashedPassword)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                string hashedPass = builder.ToString();
                return (hashedPass == hashedPassword);
            }
        }

        private void clear()
        {
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}