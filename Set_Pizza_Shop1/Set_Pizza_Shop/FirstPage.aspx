<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Set_Pizza_Shop.FirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Set Pizza Shop - WDD Final - First Page</title>
</head>
<body>
    <form id="First_Page" runat="server">
        <div>
            <h1>SET Pizza Shop</h1>
            <hr />
            <p>What is your name?</p>
              <asp:TextBox ID="Name" runat="server" ToolTip="Insert your name(Only Alpha)"></asp:TextBox>
                  <br />
                  <asp:Button ID="NameButton" runat="server" Text="Submit"/>
                  <br />
                <!-- if user input nothing or not a words consist of alphabet -->
                  <asp:RequiredFieldValidator ID="NameValidator" runat="server" 
                      ErrorMessage="Insert your name again" ControlToValidate="Name"
                      ForeColor="#FF0F00F" Display="Dynamic" ></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="NameExpressionValidator" runat="server" 
                      ErrorMessage="Name must be consisted of <i>Alpha</i> only" ControlToValidate="Name"
                      ValidationExpression="^[A-Za-z\s]+$" ForeColor="#FF0F00F"  Display="Dynamic" ></asp:RegularExpressionValidator>
        </div>
    </form>
</body>
</html>
