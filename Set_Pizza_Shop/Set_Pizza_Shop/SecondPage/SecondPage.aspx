<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondPage.aspx.cs" Inherits="Set_Pizza_Shop.SecondPage.SecondPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Set Pizza Shop - WDD Final - Second Page</title>
    <link rel="stylesheet" type="text/css" href="/Style.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
        var totalPrice;
        var selectedCheckboxIds = [];
        $(document).ready(function () {
            totalPrice = 10.00;
            $(".toppingCheckbox").change(function () {
                var checkbox = $(this);
                var id = checkbox.data("id");

                var isChecked = $("#" + id).prop("checked") ? 1 : 0;
                $(this).data("isChecked", isChecked);
                var checkboxPrice = parseFloat($(this).data("price"));

                if (isChecked) {
                    selectedCheckboxIds.push(id);
                } else {
                    selectedCheckboxIds = selectedCheckboxIds.filter(function (item) {
                        return item !== id;
                    });
                }
                console.log("Added ID:", selectedCheckboxIds);
                $.ajax({
                    method: "POST",
                    url: "SecondPage/SecondPage.aspx/UpdateTotalPrice",  
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ price: checkboxPrice, isChecked: isChecked, totalPrice: totalPrice, selectedCheckboxIds: selectedCheckboxIds }),
                    dataType: "json", // 추가

                    success: function (response) {
                        
                        var newTotalPrice = parseFloat(response.d.totalPrice);
                        if (!isNaN(newTotalPrice)) {
                            totalPrice = newTotalPrice;
                            updateTotalPriceDisplay();
                        }
                        
                    },
                    error: function (error) {
                        },
                });
            });


            function updateTotalPriceDisplay() {
                $("#totalPrice").text(totalPrice.toFixed(2));
                document.getElementById("totalPrice").innerHTML = "$" + totalPrice.toFixed(2);
            }
            document.getElementById("totalPrice").innerHTML = "$" + totalPrice.toFixed(2);
        });

            
    </script>
</head>
<body>
    <form id="Second_Page" runat="server">
        <div>
            <div>
                <h1>SET Pizza Shop</h1>
                <h2>Welcome to <i>SET Pizza Shop</i> !! </h2>
                <h2>Ciao <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> !!</h2>
                <h3>You can order only one large pizza!</h3>
                <h2 class="h2CSS">Choose your toppings.</h2>
            </div>
            <br />
            <table>
                <tr>
                    <td align="left"><asp:CheckBox id="LargePizza" runat="server" Text="Large Pizza" Checked="true" Enabled="false" 
                        class="toppingCheckbox" data-price="10.00"/> </td>
                    <td align="right">$10.00</td>
                </tr>
                <tr>
                    <td align="left"><asp:CheckBox id="Mushroom" runat="server" Text="Mushroom" CssClass="toppingCheckbox" data-id="Mushroom" data-price="1.00" /> </td>
                    <td align="right">$1.00</td>
                </tr>
                <tr>
                    <td align="left"><asp:CheckBox id="GreenOlive" runat="server" Text="Green Olive" class="toppingCheckbox" data-id="GreenOlive" data-price="1.00"/> </td>
                    <td align="right">$1.00</td>
                </tr>
                <tr>
                    <td align="left"><asp:CheckBox id="GreenPapper" runat="server" Text="Green Papper" class="toppingCheckbox" data-id="GreenPapper" data-price="1.00"/> </td>
                    <td align="right">$1.00</td>
                </tr>
                <tr>
                    <td align="left"><asp:CheckBox id="Pepperoni" runat="server" Text="Pepperoni" class="toppingCheckbox" data-id="Pepperoni" data-price="1.50"/> </td>
                    <td align="right">$1.50</td>
                </tr>
                <tr>
                    <td align="left"><asp:CheckBox ID="DoubleCheese" runat="server" Text="Double Cheese" class="toppingCheckbox" data-id="DoubleCheese" data-price="2.25"/> </td>
                    <td align="right">$2.25</td>
                </tr>
                <tr>
                     <td align="left">Total Price </td>
                     <td align="right"><div id="totalPrice"></div></td>
                 </tr>
            </table>
            <br />
            <div class="makeItButton"><asp:Button ID="submitButton" runat="server" Text="Make It!" onclick="MakeItButton" /></div>
            </div>
</form>
</body>
</html>
