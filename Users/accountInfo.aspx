<%@ Page Title="" Language="C#" MasterPageFile="../Users/grocery.Master" AutoEventWireup="true" CodeBehind="accountInfo.aspx.cs" Inherits="GroceriesWebApp.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p-2">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title text-center display-6">Profile Card</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <asp:Image ID="ProfileImage" runat="server" CssClass="img-fluid rounded-circle mb-3" Height="200" Width="200" ImageUrl="~/images/Stone Fruits.jpg" />
                </div>
                <div class="col-md-8">
                    <h3><asp:Literal ID="UserName" runat="server" Text="John Doe"></asp:Literal></h3>
                    <p><asp:Literal ID="UserLocation" runat="server" Text="San Francisco, CA"></asp:Literal></p>
                    <hr class="d-md-none" />
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <h6>Email</h6>
                        </div>
                        <div class="col-12 col-md-8">
                            <p><asp:HyperLink ID="UserEmail" runat="server" NavigateUrl="mailto:john.doe@example.com" Text="john.doe@example.com"></asp:HyperLink></p>
                        </div>
                        <div class="col-12 col-md-4">
                            <h6>Phone</h6>
                        </div>
                        <div class="col-12 col-md-8">
                            <p><asp:Literal ID="UserPhone" runat="server" Text="(123) 456-7890"></asp:Literal></p>
                        </div>
                        <div class="col-12 col-md-4">
                            <h6>Website</h6>
                        </div>
                        <div class="col-12 col-md-8">
                            <p><asp:HyperLink ID="UserWebsite" runat="server" NavigateUrl="https://www.example.com" Target="_blank" Text="www.example.com"></asp:HyperLink></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</asp:Content>
