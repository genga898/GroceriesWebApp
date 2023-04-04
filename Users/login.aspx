<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GroceriesWebApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"  href="../CSS/login.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main_parent">
                <div class="form_wrap">
                    <form>
                        <h1>Welcome Back</h1>
                        <h3>sign in with your email and password</h3>
                        
                        <div class="background">
                            <img src="../images/Background1.png" alt="background image">
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email address is required" ForeColor="Red" ValidationGroup="Vg" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Kindly enter the correct email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="Vg">*</asp:RegularExpressionValidator>
                            <br/>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Please enter password" ForeColor="Red" ValidationGroup="Vg" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                            <br/>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="forgot">
                            <a href="forgotpassword.aspx">Forgot password?</a>
                        </div>
                        <div class="submit_btn">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-outline-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="Vg" />
                        </div>
                        <div class="signupl">
                            <h4>Don't have an account?<a href="register.aspx">Sign up</a></h4>
                        </div>
                    </form>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Vg" ForeColor="Red" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
