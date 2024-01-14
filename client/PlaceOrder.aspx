<%@ Page Title="Order" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="client_PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css" >
         .buy {
            
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
            margin-top:3%;
        }
            .buy:hover {
                    
                 background-color:#D6DA77;
                        color:black;
                         font-weight:bold;
            }

        .lbldate,.address,.mob {
            color:white;
            font:bolder;
            font-size:1em;
               
        }

        .txtaddress, .txtmob {
            margin-bottom:20px;
        }

        .txtaddress, .txtmob {

              border:none;
    border-bottom:3px solid #fff;
    outline:none;
    height:40px;
    color:#fff;
    font-size:1.5em;
    background-color:transparent;
        }


          .grid {
            margin-top:1%;
            margin-left:1%;
            border:solid;
            border-color:white;
            background:rgba(0,0,0,0.8);    
            width:80%;
        }
        .grid td{
    padding:10px;
    border:1px solid #c1c1c1;font-size:1em;
    font-family:Arial;
    color:white;
}
.grid th{
    padding:6px 6px;color:white;text-shadow:none;
    text-align:center;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Order ID" Visible="false"></asp:Label><asp:Label ID="lblorder" runat="server" Visible="false"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server"  CssClass="lbldate" Text="Date Of Order :"/> <asp:Label ID="date" runat="server" CssClass="lbldate"></asp:Label>
                </td>
            </tr>
        </table>
    </div><br/>
    <div>
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" Height="136px" Width="703px">
            <Columns>
                <asp:BoundField DataField="order_id" HeaderText="order_id" Visible="False" />
                <asp:BoundField DataField="srno" HeaderText="Sr_No" />
                <asp:BoundField DataField="prod_id" HeaderText="Product_Id" Visible="false"/>
                <asp:BoundField DataField="prod_name" HeaderText="Product_name" />
                <asp:BoundField DataField="prod_price" HeaderText="Price" />
                <asp:BoundField DataField="quantity" HeaderText="Qty" />
                <asp:BoundField DataField="totalprice" HeaderText="total_price" />
            </Columns>
        </asp:GridView>
    </div><br/>
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" CssClass="address" Text="Type Your Address :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server"  CssClass="txtaddress"  TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" CssClass="mob" Text="Mobile No :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtmobile" runat="server" CssClass="txtmob" TextMode="SingleLine" Height="19px" MaxLength="10" Width="230px"></asp:TextBox>
                </td>
            </tr>
             
        </table>
    </div>
    <div>
        <asp:Button CssClass="buy" ID="btnplaceorder" runat="server" Text="Buy" OnClick="btnplaceorder_Click" />
    </div>
</asp:Content>

