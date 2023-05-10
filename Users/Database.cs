using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GroceriesWebApp.Users
{
    public class Database
    {
        public static SqlConnection Conn;

        public static void DbConnect()
        {
            string connectDbString = ConfigurationManager.ConnectionStrings["connectDb"].ToString();
            Conn = new SqlConnection(connectDbString);

            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            else
            {
                Conn.Open();
            }
        }
    }
}