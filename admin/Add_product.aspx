<%@ Page Title="Product" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Add_product.aspx.cs" Inherits="cafe_management_Add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .productbox {
            position:absolute;
            left:50%;
            top:57%;
            width:380px;
            height:340px;
            box-sizing:content-box;
            transform:translate(-50%,-10%);
            background:rgba(0,0,0,0.5);
            border-radius:8px;

        }
         .lblcat,.lblsubcat{
             font-weight:bold;
             color:white;
               margin-left:15%;
            font-size:19px;
        }
        .lblprod, .lblprice,.lbldesc {
                font-weight:bold;
             color:white; 
               margin-left:10%;
                font-size:19px;
        }
        .lblproduct {
             font-weight:bold;
             color:white;
            font-size:2em; 
            margin-left:30%;   
            
        }
        .lblimage {
             font-weight:bold;
             color:white;
                font-size:19px;
            margin-left:21px;   
            
        }
        .ddlcat,.ddlsubcat {
            font-weight:bold;

        }

        .fldprod {
             font-weight:bold;
            color:#fff;
            margin-left:-1px;
            font-size:small;
       
        }
        .btnprod {
            margin-top:4%;
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
           .btnprod:hover {
                        background-color:#D6DA77;
                        color:black;
                         font-weight:bold;
            }
        .txtproduct, .txtprice {
              border:none;
            border-bottom:2px solid #fff;
            outline:none;
            height:20px;
            color:#fff;
            font-size:16px;
            background-color:transparent;
            width:50%;
        }
        .txtdesc {
                 border:none;
            border-bottom:2px solid #fff;
            outline:none;
            height:20px;
            color:#fff;
            font-size:16px;
            background-color:transparent;
            width:40%;
        
        }


           .grid {
            margin-top:40%;
            margin-left:10%;
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
    
    <div class="productbox">
    <asp:Label ID="Label1" runat="server" CssClass="lblproduct">Add Product</asp:Label><br /><br />
    <asp:Label ID="lblcat" runat="server" CssClass="lblcat">Add Category :</asp:Label>
    <asp:DropDownList ID="ddlcat" runat="server" CssClass="ddlcat" AutoPostBack="true" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged"></asp:DropDownList><br /><br />
    <asp:Label ID="lblsubcat" runat="server" CssClass="lblsubcat">Add Subcategory :</asp:Label>
    <asp:DropDownList ID="ddlsubcat" runat="server" CssClass="ddlsubcat" AutoPostBack="true" ></asp:DropDownList><br /><br />
        <asp:TextBox ID="txtprodid" runat="server" Visible="false"></asp:TextBox>
    <asp:Label runat="server" ID="lblprod" CssClass="lblprod">Product Name :</asp:Label>
    <asp:TextBox runat="server" ID="txtaddproduct" CssClass="txtproduct"> </asp:TextBox><br /><br />
    <asp:Label runat="server" ID="lblprice" CssClass="lblprice">Add Price :</asp:Label>
    <asp:TextBox runat="server" ID="txtprice" CssClass="txtprice" ></asp:TextBox><br /><br />
        <asp:Label runat="server" ID="lbldesc" CssClass="lbldesc">Product Description :</asp:Label>
        <asp:TextBox runat="server" ID="txtdesc" CssClass="txtdesc"></asp:TextBox><br /><br />
        <asp:Label ID="lblimage" CssClass="lblimage" runat="server">Select Image:</asp:Label>
        <asp:FileUpload runat="server" ID="fldprod" CssClass="fldprod"/>
        <asp:Button runat="server" ID="btnprod" CssClass="btnprod" Text="Add" OnClick="btnprod_Click1"/>
        </div>

    <asp:GridView ID="GridView1"  CssClass="grid" runat="server" AllowSorting="True" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit">
        <Columns>

                 <asp:TemplateField HeaderText="ID" Visible="false">
                  <ItemTemplate>
               <asp:Label ID="prodid"  runat="server" Text='<%# Eval("prod_id") %>' ></asp:Label>
           </ItemTemplate>
           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
       </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_id","Add_product.ashx?myimg={0}") %>'  Width="68%"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload id="fldgrp" runat="server" />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_id","Add_product.ashx?myimg={0}") %>' Width="68%"/>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
            </asp:TemplateField>
  
           <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("prod_name") %>' ></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("prod_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Price">
                <ItemTemplate>
                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("prod_price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtprice" runat="server" Text='<%# Eval("prod_price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("prod_Descriptions") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtdesc" runat="server" Text='<%# Eval("prod_Descriptions") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="48%"/>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Oprations">
                          <ItemTemplate>
                             <asp:ImageButton ID="ImageButton1" ImageUrl="~/cafe_management/Crud_images/edit.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="30%"/>
                              <asp:ImageButton ID="ImageButton2" ImageUrl="~/cafe_management/Crud_images/Delete.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="30%"/>
                          </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton3" ImageUrl="~/cafe_management/Crud_images/save.png" CommandName="Update" runat="server" ToolTip="Update" Width="30%"/>
                                    <asp:ImageButton ID="ImageButton4" ImageUrl="~/cafe_management/Crud_images/Cancal.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="30%"/>
                                </EditItemTemplate>
                      </asp:TemplateField>
                    </Columns>
    </asp:GridView>
</asp:Content>

