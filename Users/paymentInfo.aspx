<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Users/grocery.Master" AutoEventWireup="true" CodeBehind="paymentInfo.aspx.cs" Inherits="GroceriesWebApp.Users.paymentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid d-flex justify-content-center align-items-center">
            <div class="col-3 py-3">
                <p class="fs-4 text-center">Mpesa Payment Information</p>
            <div class="mb-3">
                <asp:Label ID="Label1" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox><br/>
                <asp:RequiredFieldValidator ID="rfdName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" CssClass="form-control bg-transparent" ValidationGroup="form-control" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label2" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" placeholer="+245768188328"></asp:TextBox><br/>
                <asp:RequiredFieldValidator ID="rfdNumber" runat="server" ErrorMessage="Phone Number is required" CssClass="form-control  bg-transparent" ControlToValidate="txtNumber" ValidationGroup="form-control" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="redNumber" runat="server" ErrorMessage="Please enter a correct mobile number" ValidationGroup="form-control bg-transparent" CssClass="form-control" ControlToValidate="txtNumber" ValidationExpression="^(?:\+254|0)?((?:011[2-5]|07[0-29]|074[0-3,5-6,8]|075[7-9]|076[8-9]|079)\d{6}|1(?:[1-9]\d{6}|0[1-9]\d{5}))$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label3" runat="server" Text="Address" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder 
                             ="Eg: Oloosurutia Rd, House 10"></asp:TextBox><br/>
                <asp:RequiredFieldValidator ID="rfdAddress" runat="server" ErrorMessage="Address is required" Display="Dynamic" ValidationGroup="form-control bg-transparent" CssClass="form-control" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:Button runat="server" Text="Submit" CssClass="btn btn-outline-success" OnClick="OnClick" ValidationGroup="form-control" />
            </div>
        </div>
    
</asp:Content>
