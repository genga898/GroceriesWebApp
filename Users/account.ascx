<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="account.ascx.cs" Inherits="GroceriesWebApp.Users.WebUserControl1" %>
<li class="nav-item dropdown d-lg-none">
    <div class="dropdown">
        <asp:HyperLink ID="hplAccount" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" runat="server">Account</asp:HyperLink>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="accountInfo.aspx">Account Info</a></li>
            <li><asp:LinkButton ID="logout" CssClass="dropdown-item"  OnClick="logout_Click" runat="server">Logout</asp:LinkButton></li>
        </ul>
    </div>
</li>