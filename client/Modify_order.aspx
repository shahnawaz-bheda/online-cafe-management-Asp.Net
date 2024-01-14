<%@ Page Title="" Language="C#" MasterPageFile="~/cafe_management/client/Client.master" AutoEventWireup="true" CodeFile="Modify_order.aspx.cs" Inherits="cafe_management_client_Modify_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 736px;
            height: 537px;
            color: #FFFFFF;
            margin-top:-8%;
        }
        .auto-style7 {
            width: 220px;
        }
        .auto-style8 {
            width: 220px;
            font-weight: bold;
        }
        .btnsave {
             width:10%;
            height:30px;
            border-radius:5px;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            font-size: 16px;
            color: white;
            background-color:#FF7D33;
            cursor:pointer;
            transition: .3s ease-in-out;
            font-weight:bold;

        }
            .btnsave:hover {
                  background-color:#D6DA77;
            color:black;

            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style6" border="1">
        <tr>
            <td class="auto-style8">Sr.No</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Product Id</td>
            <td>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Product Name</td>
            <td>
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Price</td>
            <td>
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Quantity</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="auto-style9" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="10%">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Total Price</td>
            <td>
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
        </tr>
    </table><br /><br />
    <div>
        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btnsave" OnClick="btnsave_Click"/>
    </div>
</asp:Content>

