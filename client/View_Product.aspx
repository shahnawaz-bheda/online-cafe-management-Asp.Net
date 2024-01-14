<%@ Page Title="Add To Cart" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="View_Product.aspx.cs" Inherits="cafe_management_client_View_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      

    <style type="text/css">
        .datalistbox {
             position:absolute;
            left:50%;
            top:50%;
            width:511px;
            height:200px;
            box-sizing:content-box;
            transform:translate(-50%,-10%);
            background-color:rgba(0,0,0,0.8);
            border-radius:8px;
        }
        .btncart {
       
            width:47%;
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
            .btncart:hover {
                    
                 background-color:#D6DA77;
                        color:black;
                         font-weight:bold;
            }
        
       
    </style>
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div></div>

      <div >
           <asp:DataList ID="DataList1" runat="server" CssClass="datalistbox"  RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="3" CellSpacing="1" OnItemCommand="DataList1_ItemCommand" >
               <ItemTemplate>
                    <table style="margin-left:8%;">
                        <tr>
                            <td style="text-align:center;padding:3%;" >
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text='<%# Eval("prod_name") %>' Width="200px" ></asp:Label>
                            </td>
                        </tr>

                        <tr >
                            <td style="text-align:center;padding:3%;">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_id","View_Product.ashx?myimg={0}") %>' Width="40%"/>
                            </td>
                        </tr>

                        <tr >
                            <td style="text-align:center">
                                    <asp:Label ID="Label2" runat="server" Text="Price : Rs." Font-Bold="True" Font-Names="Arial" ForeColor="White"  style="text-align:center"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("prod_price") %>' Font-Bold="True" Font-Names="Arial" ForeColor="White"  style="text-align:center"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>

                        <tr >
                            <td style="text-align:center">
                                <asp:Label ID="Label4" runat="server" Text="Qauntity" ForeColor="White"></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" ForeColor="Black">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
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
                                <br />
                                <br />
                            </td>
                            
                        </tr>
                      
                        <tr>
                            <td style="text-align:center;margin-top:-3%;">
                                <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/cafe_management/Add_to_cart_2.png" Width="200px" CommandArgument='<%# Eval("prod_id") %>' CommandName="Add to cart"/>--%>
                                <asp:Button runat="server" ID="btnaddtocart" Text="Add To Cart" CssClass="btncart" CommandName="Addtocart"  CommandArgument='<%#Eval("prod_id")%>' />
                            </td>
                        </tr>
                    </table>
                   <br />
                   <br />     
                 </ItemTemplate>
              </asp:DataList> 
    </div></br></br></br></br></br></br></br></br></br></br></br></br>    

</asp:Content>

