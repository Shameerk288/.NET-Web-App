<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Babyworld.store.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <asp:LinkButton ID="btnhome" runat="server" Text="Home" OnClick="btnhome_Click" Font-Underline="false"></asp:LinkButton>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->



    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">


                        <asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="false" OnRowDeleting="CartGrid_RowDeleting" OnRowEditing="CartGrid_RowEditing" OnRowCommand="CartGrid_RowCommand" CssClass="table" BackColor="#f3f2ee" BorderColor="Transparent" OnRowDataBound="CartGrid_RowDataBound">

                            <Columns>
                                <asp:TemplateField HeaderText="Product Image">
                                    <ItemTemplate>
                                        <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("productimage") %>' Height="80px" Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="Product Name" DataField="productname" />
                                <asp:BoundField HeaderText="Product Price" DataField="productprice" DataFormatString="{0:C}" />

                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger" CommandName="remove" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('Are you sure you want remove');" />
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div>
                                <asp:Button ID="btnAddnewProduct" runat="server" Text="Continue Shopping" OnClick="btnAddnewProduct_Click" CssClass="continue__btn mb-3" />
                            </div>
                            
                        </div>
                    </div>

                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span runat="server" id="subtotal"></span></li>
                            <li>Total <span runat="server" id="total"></span></li>
                        </ul>
                        <asp:Button ID="btnCheckOut" runat="server" Text="Proceed To Checkout" OnClick="btnCheckOut_Click" CssClass="primary-btn" />

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

</asp:Content>
