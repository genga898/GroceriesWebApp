<%@ Page Title="" Language="C#" MasterPageFile="../Users/grocery.Master" AutoEventWireup="true" CodeBehind="eggs.aspx.cs" Inherits="GroceriesWebApp.eggs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../CSS/productCard.css"/>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.7.2/css/all.css"></script>
    <script defer src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p class="text-center display-6">Eggs</p>
    </div>
    <div class="container-fluid py-3 gap-0 d-flex flex-sm-wrap flex-lg-row">
        <asp:Repeater ID="rpEggs" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 col-md-4 col-lg-2">
                    <div class="card">
                        <div class="card-img-top">
                            <asp:Image runat="server" ID="imgProduct" CssClass="card-img-fixed-height" ImageUrl='<%# Eval("ImageUrl") %>' />
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><asp:Literal runat="server" ID="litProductName" Text='<%# Eval("name") %>' /></h5>
                            <p class="card-text"><asp:Literal runat="server" ID="litProductDescription" Text="Eggs" /></p>
                            <div class="row">
                                <div class="col-6">
                                    <p>Ksh: <asp:Literal runat="server" ID="litProductPrice" Text='<%# Eval("price") %>' /></p>
                                </div>
                                <div class="col-6">
                                    <asp:Button runat="server" ID="btnAddToCart" Text="Add to Cart" CssClass="btn btn-outline-success float-right" OnClick="btnAddToCart_OnClick" CommandArgument='<%# Eval("product_id")%>'/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
