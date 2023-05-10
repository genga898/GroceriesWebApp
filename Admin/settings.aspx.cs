using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp.Admin
{
    public partial class settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}