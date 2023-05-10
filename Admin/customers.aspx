<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="GroceriesWebApp.Admin.customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dash" >
         <div >
            
               <asp:Button ID="Button5" runat="server" Text="+ User" class="cbtn" OnClientClick="showDiv();return false;"  />
         </div>
         <!--create a new user-->
         <div class="create" id="myDiv" style="display:none;" >
             <div class="c_form">

                 <h2>New User</h2>
             <asp:TextBox ID="textname" runat="server" placeholder="Names"></asp:TextBox>
             <br />
             <asp:TextBox ID="textemail" runat="server" placeholder="Email"></asp:TextBox>
             <br />
                 <asp:TextBox ID="textpassword" runat="server" placeholder="Password"></asp:TextBox>
             <br />
             <asp:TextBox ID="textconfirm" runat="server" placeholder="Confirm Password"></asp:TextBox>
              <br />


                 <asp:Button ID="btn_4" runat="server" Text="Submit" Onclick="btn_4_Click" />
                

             </div>      
             
         </div>
   
    
    <div class="table_d">
        <h2>Customer List</h2>
        <table >
            <tbody>
                <!---viewing the cuatomers-->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="user_id"  BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="User ID" />
                        <asp:BoundField DataField="names" HeaderText="Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="created_at" HeaderText="Date" />
                        <asp:TemplateField HeaderText="Actions">
                             <ItemTemplate>
                               
                                <asp:LinkButton ID="btnDelete"  runat="server" CommandName="Delete" 
                                    OnClientClick="return confirm('Are you sure you want to delete this product?')"
                                    style="text-decoration:none;color:red;" >Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />

                </asp:GridView>
                 
            </tbody>
        </table>
    </div>
 </div>

    <!-----------display modal------------->
   <script>
       function showDiv() {
           document.getElementById("myDiv").style.display = "block";
           
           return false;
       }
       
          
       
   </script>
</asp:Content>
