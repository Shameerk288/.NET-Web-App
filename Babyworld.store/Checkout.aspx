<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Babyworld.store.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <asp:LinkButton ID="btnhome" runat="server" Text="Home" OnClick="btnhome_Click" Font-Underline="false"></asp:LinkButton>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">

            <div class="alert alert-success" role="alert" id="dvsuccess" runat="server" visible="false">
            </div>
            <div class="alert alert-danger" role="alert" id="dvfailure" runat="server" visible="false">
            </div>

            <div class="checkout__form">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <h6 class="checkout__title">Billing Details</h6>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>Full Name<span>*</span></p>
                                    <asp:TextBox ID="txtname" runat="server" placeholder="Name" ForeColor="Black"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Address<span>*</span></p>
                            <asp:TextBox ID="txtaddress" runat="server" CssClass="checkout__input__add" placeholder="Street Address" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="checkout__input">
                            <p>Country<span>*</span></p>
                            <asp:TextBox ID="txtcountry" runat="server" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="checkout__input">
                            <p>Town/City<span>*</span></p>
                            <asp:TextBox ID="txtcity" runat="server" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phone<span>*</span></p>
                                    <asp:TextBox ID="txtphone" runat="server" ForeColor="Black"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <asp:TextBox ID="txtemail" runat="server" ForeColor="Black"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV1" runat="server" ControlToValidate="txtemail" Text="Required" ValidationGroup="checkout" ForeColor="red"></asp:RequiredFieldValidator>
                                    <asp:Label ID="status" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Order notes</p>
                            <asp:TextBox ID="txtnotes" runat="server" placeholder="Notes about your order, e.g. special notes for delivery." ForeColor="Black"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="checkout__order">
                            <h4 class="order__title">Your order</h4>
                            <div class="checkout__order__products">Product <span>Total</span></div>

                            <asp:GridView ID="checkoutgrid" runat="server" AutoGenerateColumns="false" CssClass="checkout__total__products" BorderColor="Transparent"
                                OnRowDataBound="checkoutgrid_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="productname" ItemStyle-Width="100%" />
                                    <asp:BoundField DataField="productprice" DataFormatString="{0:C}" ItemStyle-CssClass="float-end" />
                                </Columns>
                            </asp:GridView>

                            <ul class="checkout__total__all">
                                <li>Subtotal <span runat="server" id="subtotal"></span></li>
                                <li>Total <span runat="server" id="total"></span></li>
                            </ul>
                            <div>
                                <asp:RadioButton ID="CashOndelivery" runat="server" Text="Cash On Delivery" GroupName="paymentmethod" Checked="true" />                                                        
                            </div>
                            <div>
                                <asp:RadioButton ID="chkboxstripe" runat="server" Text="Stripe" GroupName="paymentmethod" />                               
                            </div>
                            <asp:Button ID="btnorder" runat="server" CssClass="site-btn" Text="PLACE ORDER" OnClick="btnorder_Click" ValidationGroup="checkout" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- Checkout Section End -->












</asp:Content>
