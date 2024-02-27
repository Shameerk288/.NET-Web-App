<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Babyworld.store.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .product {
            background-color: #eee;
        }

        .act-price {
            color: red;
            font-weight: 700;
        }

        .about {
            font-size: 14px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Product Detail</h4>
                        <div class="breadcrumb__links">
                            <asp:LinkButton ID="btnhome" runat="server" Text="Home" OnClick="btnhome_Click" Font-Underline="false"></asp:LinkButton>
                            <span>Product Detail</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="alert alert-success" role="alert" id="dvsuccess" runat="server" visible="false">
    </div>


    <div class="container mt-2 mb-5">
        <div class="row d-flex justify-content-center">
            <asp:Label runat="server" CssClass="text-center my-1" Font-Size="25px">Product Details</asp:Label>
            <div class="col-md-10">
                <div class="card">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="images p-3">
                                <div class="text-center p-4">
                                    <asp:Image ID="productimage" runat="server" Height="250px" Width="300px" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product p-4">
                                <div class="mt-4 mb-3">

                                    <h5 class="text-uppercase my-2">
                                        <asp:Label ID="lblproductname" runat="server"></asp:Label></h5>
                                    <div class="price d-flex flex-row align-items-center">
                                        <span class="act-price my-1">RS ,
                                            <asp:Label ID="lblproductprice" runat="server"></asp:Label></span>
                                    </div>
                                    <div>
                                        <asp:Label ID="lblproductqty" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <p class="about">
                                    <asp:Label ID="lblproductdesc" runat="server"></asp:Label>
                                </p>
                                <div class="cart mt-4 align-items-center">
                                    <asp:Button ID="btnAddtocart" runat="server" CssClass="btn btn-success text-uppercase mr-2 px-4" Text="Add To Cart" OnClick="btnAddtocart_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
