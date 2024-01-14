<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Client_Registrion.aspx.cs" Inherits="Admin_Registrion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrion</title>
    <link href="register.css" rel="stylesheet" />
</head>
<body>
    
    <div class="regstrionbox" >
        <img src="../register_Logo-removebg-preview.png" alt="Alternate Text" class="user"/>
        <form id="form1" runat="server">
            <asp:HyperLink CssClass="hpllogout" runat="server" NavigateUrl="~/Login.aspx">LogOut/SignUp</asp:HyperLink>

                         <asp:TextBox  runat="server" Visible="False" Width="48px" ID="id"></asp:TextBox><br />
                         <asp:Label CssClass="lblname" runat="server" Text="Enter Name:  "></asp:Label>
                         <asp:TextBox ID="txtname" CssClass="txtname"  runat="server" placeholder="Enter Name"></asp:TextBox><br /> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>
                    
                         <asp:Label CssClass="lblradio" runat="server" Text="Select Gender :"></asp:Label>
                         <asp:RadioButton ID="male" Cssclass="rbtnmale" runat="server"  Text="Male" Checked="True" ForeColor="White" />
                         <asp:RadioButton ID="female" CssClass="rtnfemale" runat="server" Text="Female" ForeColor="White" /><br />

                        <asp:Label CssClass="lblcity" runat="server" Text="Enter City :" >
                        <asp:TextBox ID="txtcity" CssClass="txtcity" runat="server" placeholder="Enter City"></asp:TextBox><br /></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter City" ControlToValidate="txtcity" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>

                        <asp:Label CssClass="lblmob" runat="server" Text="Enter Mobile No. :"></asp:Label>
                        <asp:TextBox ID="txtcontact" CssClass="txtcontact" runat="server" MaxLength="10" placeholder="Enter Contect No"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact No" ControlToValidate="txtcontact" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>
                       
                        <asp:Label CssClass="lblemail" runat="server" Text="Enter Email Id :">
                        <asp:TextBox ID="txtemail" CssClass="txtemail" runat="server" placeholder="Enter Email"></asp:TextBox><br /></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtemail" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email " ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></br>
                      
                        <asp:Label CssClass="lblpass" runat="server" Text="Enter Password :"></asp:Label>
                        <asp:TextBox ID="txtpass" CssClass="txtpass" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpass" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>
                        
                        <asp:Label CssClass="lblcpass"  runat="server" Text="Confirm Password :"></asp:Label>
                        <asp:TextBox ID="txtcpass" CssClass="txtcpass" runat="server" TextMode="Password" placeholder="Enter Confrim Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="txtcpass" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both Are not same" ControlToCompare="txtpass" ControlToValidate="txtcpass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator></br>
                        <br /><br />
                     
                        <asp:Button Text="Submit" CssClass="btnsubmit" runat="server" OnClick="Unnamed10_Click" />&nbsp;&nbsp;
                       

                   </form>
        
    </div>
                 
</body>
</html>
