<%@ Page Title="Product" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="view_Subcategory.aspx.cs" Inherits="cafe_management_client_view_Subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .grid {
            margin-top:-13%;
            margin-left:1%;
            border:solid;
            border-color:white;
            background:rgba(0,0,0,0.8);    
            
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

        .btnview {
            margin-left:35%;
            width:7%;
            width:30%;
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
            margin-left:10%;
        }

         .btnview:hover {
                background-color:#D6DA77;
                color:black;
            }
    
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" Height="208px" Width="55%" GridLines="None" ShowHeader="true" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                
               <asp:TemplateField  HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcat_id","view_Subcategory.ashx?myimg={0}") %>'  Width="90px"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload id="fldgrp" runat="server" />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcat_id","view_Subcategory.ashx?myimg={0}") %>' Width="90px"/>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:TemplateField>
  
           <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("subcat_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("subcat_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Show">
                 <ItemTemplate>
                              <asp:Button ID="Btnview" runat="server" Text="View" CssClass="btnview" Width="50px"  CommandName="subcat" CommandArgument='<%#Eval("subcat_id")%>'/>
                             </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
                      </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

