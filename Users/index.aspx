<%@ Page Title="" Language="C#" MasterPageFile="../Users/grocery.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GroceriesWebApp.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" class="container-fluid justify-content-center align-items-center flex-column text-center" >
        <h1 style="color: white">Fresh Groceries at your Doorstep<br/>Order Now</h1>
    </div>
    <section id="#categories" class="mx-3 py-2">
        <div class="container-fluid pb-1">
            <div class="d-flex align-items-center justify-content-center mt-2 mb-2 px-3 mx-3 text-dark">
                <h5 class="display-5">Categories</h5>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row gap-1 d-flex flex-row justify-content-sm-evenly" id="categories">
                <div class="card text-white border-0 col-sm-12 col-2">
                    <img src="../images/categorydairy.jpg" class="card-img img-fluid" alt="Dairy">
                    <div class="card-img-overlay align-items-center d-flex justify-content-center">
                        <a href="dairy.aspx" class="text-white"><h5 class="card-title text-center display-6">Dairy</h5></a>
                    </div>
                </div>
                <div class="card text-white border-0 col-sm-12 col-2">
                    <img src="../images/categoryvegetables.jpg" class="card-img img-fluid" alt="Dairy">
                    <div class="card-img-overlay align-items-center d-flex justify-content-center">
                        <a href="vegetables.aspx" class="text-white"><h5 class="card-title text-center display-6">Vegetables</h5></a>
                    </div>
                </div>
                <div class="card text-white border-0 col-sm-12 col-2">
                    <img src="../images/categoryfruits.jpg" class="card-img img-fluid" alt="Dairy">
                    <div class="card-img-overlay align-items-center d-flex justify-content-center">
                        <a href="fruits.aspx" class="text-white"><h5 class="card-title text-center display-6">Fruits</h5></a>
                    </div>
                </div>
                <div class="card text-white border-0 col-sm-12 col-2">
                    <img src="../images/Fresh Juice.jpg" class="card-img img-fluid" alt="Dairy">
                    <div class="card-img-overlay align-items-center d-flex justify-content-center">
                        <a href="freshjuice.aspx" class="text-white"><h5 class="card-title text-center display-6">Fresh Juice</h5></a>
                    </div>
                </div>
                <div class="card text-white border-0 col-sm-12 col-2">
                    <img src="../images/kienyeji.jpg" class="card-img img-fluid" alt="Dairy">
                    <div class="card-img-overlay align-items-center d-flex justify-content-center">
                        <a href="eggs.aspx" class="text-white"><h5 class="card-title text-center display-6">Eggs</h5></a>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <section id="FAQ" class="mx-3 py-3">
            <div class="text-black text-center display-5 pt-5">
                <p>FAQ's</p>
            </div>
            <div class="container-fluid d-flex justify-content-center align-content-center pb-5">
            <div class="accordion w-75" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            How do I contact customer support?
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            You can contact our support team via Live chat on WhatsApp or call 0768188328
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Are there any service or delivery fees?
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            Yes, we charge different rates depending on the delivery location. The delivery charges are calculated on checkout.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            How do i earn rewards points on my online orders?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            To join our rewards program contact us via Live chat on WhatsApp or call 0768188328, you will then earn points from your online orders. You will earn 1 point for every Ksh 100 spent.  
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            What are acceptable payment methods?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            We accept both M-PESA and credit cards
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            Can i return my order?
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            If you are dissatisfied with certain items in your order, contact customer service to initiate a refund.
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>
</asp:Content>
