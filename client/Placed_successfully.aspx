<%@ Page Title="" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="Placed_successfully.aspx.cs" Inherits="cafe_management_client_Placed_successfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .tbl {
            width:40%;
        }
        .auto-style6 {
            height: 499px;
            background-color: #000000;
            margin-right: 0px;
            margin-bottom: 0px;
            width: 99%;
            color: #EAEAEA;
        }
        .auto-style7 {
            text-align: center;
            height: 38px;
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            width: 1881px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style9 {
            text-align: left;
            height: 89px;
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            width: 1881px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style10 {
            height: 92px;
        }
        .auto-style11 {
            text-align: left;
            width: 746px;
        }
        .auto-style13 {
            text-align: left;
            height: 31px;
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            width: 1881px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style14 {
            text-align: left;
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            width: 1881px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style15 {
            font-family: "Times New Roman", Times, serif;
            color: #000000;
            font-size: large;
        }
        .auto-style16 {
            color: #000000;
            font-size: large;
        }
        .auto-style18 {
            height: 29px;
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
            border-radius:4px;
            transition: .3s ease-in-out;
            font-weight:bold;
            margin-top:2%;
        }
            .auto-style18:hover {
                    
                 background-color:#D6DA77;
                        color:black;
                         font-weight:bold;
            }

        
        .auto-style23 {
            font-family: "Times New Roman", Times, serif;
        }
        .auto-style25 {
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style28 {
            font-family: "Times New Roman", Times, serif;
            color: #FFFFFF;
            font-size: large;
            font-style: italic;
        }
        .auto-style29 {
            font-family: "Times New Roman", Times, serif;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            width: 1881px;
            color: #000000;
            height: 96px;
            background-color: #FFFFFF;
        }
        .auto-style30 {
            width: 1881px;
            background-color: #FFFFFF;
        }
        .auto-style31 {
            width: 958px;
        }
        .auto-style33 {
            font-family: "Times New Roman", Times, serif;
            color: #000000;
            font-size: large;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        <asp:Panel ID="Panel1" runat="server" CssClass="auto-style5" Height="451px">
            <table class="auto-style1 auto-style6" border="1" cssClass="tbl" aria-orientation="horizontal" >
                <tr>
                    <td class="auto-style7" spellcheck="False">
                        <h2 class="auto-style33">RETAIL INVOICE</h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"><span class="auto-style23"><b><i>
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style16" Visible="False"></asp:Label>
                        <br class="auto-style16" />
                        </i></b></span><strong><span class="auto-style33">Order Date :</span><span class="auto-style28"><span class="auto-style23"><b><i><asp:Label ID="Label6" runat="server" CssClass="auto-style16"></asp:Label>
                        </i></b></span></span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29">
                        <table border="1" class="auto-style1 auto-style10" cssClass="tbl">
                            <tr>
                                <td class="auto-style11"><strong><span class="auto-style33">Buyer Address :</span><span class="auto-style28"><span class="auto-style23"><b><i><asp:Label ID="Label7" runat="server" CssClass="auto-style16"></asp:Label>
                                    </i></b></span></span></strong>
                                </td>
                                <td class="auto-style31"><span class="auto-style33"><strong>Seller Address : CafeManagement,Jamnagar</strong></span></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style25" Height="16px" Width="1592px" ForeColor="Black">
                            <Columns>
                                <asp:BoundField DataField="srno" HeaderText="Sr.No">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="prod_id" HeaderText="Product Id" Visible="False">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="prod_name" HeaderText="Product Name">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="prod_price" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Grand Total<span class="auto-style33"><strong> :</strong></span><i><b><asp:Label ID="Label5" runat="server" CssClass="auto-style15"></asp:Label>
                        </b></i>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">Declaration:We declare that this invoice showes actual price of the goods decribed inclusive of texes and that all particlular are the true and correct. Incase you find Selling price on this invoice to be more than MRP mentioned on product, Please infrom <a href="mailto:kevalsiddhapura54@gmail.com">kevalsiddhapura54@gmail.com</a></td>
                </tr>
            </table>
               </asp:Panel>
    </div><br /><br />
    <br />
    <div><asp:Button ID="btnpdf" runat="server" Text="Download Invoice" CssClass="auto-style18" OnClick="btnpdf_Click" /></div>
    
</asp:Content>

