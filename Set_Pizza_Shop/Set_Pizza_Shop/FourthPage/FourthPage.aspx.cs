using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace Set_Pizza_Shop.FourthPage
{
    public partial class FourthPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string firstName = Session["FirstName"] as string;
                string lastName = Session["LastName"] as string;
                string totalPrice = Request.QueryString["TotalPrice"];
                string selectedCheckboxIdsString = Request.QueryString["selectedCheckboxIds"];

                string source = Request.QueryString["source"];

             
                if (!string.IsNullOrEmpty(firstName))
                {
                    Label1.Text = firstName;
                }
                if (!string.IsNullOrEmpty(lastName))
                {
                    Label2.Text = lastName;
                }

                if (!string.IsNullOrEmpty(source))
                {
                    if(source == "confrim") {
                        Label3.Text = "Your order is Confirmed!";
                    }
                    else if(source =="cancel")
                    {
                        Label3.Text = "Your order is Cancelled";
                    }
                }
            }
        }
    }
}