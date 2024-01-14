    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Registrion.aspx.cs" Inherits="Admin_Registrion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrion</title>
    <link href="register.css" rel="stylesheet" />
</head>
<body>
    
    <div class="regstrionbox">
        <img src="../register_Logo-removebg-preview.png"  alt="Alternate Text" class="user"/>
        <form id="form1" runat="server">
            <asp:HyperLink CssClass="hpllogout" runat="server" NavigateUrl="Admin_Login.aspx">LogOut/SignUp</asp:HyperLink>
                    <asp:TextBox  runat="server" Visible="False" Width="48px" ID="id"></asp:TextBox><br />
                    <asp:Label CssClass="lblname" runat="server" Text="Enter Name:  "></asp:Label>
                        <asp:TextBox ID="txtname" CssClass="txtname"  runat="server" placeholder="Enter Name"></asp:TextBox><br /><br /><asp:RequiredFieldValidator ValidationGroup="reg" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>

                      <asp:Label CssClass="lblradio" runat="server" Text="Select Gender :"></asp:Label>
                            <asp:RadioButton ID="male" Cssclass="rbtnmale" runat="server"  Text="Male" Checked="True" ForeColor="White" />
                            <asp:RadioButton ID="female" CssClass="rtnfemale" runat="server" Text="Female" ForeColor="White" /><br />

                        <asp:Label CssClass="lblcity" runat="server" Text="Enter City :" ></asp:Label>
                        <asp:TextBox ID="txtcity" CssClass="txtcity" runat="server" placeholder="Enter City"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="reg" runat="server" ErrorMessage="Enter City" ControlToValidate="txtcity" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>

                        <asp:Label CssClass="lblmob" runat="server" Text="Enter Mobile No. :"></asp:Label>
                        <asp:TextBox ID="txtcontact" CssClass="txtcontact" runat="server" MaxLength="10" placeholder="Enter Contect No"></asp:TextBox><br /><asp:RequiredFieldValidator ValidationGroup="reg" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact No" ControlToValidate="txtcontact" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>

                        <asp:Label CssClass="lblemail" runat="server" Text="Enter Email Id :"></asp:Label>
                        <asp:TextBox ID="txtemail" CssClass="txtemail" runat="server" placeholder="Enter Email"></asp:TextBox><br /><asp:RequiredFieldValidator ValidationGroup="reg" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtemail" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email " ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></br>

                        <asp:Label CssClass="lblpass" runat="server" Text="Enter Password :"></asp:Label>
                        <asp:TextBox ID="txtpass" CssClass="txtpass" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox><br /><asp:RequiredFieldValidator ValidationGroup="reg" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpass" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator></br>

                        <asp:Label CssClass="lblcpass"  runat="server" Text="Confirm Password :"></asp:Label>
                        <asp:TextBox ID="txtcpass" CssClass="txtcpass" runat="server" TextMode="Password" placeholder="Enter Confrim Password"></asp:TextBox><asp:RequiredFieldValidator ValidationGroup="reg" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="txtcpass" Display="Dynamic" ForeColor="White"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both Are not same" ControlToCompare="txtpass" ControlToValidate="txtcpass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator></br>
                        <br /><br />
                        <asp:Button   Text="Submit" CssClass="btnsubmit" runat="server" ID="btnsubmit" ValidationGroup="reg" OnClick="btnsubmit_Click"  />
                        <br /><br />


            <div>
            <asp:GridView ID="GridView1"  runat="server" CssClass="grid"  AutoGenerateColumns="False" HorizontalAlign="Center" AllowSorting="True" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                  <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblID" Text='<%# Eval("reg_id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblID" Text='<%# Eval("reg_id") %>' runat="server"></asp:Label>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("name") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("gender") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtgender" Text='<%# Eval("gender") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("city") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcity" Text='<%# Eval("city") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile No.">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("contact_no") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcontact" Text='<%# Eval("contact_no") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("email") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail" Text='<%# Eval("email") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label  Text='<%# Eval("password") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpassword" Text='<%# Eval("password") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="95%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"  />
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Oprations">
                          <ItemTemplate>
                             <asp:ImageButton ImageUrl="~/cafe_management/Crud_images/edit.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="28%"/>
                              <asp:ImageButton ImageUrl="~/cafe_management/Crud_images/Delete.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="28%"/>
                          </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ImageUrl="~/cafe_management/Crud_images/save.png" CommandName="Update" runat="server" ToolTip="Update" Width="28%"/>
                                    <asp:ImageButton ImageUrl="~/cafe_management/Crud_images/Cancal.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="28%"/>
                                </EditItemTemplate>
                      </asp:TemplateField>
                    </Columns>
            </asp:GridView>

            
        </div>
                   </form>
        
    </div>
                 
</body>
</html>
