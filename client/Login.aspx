<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="style%20(2).css" rel="stylesheet" />
</head>
<body>
    
    <div class="loginbox">
        <img src="../logo-removebg-preview.png" alt="Alternet Text" class="user"/>
        <form  runat="server">
            <asp:Label Text="Email" CssClass="lblemail" runat="server" ></asp:Label>
            <asp:TextBox runat="server" CssClass="txtemail" placeholder="Enter Email" ID="name"></asp:TextBox>
            <asp:Label Text="Password" CssClass="lblpass" runat="server" ></asp:Label>
            <asp:TextBox  runat="server" CssClass="txtpass" placeholder="************" TextMode="Password" ID="password"></asp:TextBox>
            <input type="checkbox" onchange="document.getElementById('password').type=this.checked ? 'text' : 'password'" id="check1" />
            <asp:Label Text="Show Password" CssClass="lblshowpass" runat="server"></asp:Label><br /><br />
            <asp:Button Text="Sign In" CssClass="btnsubmit" runat="server" OnClick="Unnamed5_Click"/>
            <asp:HyperLink Text="RegisterNow!" CssClass="hplreg" runat="server" NavigateUrl="Client_Registrion.aspx"/>
        </form>
    </div>
    
</body>
</html>
