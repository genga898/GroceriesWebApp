<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="GroceriesWebApp.Admin.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dash">
        <!--display cards-->
    <div class="cardbox">
        <div class="card">
            <div>
                <div class="num">
                    <asp:Label ID="Label1" runat="server" Text="104"></asp:Label>
                </div>
                <div class="cardname">Products</div>
            </div>
            <div class="cardicon">
                <i class="fa fa-apple" aria-hidden="true"></i>
            </div>
        </div>

        <!--orders-->
        <div class="card">
            <div>
                <div class="num">
                     <asp:Label ID="Label2" runat="server" Text="104"></asp:Label>
                </div>
                <div class="cardname">Orders</div>
            </div>
            <div class="cardicon">
                <i class="fa fa-tasks" aria-hidden="true"></i>
            </div>
        </div>

     <!--customers-->
        <div class="card">
            <div>
                <div class="num">
                     <asp:Label ID="Label3" runat="server" Text="104"></asp:Label>
                </div>
                <div class="cardname">Customers</div>
            </div>
            <div class="cardicon">
                <i class="fa fa-users" aria-hidden="true"></i>
            </div>
        </div>

    <!--income-->
        <div class="card">
            <div>
                <div class="num">
                     <asp:Label ID="Label4" runat="server" Text="104"></asp:Label>
                </div>
                <div class="cardname">Income</div>
            </div>
            <div class="cardicon">
                <i class="fa fa-usd" aria-hidden="true"></i>
             </div>
        </div>
   </div>

        <!--the table-->
    
    <div class="table_d">
        <h2>Order List</h2>
        <table >
            <thead>
                <tr>
                    <th>Order id</th>
                    <th>Date</th>
                    <th>Customer Name</th>
                    <th>Location</th>
                    <th>Amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#568549</td>
                    <td>26 March 2020</td>
                    <td>David rris</td>
                    <td>Nairobi</td>
                    <td>1000</td>
                    <td>
                       <asp:Button ID="Button1" runat="server" Text="Delete" OnClick="Button1_Click" />
                    </td>
                    
                </tr>
                 <tr>
                    <td>#568549</td>
                    <td>26 March 2020</td>
                    <td>David rris</td>
                    <td>Nairobi</td>
                    <td>1000</td>
                    <td><asp:Button ID="Button2" runat="server" Text="Delete" /></td>
                    
                </tr>
                 <tr>
                    <td>#568549</td>
                    <td>26 March 2020</td>
                    <td>David rris</td>
                    <td>Nairobi</td>
                    <td>1000</td>
                    <td><asp:Button ID="Button3" runat="server" Text="Delete" /></td>
                    
                </tr>
                 <tr>
                    <td>#568549</td>
                    <td>26 March 2020</td>
                    <td>David rris</td>
                    <td>Nairobi</td>
                    <td>1000</td>
                    <td><asp:Button ID="Button4" runat="server" Text="Delete" /></td>
                    
                </tr>
            </tbody>
        </table>
    </div>
 </div>
</asp:Content>
