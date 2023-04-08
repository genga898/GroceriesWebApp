using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesWebApp
{
    public partial class grocery : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                cartToggle.Attributes.Add("class", "disabled");
                account.Visible = false;
                userAccount.Visible = false;
            }
            else
            {
                cartToggle.Attributes.Remove("disabled");
                account.Visible = true;
                userAccount.Visible = true;
                userReg.Visible = false;
                userRegistration.Visible = false;
            }
        }
    }
}