<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="GroceriesWebApp.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/login.css"/>
    <script  src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.3/sweetalert2.all.js" integrity="sha512-5gz/at+6LT6tuaX/ritelLOHwVc0CoXsspPbUBPdoIrOLshcpguRTMBAKVZCdG//YdwyYP2c4n7NMaDqVXWTJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script>
        function sweetAlert() {
            Swal.fire({
                icon: 'success',
                title: 'Registration Successful',
                text: 'Welcome to Kapfarm Groceries!'
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main_parent">
                <div class="form_wrap">
                    <form>
                        <asp:Label ID="lblRegConfirm" runat="server" Text="" Visible="False" CssClass="alert alert-success" role="alert"></asp:Label>
                        <h1>Welcome </h1>
                        <h3>sign up with your email and password</h3>
                        
                        <div class="background">
                            <img src="../images/Background1.png" alt="background image"/>
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
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a correct email address" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="Vg" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])">*</asp:RegularExpressionValidator>
                            <asp:Label ID="lblEmailError" runat="server" Text="" CssClass="form-control" Visible="False" ForeColor="Red"></asp:Label>
                            <br/>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="inputs">
                            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfdPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="Vg">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Please enter a password with a character, numbers and at least one symbols eg: Hello23$" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="Vg" ValidationExpression='^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'>*</asp:RegularExpressionValidator>
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
                            <asp:Button ID="btnSubmit" CssClass="btn btn-outline-success" runat="server" Text="Submit" OnClick="rgsSubmit_Click" ValidationGroup="Vg" />
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
