using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp
{
    public partial class register : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataAdapter reader;
        private DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rgsSubmit_Click(object sender, EventArgs e)
        {
            string full_names = string.Empty, email = string.Empty, password = string.Empty, confirmpass = string.Empty, actionName = String.Empty;
            int user_id = Convert.ToInt32(Request.QueryString["user_id"]);
            DateTime date = DateTime.Now;
            bool isValidToExecute = false;

            full_names = txtFullnames.Text;
            email = txtEmail.Text;
            password = txtPassword.Text;
            confirmpass = txtConfirmpass.Text;
            password = HashPassword(password);
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectDb"].ConnectionString);
            cmd = new SqlCommand("User_SP", conn);
            cmd.Parameters.AddWithValue("@action", "INSERT");
            cmd.Parameters.AddWithValue("@names", full_names);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@created_at", date);

            isValidToExecute =true;
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblRegConfirm.Visible = true;
                    lblRegConfirm.Text = "Registration Successful";
                    Thread.Sleep(2000);
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Refresh", " window.location.href = 'login.aspx';", true);
                    clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblEmailError.Visible = true;
                        lblEmailError.Text = "User with the email address " + email + " already exists!";
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
                    conn.Close();
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