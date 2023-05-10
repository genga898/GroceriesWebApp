<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="GroceriesWebApp.Admin.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dash">
        <div class="passbox">
            <h2>Change Password</h2>
            <div class="passcards">
                <asp:Label ID="Label1" runat="server" Text="Current Password" ></asp:Label><br/>
                <asp:TextBox ID="TextBox1" runat="server" class="inputs" placeholder="current holder"></asp:TextBox><br />
            </div>
            <div class="passcards">
                <asp:Label ID="Label2" runat="server" Text="New Password" ></asp:Label><br/>
                <asp:TextBox ID="TextBox2" runat="server" class="inputs" placeholder="new password"></asp:TextBox><br />
            </div>
            <div class="passcards">
                <asp:Label ID="Label3" runat="server" Text="Confirm new password" ></asp:Label><br/>
                <asp:TextBox ID="TextBox3" runat="server" class="inputs" placeholder="confirm new password"></asp:TextBox><br />
            </div>
            <div class="buttons">
                <asp:Button ID="Button1" runat="server" class="btn" Text="Cancel" />
        
                <asp:Button ID="Button4" runat="server"  class="btn" Text="Confirm" />
            </div>
        </div>
    </div>
</asp:Content>
