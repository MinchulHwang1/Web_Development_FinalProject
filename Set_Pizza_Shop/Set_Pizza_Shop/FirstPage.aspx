<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Set_Pizza_Shop.FirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Set Pizza Shop - WDD Final - First Page</title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">   
    
</head>
<body>
     <form id="First_Page" runat="server" class="container">
     <div>
         <h1>SET Pizza Shop</h1>
         <hr />
         <p>What is your name?</p>
            <asp:TextBox ID="Name" runat="server" ToolTip="Insert your name(Only Alpha)"></asp:TextBox>
            <br />
         <br />
            <asp:Button ID="NameButton" runat="server" Text="Submit"/>
            <br />
            <asp:RequiredFieldValidator ID="NameValidator" runat="server" 
                ErrorMessage="Insert your name again" ControlToValidate="Name"
                Display="Dynamic" CssClass="validator" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="NameExpressionValidator" runat="server" 
                ErrorMessage="Name must be consisted of <i>Alpha</i> only" ControlToValidate="Name"
                ValidationExpression="^[A-Za-z\s]+$"  Display="Dynamic" CssClass="validator"></asp:RegularExpressionValidator>
         <br />
         <div class="image-container"></div>
     </div>
    </form>
</body>
</html>
