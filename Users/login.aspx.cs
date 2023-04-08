using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp
{
    public partial class login : System.Web.UI.Page
    {
        private SqlConnection conn =
            new SqlConnection(ConfigurationManager.ConnectionStrings["connectDb"].ConnectionString);
        private SqlDataReader dtReader;
        private SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = string.Empty, password = string.Empty;
            email = txtEmail.Text;
            password = txtPassword.Text;
            conn.Open();
            cmd = new SqlCommand("select [user_id], names, email, password from Users where email = @email and password = @password", conn);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", HashPassword(password));
            dtReader = cmd.ExecuteReader();
            if (dtReader.Read())
            {
                Session["user_id"] = dtReader.GetValue(0).ToString();
                Session["names"] = dtReader.GetValue(1).ToString();
                lblLoginConfirm.Text = "Welcome " + dtReader.GetValue(1).ToString();
                Task.Delay(2000);
                Response.Redirect("index.aspx");
                clear();
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Enter correct email or password";
                conn.Close();
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