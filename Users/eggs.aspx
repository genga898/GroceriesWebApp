<%@ Page Title="" Language="C#" MasterPageFile="../Users/grocery.Master" AutoEventWireup="true" CodeBehind="eggs.aspx.cs" Inherits="GroceriesWebApp.eggs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../CSS/productCard.css"/>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.7.2/css/all.css"></script>
    <script defer src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p class="text-center display-6">Eggs</p>
    </div>
    <div class="container-fluid py-3 gap-1">
        <asp:Repeater ID="rpEggs" runat="server">
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
    <div class="container-fluid my-3 gap-0 d-flex flex-wrap">
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
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image1" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal1" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal2" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal3" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button1" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image2" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal4" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal5" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal6" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button2" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image3" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal7" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal8" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal9" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button3" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image4" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal10" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal11" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal12" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button4" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image5" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal13" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal14" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal15" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button5" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image6" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal16" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal17" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal18" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button6" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-2">
        <div class="card">
            <div class="card-img-top">
                <asp:Image runat="server" ID="Image7" CssClass="card-img-fixed-height" ImageUrl="~/images/cheese.jpg" />
            </div>
            <div class="card-body">
                <h5 class="card-title"><asp:Literal runat="server" ID="Literal19" Text="Product Name" /></h5>
                <p class="card-text"><asp:Literal runat="server" ID="Literal20" Text="Product Description" /></p>
                <div class="row">
                    <div class="col-6">
                        <p><asp:Literal runat="server" ID="Literal21" Text="$10.99" /></p>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="Button7" Text="Add to Cart" CssClass="btn btn-outline-success float-right" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
