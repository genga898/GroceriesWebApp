<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userAccount.ascx.cs" Inherits="GroceriesWebApp.Users.WebUserControl2" %>
<div class="dropdown d-sm-none d-lg-block me-4">
    <a class="btn text-white dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
       Account&nbsp; <i class="fa fa-user-circle fa-2xl"></i>
    </a>
    <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="accountInfo.aspx">Account Info</a></li>
        <li><asp:LinkButton ID="logout" CssClass="dropdown-item"  OnClick="logout_Click" runat="server">Logout</asp:LinkButton></li>
    </ul>
</div>