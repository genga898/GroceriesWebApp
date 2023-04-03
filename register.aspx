<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="GroceriesWebApp.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/login.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main_parent">
                <div class="form_wrap">
                    <form>
                        <h1>Welcome </h1>
                        <h3>sign up with your email and password</h3>
                        
                        <div class="background">
                            <img src="images/Background1.png" alt="background image">
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label1" runat="server" Text="Full Names"></asp:Label>
                            <asp:RequiredFieldValidator ID="validateName" runat="server" ErrorMessage="Full name is required" Text="*" ControlToValidate="txtFullnames" ValidationGroup="Vg" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br/>
                            <asp:TextBox ID="txtFullnames" runat="server"></asp:TextBox>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label2" runat="server" Text="Email Address"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email address is required" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="Vg">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a correct email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="Vg">*</asp:RegularExpressionValidator>
                            <br/>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfdPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="Vg">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Please enter a password with character, numbers and symbols eg: Hello23$" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="Vg">*</asp:RegularExpressionValidator>
                            <br/>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Confirm Password is required" ControlToValidate="txtConfirmpass" ForeColor="Red" ValidationGroup="Vg">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvConfirmPass" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmpass" ForeColor="Red" ValidationGroup="Vg">*</asp:CompareValidator>
                            <br/>
                            <asp:TextBox ID="txtConfirmpass" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="submit_btn">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-outline-primary" runat="server" Text="Submit" OnClick="rgsSubmit_Click" ValidationGroup="Vg"/>
                        </div>
                        <div class="signupl">
                            <h4>Already have an account?<a href="login.aspx">Sign in</a></h4>
                        </div>
                    </form>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Vg" ForeColor="Red" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
