<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cart.ascx.cs" Inherits="GroceriesWebApp.Users.cart" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<div class="card cart-item">
    <div class="row no-gutters">
        <div class="col-md-4">
            <asp:Image ID="imgProduct" runat="server" ImageUrl="https://example.com/image.jpg" AlternateText="Product Image" CssClass="card-img" />
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><asp:Literal ID="ltProductTitle" runat="server" Text="Product Title"></asp:Literal></h5>
                <p class="card-text"><asp:Literal ID="ltProductPrice" runat="server" Text="$9.99"></asp:Literal></p>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="quantity-button input-group-text" />
                    </div>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantity-input form-control" Text="1"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="quantity-button input-group-text" />
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-sm btn-danger w-100" />
            </div>
        </div>
    </div>
</div>
