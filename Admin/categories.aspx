<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="GroceriesWebApp.Admin.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dash">
        <!--category creation-->
    <div class="passbox1">
        <h2>Create Category</h2>
        <div class="passcards1"> 
            <asp:Image ID="Image1" runat="server" /><br />
            <asp:FileUpload ID="fuCategory" runat="server" /><br/><br/>
            <asp:Label ID="Label6" runat="server" Text="Category Name"></asp:Label><br/>
            <asp:TextBox ID="tblcatname" runat="server" class="inputs" ></asp:TextBox>
            <br /><br/>
            <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" />
            <br /><br/>
            <asp:Label ID="lbldis" runat="server" Text="Label"></asp:Label>
    </div>
        <div class="passcards1">&nbsp;</div>
        <!--product creation-->
    <div class="passbox">
        <h2>Create Product</h2>        
        <div class="passcards">            
            <asp:Label ID="Label1" runat="server" Text="Category Name" ></asp:Label><br/>
                <asp:DropDownList ID="ddlCategory" runat="server" class="inputs" DataSourceID="sdsCategory" DataTextField="name" DataValueField="category_id" AutoPostBack="True" >
                </asp:DropDownList> 
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:KapfarmConnectionString %>" SelectCommand="SELECT [name], [category_id] FROM [Categories]"></asp:SqlDataSource>
        </div>

         <div class="passcards">
            <asp:Label ID="Label2" runat="server" Text="Product name" ></asp:Label><br/>
            <asp:TextBox ID="txtprodname" runat="server" class="inputs" placeholder="product name"></asp:TextBox><br />
         </div>

        <div class="passcards">
            <asp:Label ID="Label4" runat="server" Text="Price" ></asp:Label><br/>
            <asp:TextBox ID="txtprice" runat="server" class="inputs" placeholder="price"></asp:TextBox><br />
         </div>

         <div class="passcards">
            <asp:Label ID="Label5" runat="server" Text="Quantity" ></asp:Label><br/>
            <asp:TextBox ID="txtquantity" runat="server" class="inputs" placeholder="quantity"></asp:TextBox><br />
         </div>
         <div class="passcards">
             <asp:Label ID="Label3" runat="server" Text="Image" ></asp:Label><br/>
             <asp:FileUpload ID="fuProduct" runat="server" />            
        </div>
        <div class="buttons">
            <asp:Button ID="Button1" runat="server" class="btn" Text="Cancel" OnClick="Button1_Click" />
        
            <asp:Button ID="Button4" runat="server"  class="btn" Text="Confirm" OnClick="Button4_Click" />
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbldis2" runat="server" Text="Label"></asp:Label>
    </div>
</div>
    </div>
</asp:Content>
