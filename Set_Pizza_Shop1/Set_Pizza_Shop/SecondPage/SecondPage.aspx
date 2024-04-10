<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondPage.aspx.cs" Inherits="Set_Pizza_Shop.SecondPage.SecondPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Set Pizza Shop - WDD Final - Second Page</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
        var totalPrice = 10.00;
        $(document).ready(function () {

            $(".toppingCheckbox").change(function () {
                var isChecked = $(this).prop("Checked");
                var checkboxPrice = parseFloat($(this).data("price"));
                
                $.ajax({
                    method: "POST",
                    url: "SecondPage.aspx/UpdateTotalPrice",
                    data: { price: checkboxPrice, isChecked: isChecked, totalPrice: totalPrice },
                    success: function (response) {
                        var newTotalPrice = parseFloat(response.d.totalPrice);

                        if (!isNaN(newTotalPrice)) {
                            totalPrice = newTotalPrice;
                            updateTotalPriceDisplay();
                            document.getElementById("test").innerHTML = "Total Price: $" + totalPrice.toFixed(2);
                        } else {
                            console.error("Invalid totalPrice:", newTotalPrice);
                        }
                       
                        totalPrice = newTotalPrice;
                        updateTotalPriceDisplay();
                        document.getElementById("test").innerHTML = "Total Price: $" + totalPrice.toFixed(2);
                    },
                    error: function (error) {
                        console.log(error);
                        document.getElementById("test").innerHTML = isChecked ? "true" : "false";
                    },
                });
            });

            function updateTotalPriceDisplay() {
                $("#totalPrice").text("Total Price is : $" + totalPrice.toFixed(2));
                document.getElementById("totalPrice").innerHTML = "Total Price is : $" + totalPrice.toFixed(2);
            }
            document.getElementById("totalPrice").innerHTML = "Total Price is : $" + totalPrice.toFixed(2);
        });
        
    </script>
</head>
<body>
    <form id="Second_Page" runat="server">
        <div>
            <h1>SET Pizza Shop</h1>
            <h2>Welcome to <i>SET Pizza Shop</i> !! </h2>
            <h2>Ciao <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> !!</h2>
            <h3>You can order only one large pizza!</h3>
        </div>
        <table width="30%">
            <tr>
                <td align="left"><asp:CheckBox ID="LargePizza" runat="server" Text="Large Pizza" Checked="true" Enabled="false" 
                    class="toppingCheckbox" data-price="10.00"/> </td>
                <td align="right">$10.00</td>
            </tr>
            <tr>
                <td align="left"><asp:CheckBox ID="Mushroom" runat="server" Text="Mushroom" class="toppingCheckbox" Checked="false" data-price="1.00"/> </td>
                <td align="right">$1.00</td>
            </tr>
            <tr>
                <td align="left"><asp:CheckBox ID="GreenOlive" runat="server" Text="Green Olive" class="toppingCheckbox" Checked="false" data-price="1.00"/> </td>
                <td align="right">$1.00</td>
            </tr>
            <tr>
                <td align="left"><asp:CheckBox ID="GreenPapper" runat="server" Text="Green Papper" class="toppingCheckbox" Checked="false" data-price="1.00"/> </td>
                <td align="right">$1.00</td>
            </tr>
            <tr>
                <td align="left"><asp:CheckBox ID="Pepperoni" runat="server" Text="Pepperoni" class="toppingCheckbox" Checked="false" data-price="1.50"/> </td>
                <td align="right">$1.50</td>
            </tr>
            <tr>
                <td align="left"><asp:CheckBox ID="DoubleCheese" runat="server" Text="Double Cheese" class="toppingCheckbox" Checked="false" data-price="2.25"/> </td>
                <td align="right">$2.25</td>
            </tr>
        </table>
        <div id="totalPrice"></div>
        <div id="test"></div>
    </form>
</body>
</html>
