<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cartItem.ascx.cs" Inherits="GroceriesWebApp.Users.cart" %>
<script>
    function decreaseQuantity() {
        var quantity = parseInt(document.getElementById("txtQuantity").value);
        if (quantity == 0) {
            document.getElementById("txtQuantity").value = quantity;
        } else {
            document.getElementById("txtQuantity").value = quantity - 1;
        }
    }

    function increaseQuantity() {
        var quantity = parseInt(document.getElementById("txtQuantity").value);
        document.getElementById("txtQuantity").value = quantity + 1;
    }

</script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<asp:Repeater ID="rprCartItem" runat="server">
    <ItemTemplate>
        <div class="card cart-item">
            <div class="row no-gutters">
                <div class="col-md-4">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl")%>' AlternateText="Product Image" CssClass="card-img" Height="100%" Width="100%" ImageAlign="AbsMiddle" />
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><asp:Literal ID="Literal1" runat="server" Text='<%# Eval("name") %>'></asp:Literal></h5>
                        <p class="card-text">Ksh: <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("price") %>'></asp:Literal></p>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" id="btnDecrease" class="quantity-button input-group-text" onclick ="decreaseQuantity();" >-</button>
                            </div>
                            <input type="number" id="txtQuantity" class="quantity-input text-center form-control" value="<%# Eval("Quantity")%>" />
                            <div class="input-group-append">
                                <button type="button" id="btnIncrease" class="quantity-button input-group-text" onclick="increaseQuantity();" >+</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-sm btn-danger w-100" OnClick="btnRemove_OnClick" CommandArgument='<%# Eval("cart_id") %>'/>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>