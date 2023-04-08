<%@ Page Title="" Language="C#" MasterPageFile="../Users/grocery.Master" AutoEventWireup="true" CodeBehind="vegetables.aspx.cs" Inherits="GroceriesWebApp.vegetables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../CSS/productCard.css"/>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.7.2/css/all.css"></script>
    <script defer src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p class="text-center display-6">Vegetables</p>
    </div>
    <div class="container-fluid py-3 gap-1">
        <asp:Repeater ID="rpVegetables" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 col-md-4 col-lg-2">
                    <div class="card">
                        <div class="card-img-top">
                            <asp:Image runat="server" ID="imgProduct" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><asp:Literal runat="server" ID="litProductName" Text="Product Name" /></h5>
                            <p class="card-text"><asp:Literal runat="server" ID="litProductDescription" Text="Product Description" /></p>
                            <div class="row">
                                <div class="col-6">
                                    <p><asp:Literal runat="server" ID="litProductPrice" Text="$10.99" /></p>
                                </div>
                                <div class="col-6">
                                    <asp:Button runat="server" ID="btnAddToCart" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
