using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Set_Pizza_Shop
{
    public partial class FirstPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string enteredName = Name.Text;

                string[] nameParts = enteredName.Split(' ');


                string firstName = nameParts.Length > 0 ? nameParts[0] : string.Empty;
                string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;

                Session["FirstName"] = firstName;
                Session["LastName"] = lastName;
                Server.Transfer("SecondPage/SecondPage.aspx");
            }
        }
    }
}