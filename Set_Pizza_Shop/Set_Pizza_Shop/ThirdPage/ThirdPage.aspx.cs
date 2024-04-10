using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace Set_Pizza_Shop.ThirdPage
{
    public partial class ThirdPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string firstName = Session["FirstName"] as string;
                string lastName = Session["LastName"] as string;
                string totalPrice = Request.QueryString["TotalPrice"];
                string selectedCheckboxIdsString = Request.QueryString["selectedCheckboxIds"];

                if (!string.IsNullOrEmpty(firstName))
                {
                    Label1.Text = firstName;
                }
                if (!string.IsNullOrEmpty(totalPrice))
                {
                    float price = float.Parse(totalPrice);
                    Label2.Text = price.ToString("F2");
                }

                if (!string.IsNullOrEmpty(selectedCheckboxIdsString))
                {
                    List<string> selectedCheckboxIds = selectedCheckboxIdsString.Split(',').ToList();
                    Table table = new Table();
                    table.CssClass = "loadTable";

                    for (int i = 0; i <= selectedCheckboxIds.Count; i++)
                    {
                        TableRow row = new TableRow();
                        TableCell cell = new TableCell();

                        TableCell rightCell = new TableCell();
                        Label rightLabel = new Label();
                        rightLabel.ID = $"Label{i + 1}";

                        Label label = new Label();
                        label.ID = $"Label{i + 1}";

                        if (i < selectedCheckboxIds.Count)
                        {
                            label.Text = selectedCheckboxIds[i];
                            if (label.Text == "Mushroom")
                            {
                                rightLabel.Text = "$1.00";
                            }
                            if (label.Text == "GreenOlive")
                            {
                                label.Text = "Green Olive";
                                rightLabel.Text = "$1.00";
                            }
                            if (label.Text == "GreenPapper")
                            {
                                label.Text = "Green Papper";
                                rightLabel.Text = "$1.00";
                            }
                            if (label.Text == "Pepperoni")
                            {
                                rightLabel.Text = "$1.50";
                            }
                            if (label.Text == "DoubleCheese")
                            {
                                label.Text = "Double Cheese";
                                rightLabel.Text = "$2.25";
                            }
                        }

                        if (i == selectedCheckboxIds.Count)
                        {
                            label.Text = "Large Pizza";
                            rightLabel.Text = "$10.00";
                        }
                        cell.Controls.Add(label);
                        rightCell.Controls.Add(rightLabel);
                        cell.HorizontalAlign = HorizontalAlign.Left;
                        rightCell.HorizontalAlign = HorizontalAlign.Right;
                        row.Cells.Add(cell);
                        row.Cells.Add(rightCell);
                        table.Rows.Add(row);
                    }

                    Server_table.Controls.Add(table);
                }
            }
        }
        

    }
}