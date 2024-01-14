<%@ Page Title="Subcategory" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Add_subcategory.aspx.cs" Inherits="cafe_management_Add_subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .subcategorybox {
             position:absolute;
            left:50%;
            top:57%;
            width:400px;
            height:220px;
            box-sizing:content-box;
            transform:translate(-50%,-10%);
            background:rgba(0,0,0,0.5);
            border-radius:8px;
        }
        .user {
            position:absolute;
            width:200px;
            height:200px;
            left:calc(50% - 95px);   
        
              }
        .lblsubcategory {
             font-weight:bold;
             color:white;
             font-size:2em;
               margin-left:20%;
               
        }
        .lblselect   {
             font-weight:bold;
            color:#fff; 
            margin-left:25%;
            font-size:19px;
            
        }
        .lblsubcat {
            font-weight:bold;
            color:#fff; 
            margin-left:5%;
            font-size:19px;
       
        }
        .lblselectsubcat {
            font-weight:bold;
            color:#fff; 
            margin-left:4%;
            font-size:19px;
        }
        .txtsubcat {
             border:none;
            border-bottom:2px solid #fff;
            outline:none;
            height:20px;
            color:#fff;
            font-size:16px;
            background-color:transparent;
        }
        .subcatimg {
            font-weight:bold;
            color:#fff; 
            margin-left:-1.8%;
            margin:-4px;    
        }
        .ddlcat {
            font-weight:bold;
        }
        .btnsubcat {
            margin-left:37%;
            width:29%;
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

            .btnsubcat:hover {
                        background-color:#D6DA77;
                        color:black;
                         font-weight:bold;
            }
             .grid {
            margin-top:28%;
            margin-left:30%;
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
    <div class="subcategorybox">                                   
        <asp:Label CssClass="lblsubcategory" runat="server">Add Subcategory</asp:Label><br /><br />
<asp:Label CssClass="lblselect" runat="server" class="user">Select Category:</asp:Label>
        <asp:TextBox runat="server" ID="txtsubcatid" Visible="False"></asp:TextBox>
    <asp:DropDownList ID="ddlcat" CssClass="ddlcat" runat="server" AutoPostBack="true"></asp:DropDownList>
       
        <br /><br />
<asp:Label runat="server" CssClass="lblsubcat">Subcategory Name:</asp:Label>
    <asp:TextBox runat="server" ID="txtsubcat" CssClass="txtsubcat"></asp:TextBox><br /><br />
    <asp:Label runat="server" CssClass="lblselectsubcat">Select Image:</asp:Label>
        <asp:FileUpload runat="server" CssClass="subcatimg" id="fldsubcat"/><br /><br />
    <asp:Button runat="server" ID="btnsubcat" CssClass="btnsubcat" Text="Add" OnClick="btnsubcat_Click1"/>
        </div>

    <asp:GridView ID="GridView1" runat="server" CssClass="grid" HorizontalAlign="Center" Width="40%" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:TemplateField HeaderText="ID" Visible="false">
                  <ItemTemplate>
               <asp:Label ID="subid"  runat="server" Text='<%# Eval("subcat_id") %>'></asp:Label>
           </ItemTemplate>
           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
       </asp:TemplateField>
            <asp:TemplateField HeaderText="Subcategory Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcat_id","Add_subcategory.ashx?myimg={0}") %>'  Width="30%"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload id="fldgrp" runat="server" />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcat_id","Add_subcategory.ashx?myimg={0}") %>' Width="30%"/>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="50%"/>
            </asp:TemplateField>
  
           <asp:TemplateField HeaderText="Subcategory Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("subcat_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("subcat_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="50%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Oprations">
                          <ItemTemplate>
                             <asp:ImageButton ID="ImageButton1" ImageUrl="~/cafe_management/Crud_images/edit.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="25%"/>
                              <asp:ImageButton ID="ImageButton2" ImageUrl="~/cafe_management/Crud_images/Delete.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="25%"/>
                          </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton3" ImageUrl="~/cafe_management/Crud_images/save.png" CommandName="Update" runat="server" ToolTip="Update" Width="25%"/>
                                    <asp:ImageButton ID="ImageButton4" ImageUrl="~/cafe_management/Crud_images/Cancal.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="25%"/>
                                </EditItemTemplate>
                      </asp:TemplateField>
                    </Columns>
            </asp:GridView>
</asp:Content>


