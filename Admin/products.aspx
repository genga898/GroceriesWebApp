<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="GroceriesWebApp.Admin.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="dash">
   
    <!-----------product table----------->

    <div class="table_d">
        <h2>Product List</h2>
        <table >            
            <tbody>          
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="product_id" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns >
                    <asp:BoundField DataField="product_id" HeaderText="Product ID" />
                    <asp:BoundField DataField="name" HeaderText="Product Name"  />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="ImageUrl" HeaderText="Image" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="created_at" HeaderText="Date" />
                    <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="btnupdate" runat="server" style="text-decoration:none;" OnClick="btnupdate_Click">Update</asp:LinkButton>
                <asp:LinkButton ID="btnDelete"  runat="server" CommandName="Delete" 
                    OnClientClick="return confirm('Are you sure you want to delete this product?')"
                    style="text-decoration:none;color:red;" >Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                   
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            </tbody>
        </table>

        <!-----------the update form----------->
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
         <div id="update">
             <asp:Label ID="Label1" runat="server" Text="ProductId"></asp:Label>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              <br />
             <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
             <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KapfarmConnectionString %>" SelectCommand="SELECT [name] FROM [Categories]"></asp:SqlDataSource>
             <br />
             <asp:Label ID="Label6" runat="server" Text="ProductName"></asp:Label>
             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
              <br />
              <asp:Label ID="Label7" runat="server" Text="price"></asp:Label>
             <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
              <br />
              <asp:Label ID="Label8" runat="server" Text="Quantity"></asp:Label>
             <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
             <br />
             <asp:FileUpload ID="FileUpload2" runat="server" />
             <br />
             <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
         </div>
        </asp:PlaceHolder> 
    </div>
         
 </div>
</asp:Content>
