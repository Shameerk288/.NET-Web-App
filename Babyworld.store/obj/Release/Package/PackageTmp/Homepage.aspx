<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Babyworld.store.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="alert alert-success" role="alert" id="dvsuccess" runat="server" visible="false">
    </div>

    <div class="container-fluid">
        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <asp:ImageButton ID="slide1" runat="server" ImageUrl="~/assets/images/sliderimg1.jpg" Height="400px" AlternateText="slide1" CssClass="d-block w-100" />
                </div>
                <div class="carousel-item">
                    <asp:ImageButton ID="slide2" runat="server" ImageUrl="~/assets/images/sliderimg2.jpg" Height="400px" AlternateText="slide2" CssClass="d-block w-100" />
                </div>
                <div class="carousel-item">
                    <asp:ImageButton ID="slide3" runat="server" ImageUrl="~/assets/images/sliderimg3.jpg" Height="400px" AlternateText="slide3" CssClass="d-block w-100" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-2 col-md-3">

                <div class="my-4">
                    <asp:Label ID="Label1" runat="server">Choose a Brand : </asp:Label>
                    <ul style="list-style-type: none">

                        <li class="active">
                            <asp:LinkButton ID="btn1" runat="server" Text="All Brands" CommandName="Allbrands" OnCommand="btn1_Command" CssClass="active" ForeColor="RoyalBlue"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btn2" runat="server" Text="Dove" CommandName="Dove" OnCommand="btn1_Command" CommandArgument="Dove" ForeColor="RoyalBlue"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btn3" runat="server" Text="Graco" CommandName="Graco" OnCommand="btn1_Command" CommandArgument="Graco" ForeColor="RoyalBlue"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btn4" runat="server" Text="Huggies" CommandName="Huggies" OnCommand="btn1_Command" CommandArgument="Huggies" ForeColor="RoyalBlue"></asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="btn5" runat="server" Text="Johnson" CommandName="Johnson" OnCommand="btn1_Command" CommandArgument="Johnson" ForeColor="RoyalBlue"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btn6" runat="server" Text="Chico" CommandName="Chico" OnCommand="btn1_Command" CommandArgument="Chico" ForeColor="RoyalBlue"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="btn7" runat="server" Text="Pampers" CommandName="Pampers" OnCommand="btn1_Command" CommandArgument="Pampers" ForeColor="RoyalBlue"></asp:LinkButton>

                        </li>
                    </ul>

                </div>
            </div>

            <div class="col-lg-10 col-md-9">

                <asp:Repeater runat="server" ID="Productrepeater" OnItemDataBound="Productrepeater_ItemDataBound">

                    <HeaderTemplate>
                        <div class="row">
                    </HeaderTemplate>

                    <ItemTemplate>
                        <div class="col-xl-3 col-lg-4 col-md-6 col-6">

                            <div class="card mt-3">

                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("productimage") %>' Height="150px" Width="200px" CssClass="mx-auto" CommandName="productdetail" CommandArgument='<%# Eval("productid") %>' OnCommand="Image1_Command" />

                                <div class="card-body">
                                    <b>
                                        <asp:LinkButton ID="btnProductName" runat="server" CommandName="productdetail" CommandArgument='<%# Eval("productid") %>' OnCommand="Image1_Command" Text='<%# Eval("Productname") %>' CssClass="card-title" ForeColor="RoyalBlue" Font-Underline="false"></asp:LinkButton>
                                    </b>
                                    <b>
                                        <p class="card-text my-2"><%# DataBinder.Eval(Container.DataItem, "productprice", "{0:C}") %></p>
                                    </b>
                                    <asp:Button ID="btnAddtocart" runat="server" CssClass="btn btn-primary my-2" Text="Add To Cart" OnCommand="btnAddtocart_Command" CommandArgument='<%# Eval("productid") %>' />
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>

            </div>
        </div>
    </div>


</asp:Content>
