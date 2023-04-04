<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="GroceriesWebApp.forgotpassword" %>

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

                    <form action="">
                        <h1>Reset Password</h1>
                        <h3>Password should have atleast six characters</h3>

                        <div class="background">
                            <img src="../images/Background1.png" alt="background image">
                        </div>
                        <div class="inputs ">
                            <asp:Label ID="Label1" runat="server" Text="Email Address"></asp:Label>
                            <br/>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder ="john16@gmail.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validateEmail" runat="server" ErrorMessage="Email address is required" ValidationGroup="Vg" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ErrorMessage="Please enter correct email address" ControlToValidate="txtEmail" ValidationGroup="Vg" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br/>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validatePass" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="Vg" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgePass" runat="server" ErrorMessage="Please enter a password with character, numbers and symbols eg: Hello23$" ValidationGroup="Vg" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label><br/>
                            <asp:TextBox ID="txtConfirmpass" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validatePassconfirm" runat="server" ErrorMessage="Confirm password is required" ForeColor="Red" ControlToValidate="txtConfirmpass" ValidationGroup="Vg" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="txtConfirmpass" ForeColor="Red" ControlToCompare="txtPassword" ValidationGroup="Vg" Display="Dynamic"></asp:CompareValidator>
                        </div>
                        <div class="submit_btn">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-outline-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="Vg" />
                        </div>
                        <div class="signupl">
                            <h4>Don't have an account?<a href="register.aspx">Sign up</a></h4>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
