<%@ Page Title="" Language="C#" MasterPageFile="~/grocery.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GroceriesWebApp.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" class="container-fluid justify-content-center align-items-center flex-column text-center" >
        <h1 style="color: white">Fresh Groceries at your Doorstep<br/>Order Now</h1>
    </div>
    <section id="#latestContents">
        <div class="container-fluid">
            <div id="#latestContent" class="d-flex align-items-center justify-content-between mt-2 mb-2 px-3 mx-3 text-dark">
                <h5 class>Latest Purchases</h5>
                <h5>More</h5>
            </div>
        </div>
        <div id="#cardLatest"  class="container-fluid gap-2 ">
            <div class="row mx-3 py-2">
                <div class="card justify-content-around" style="width: 14rem;"  >
                    <img src="./images/bananas.jpg" class="card-img-top" alt="bananas" style="width: 100%">
                    <div class="card-body">
                        <p class="card-text">Bananas<br/>Ksh: 50</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="#categories">
        <div class="container-fluid">
            <div class="d-flex align-items-center justify-content-between mt-2 mb-2 px-3 mx-3 text-dark">
                <h5 class>Categories</h5>
                <h5>More</h5>
            </div>
        </div>
        <div class="container-fluid gap-2">
            <div class="row mx-3 py-2">
                <div class="card text-white border-0 justify-content-center" style="height: 20rem; width: 18rem; ">
                    <img src="./images/categorydairy.jpg" class="card-img" alt="Dairy" style="width: 16rem; height: 20rem;">
                    <div class="card-img-overlay">
                        <h5 class="card-title text-center">Dairy</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
