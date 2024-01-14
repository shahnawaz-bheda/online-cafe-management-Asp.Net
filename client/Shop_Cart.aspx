<%@ Page Title="Cart" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="Shop_Cart.aspx.cs" Inherits="cafe_management_client_Shop_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style type="text/css">
       .checkout
       {
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
      .checkout:hover 
      {
            background-color:#D6DA77;
            color:black;
      }
       .modify {

            width:70%;
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
           .modify:hover {
               background-color:#D6DA77;
            color:black;
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
       <asp:GridView ID="GridView1" runat="server" CssClass="grid"
     AutoGenerateColumns="False" Font-Bold="True" Font-Names="Arial" ShowFooter="True" Width="60%" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <Columns>
              
                <asp:BoundField DataField="srno" HeaderText="Sr. No" />
                <asp:BoundField DataField="prod_id" HeaderText="Product Id" Visible="False">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="prod_name" HeaderText="Product Name">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
           <%--     <asp:ImageField DataImageUrlField='&#039;<%# Eval("prod_id","View_Product.ashx?myimg={0}") %>&#039;' HeaderText="Product Image">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ImageField>
           --%>     <asp:BoundField DataField="prod_price" HeaderText="Price">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="totalprice" HeaderText="Total Price" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" SelectText="Modify" ShowSelectButton="True" ControlStyle-CssClass="modify"/>
                <asp:CommandField ButtonType="Button" DeleteText="Remove" ShowDeleteButton="True" ControlStyle-CssClass="checkout" ControlStyle-Width="65%" >
               
<ControlStyle CssClass="checkout" Width="65%"></ControlStyle>
                </asp:CommandField>
               
            </Columns>
            <FooterStyle  HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Larger"/>
        </asp:GridView>
    </div></br>
    <div>
        <asp:Button CssClass="checkout" ID="Btncheckout" runat="server" Text="CheckOut"  OnClick="Btncheckout_Click" />
    </div>
</asp:Content>

