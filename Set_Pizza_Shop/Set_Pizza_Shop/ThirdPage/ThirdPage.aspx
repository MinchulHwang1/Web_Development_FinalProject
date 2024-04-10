<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThirdPage.aspx.cs" Inherits="Set_Pizza_Shop.ThirdPage.ThirdPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Set Pizza Shop - WDD Final - Third Page</title>
    <link rel="stylesheet" type="text/css" href="/Style.css" />
    <script>
        function ConfirmButton() {

            window.location.href = '/FourthPage/FourthPage.aspx?source=confrim';
        }

        function CancelButton() {

            window.location.href = '/FourthPage/FourthPage.aspx?source=cancel';
        }
        window.onload = function () {
            var elements = document.querySelectorAll('.aspNetHidden');
            elements.forEach(function (element) {
                element.style.display = 'none';
            });
        };
    </script>
</head>
<body runat="server" class="bodyClass">
    <div>
        <div>
            <h1>SET Pizza Shop</h1>
            <h2>Welcome to <i>SET Pizza Shop</i> !! </h2>
            <h2>Ciao <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> !!</h2>
            <h3>Order Details </h3>
        </div>
            <form id="Server_table" runat="server" class="thirdFormClass">
            </form>
        <br />

        <table class="thirdTable">
            <tr>
                <td align="left">Total Price </td>
                <td align="right">$<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <div class="image-container3"></div>
            </tr>
            <tr >
                <td align="center"><input type="button" id="confirmButton" value="CONFIRM" onclick="ConfirmButton()"/></td>
                <td align="center"><input type="button" id="cancelButton" value="CANCEL" onclick="CancelButton()"/></td>
            </tr>
        </table>
    </div>
</body>
</html>
