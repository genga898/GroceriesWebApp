<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="GroceriesWebApp.Admin.customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dash">
   
    
        <div class="table_d">
            <h2>Customer List</h2>
            <table >
                <thead>
                <tr>
                    <th>User_id</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>#568549</td>
                    <td>David rris</td>
                    <td>d@gmail.com</td>                    
                    <td>26 march 2023</td>
                    <td>
                        <div class="tb_btn">
                            <asp:Button ID="Button1" runat="server" class="act_btn" Text="Edit"  />
                        </div>
                        <div class="tb_btn">
                            <asp:Button ID="Button8" runat="server" class="act_btn" Text="Delete"  />
                        </div>
                    </td>
                    
                </tr>
                <tr>
                    <td>#568549</td>
                    <td>David rris</td>
                    <td>d@gmail.com</td>                    
                    <td>26 march 2023</td>
                    <td>
                        <div class="tb_btn">
                            <asp:Button ID="Button2" runat="server" class="act_btn" Text="Edit"  />
                        </div>
                        <div class="tb_btn">
                            <asp:Button ID="Button3" runat="server" class="act_btn" Text="Delete"  />
                        </div>
                    </td>
                    
                </tr>
                 
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
