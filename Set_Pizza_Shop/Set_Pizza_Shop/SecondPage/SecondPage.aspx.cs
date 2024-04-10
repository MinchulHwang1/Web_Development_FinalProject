using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Set_Pizza_Shop.SecondPage
{
    public partial class SecondPage : System.Web.UI.Page
    {
        public static float priceTotal;
        public static List<string> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)                                    
            {
                string firstName = Session["FirstName"] as string;
                string lastName = Session["LastName"] as string;
                if (!string.IsNullOrEmpty(firstName))
                {
                    Label1.Text = firstName;
                }
            }
            
        }

        public class UpdateResponse
        {
            public float price { get; set; }
            public int isChecked { get; set; }
            public float totalPrice { get; set; }
            public List<string> SelectedCheckboxIds { get; set; }
        }

        [System.Web.Services.WebMethod]
        public static UpdateResponse UpdateTotalPrice(float price, int isChecked, float totalPrice, List<string> selectedCheckboxIds)
        {
            UpdateResponse response = new UpdateResponse();
            if (isChecked == 1)
            {
                totalPrice += price;
            }
            else
            {
                totalPrice -= price;
            }

            response.price = price;
            response.isChecked = isChecked;
            response.totalPrice = totalPrice;
            response.SelectedCheckboxIds = selectedCheckboxIds;

            HttpContext.Current.Session["TotalPrice"] = totalPrice;
            HttpContext.Current.Session["SelectedCheckboxIds"] = selectedCheckboxIds;
            return response;
        }

        
        protected void MakeItButton(object sender, EventArgs e)
        {
            float price = (float)HttpContext.Current.Session["TotalPrice"];
            List<string> ListArray = HttpContext.Current.Session["SelectedCheckboxIds"] as List<string>;
            string queryString = $"?totalPrice={price}&selectedCheckboxIds={string.Join(",", ListArray)}";
            Server.Transfer($"/ThirdPage/ThirdPage.aspx{queryString}");
        }

        public static void SetPrice(float totalPrice)
        {
            priceTotal = totalPrice;
        }
        public static float GetPrice()
        {
            return priceTotal;
        }
        public static void SetList(List<string> selectedCheckboxIds)
        {
            list = selectedCheckboxIds;
        }
        public static List<string> GetList()
        {
            return list;
        }
    }
}