using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Set_Pizza_Shop.SecondPage
{
    public partial class SecondPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)                                    // Check the page exist and session check also
            {
                string firstName = Session["FirstName"] as string;
                string lastName = Session["LastName"] as string;
                if (!string.IsNullOrEmpty(firstName))
                {
                    Label1.Text = firstName;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string UpdateTotalPrice(float price, bool isChecked, float totalPrice)
        {
            if (isChecked)
            {
                totalPrice += price;
            }
            else
            {
                totalPrice -= price;
            }
            //return totalPrice.ToString();
            string jsonResponse = "{\"totalPrice\":\"" + totalPrice.ToString("F2") + "\"}";
            return jsonResponse;
            //return jsonResponse;
        }
    }
}