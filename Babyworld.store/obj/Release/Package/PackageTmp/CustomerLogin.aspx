<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Babyworld.store.CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="py-3">
        <div class="signin-form">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-2">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Welcome to Login</h2>
                                    <p>Don't have an account?</p>
                                    <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-white btn-outline-white" Text="Sign Up Here" OnClick="btnSignUp_Click" />
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <div class="alert alert-danger" role="alert" id="dvfailure" runat="server" visible="false"></div>
                                        <h3 class="mb-4">Welcome! Please Login</h3>
                                    </div>

                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="lblemail">Email</asp:Label>
                                    <asp:TextBox ID="txtcustomeremail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVemail" runat="server" ControlToValidate="txtcustomeremail" ForeColor="Red" Text="Email is required" ValidationGroup="signin">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="txtcustomeremail" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Email format is incorrect"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="Lblpassword">Password</asp:Label>
                                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ControlToValidate="txtpassword" ForeColor="Red" Text="Password is required" ValidationGroup="signin">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Btn_login" runat="server" CssClass="form-control btn btn-primary submit px-3" OnClick="Btn_login_Click" Text="Login" ValidationGroup="signin" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
