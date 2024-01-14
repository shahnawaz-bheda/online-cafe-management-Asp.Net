<%@ Page Title="Category" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Add_category.aspx.cs" Inherits="Add_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .categorybox {
            position:absolute;
            left:50%;
            top:57%;
            width:380px;
            box-sizing:content-box;
            transform:translate(-50%,-10%);
            background:rgba(0,0,0,0.5);
            border-radius:8px;
        }
        .user {

            position:absolute;
            width:100px;
            height:100px;   
        }

        .lblname {
            font-weight:bold;
            color:#fff;
            margin-left:30px;
            margin-top:40px;
            font-size:19px;
        }
        .lblselect {
                font-weight:bold;
                color:#fff;
                margin-left:15px;
                font-size:19px;
                                        
        }
        .fld {
            font-weight:bold;
            color:#fff;
            margin-left:-2px;
            font-size:small;
        }
        .btnadd {
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

        }
     .btnadd:hover {
                background-color:#D6DA77;
                color:black;
            }
        .txtcatadd {
            border:none;
            border-bottom:2px solid #fff;
            outline:none;
            height:20px;
            color:#fff;
            font-size:16px;
            background-color:transparent;
        }
        .lbladd {
            
            font-weight:bold;
            font-size:2em;
            margin-left:30%;
           
        }
        .grid {
            margin-top:17%;
            margin-left:25%;
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
    <br />
    <br/> <br /> <br /><br /><br /><br /><br /><br />
    
    <div class="categorybox">
        <asp:Label ID="lblid" runat="server" ForeColor="White" CssClass="lbladd" class="user">Add Category</asp:Label><br />
    <asp:TextBox ID="txtcatid" runat="server" CssClass="txtcatid" Height="24px"  Visible="False" Width="162px"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server"  CssClass="lblname"  Text="Category Name :"></asp:Label>
    <asp:TextBox ID="txtaddcat" runat="server" CssClass="txtcatadd" Height="24px" Width="162px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server"  CssClass="lblselect" Text="Select Image :"></asp:Label>
    <asp:FileUpload id="fldgrp"  CssClass="fld" runat="server" />
    <br />
    <br />
    <asp:Button ID="btnaddcat" CssClass="btnadd"  runat="server" Text="Add" OnClick="btnaddcat_Click" />
    <br />
    <br />
        </div>
<div>
    <asp:GridView ID="GridView1" CssClass="grid" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" AllowSorting="true" Width="45%" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
 
      <asp:TemplateField HeaderText="Id" Visible="false">
           <ItemTemplate>
               <asp:Label ID="lblid"  runat="server" Text='<%# Eval("cat_id") %>' ></asp:Label>
           </ItemTemplate>
           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
       </asp:TemplateField>
            <asp:TemplateField HeaderText=" Category Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cat_id","Add_category.ashx?myimg={0}") %>'  Width="35%"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload id="fldgrp" runat="server" />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cat_id","Add_category.ashx?myimg={0}") %>' Width="35%"/>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="65%" />
            </asp:TemplateField>
  
           <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("cat_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("cat_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="46%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Oprations">
                          <ItemTemplate>
                             <asp:ImageButton ID="ImageButton1" ImageUrl="~/cafe_management/Crud_images/edit.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="28%"/>
                              <asp:ImageButton ID="ImageButton2" ImageUrl="~/cafe_management/Crud_images/Delete.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="28%"/>
                          </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton3" ImageUrl="~/cafe_management/Crud_images/save.png" CommandName="Update" runat="server" ToolTip="Update" Width="28%"/>
                                    <asp:ImageButton ID="ImageButton4" ImageUrl="~/cafe_management/Crud_images/Cancal.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="28%"/>
                                </EditItemTemplate>
                      </asp:TemplateField>
              </Columns>
            </asp:GridView>
</div>
</asp:Content>

