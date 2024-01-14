<%@ Page Title="Shop" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="frm_tea.aspx.cs" Inherits="frm_tea" %>

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
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" Height="208px" Width="55%" GridLines="None" ShowHeader="False" OnRowCommand="GridView1_RowCommand">
            <Columns>
                
               <asp:TemplateField HeaderText=" Category Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cat_id","frm_tea.ashx?myimg={0}") %>'  Width="90px"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload id="fldgrp" runat="server" />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cat_id","frm_tea.ashx?myimg={0}") %>' Width="90px"/>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:TemplateField>
  
           <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("cat_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("cat_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Oprations">
                 <ItemTemplate>
                              <asp:Button ID="Btnview" runat="server" Text="View" CssClass="btnview" Width="50px"  CommandName="cat" CommandArgument='<%#Eval("cat_id")%>'/>
                             </ItemTemplate>
                         <%-- <EditItemTemplate>
                              <asp:Button ID="Btnview" runat="server" Text="View" CssClass="btnview" Width="50px" />
                             </EditItemTemplate>--%>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
                      </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

