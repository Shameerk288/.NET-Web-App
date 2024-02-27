<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Addproduct.aspx.cs" Inherits="Babyworld.store.Addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-11">
                    <div class="login-wrap p-4 p-lg-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <div class="alert alert-success" role="alert" id="dvsuccess" runat="server" visible="false"></div>
                                <h3 class="mb-4">Product Details</h3>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblname">Product Name</asp:Label>
                            <asp:TextBox ID="txtproductname" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVname" runat="server" ControlToValidate="txtproductname" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="Lbldesc">Product Description</asp:Label>
                            <asp:TextBox ID="txtproductdesc" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Product Description"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblprice">Product Price</asp:Label>
                            <asp:TextBox ID="txtproductprice" runat="server" CssClass="form-control" placeholder="Product Price"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVprice" runat="server" ControlToValidate="txtproductprice" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>                          
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblqty">Product Quantity</asp:Label>
                            <asp:TextBox ID="txtproductqty" runat="server" CssClass="form-control" placeholder="Product Quantity"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVqty" runat="server" ControlToValidate="txtproductqty" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblimg" Visible="false">Product Image : </asp:Label>
                            <asp:Image ID="displayimg" runat="server" Height="100px" Width="100px" Visible="false" />                          
                        </div>
                        <div class="form-group mb-3">
                            <asp:FileUpload ID="productimage" runat="server" />
                            
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblbrand">Product Brand : </asp:Label>
                            <asp:DropDownList ID="brandlist" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVbrand" runat="server" ControlToValidate="brandlist" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" Text="Add Product" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
