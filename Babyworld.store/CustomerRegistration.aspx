<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="Babyworld.store.CustomerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signin-form">
        <section class="py-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Welcome to Sign Up</h2>
                                    <p>Already have an account?</p>
                                    <asp:Button ID="Btnlogin" runat="server" CssClass="btn btn-white btn-outline-white" Text="Log In Here" OnClick="Btnlogin_Click" />
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <div class="alert alert-success" role="alert" id="dvsuccess" runat="server" visible="false"></div>
                                        <h3 class="mb-4">Create Your Account</h3>
                                    </div>

                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="lblname">Your Name</asp:Label>
                                    <asp:TextBox ID="txtcustomername" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVname" runat="server" ControlToValidate="txtcustomername" ForeColor="Red" Text="Field cannot be empty" ValidationGroup="signup">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="Lblemail">Email</asp:Label>
                                    <asp:TextBox ID="txtcustomeremail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVemail" runat="server" ControlToValidate="txtcustomeremail" ForeColor="Red" Text="Field cannot be empty" ValidationGroup="signup">

                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="txtcustomeremail" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Email format is incorrect"></asp:RegularExpressionValidator>
                                    <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="lblpassword">Password</asp:Label>
                                    <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ControlToValidate="txtpassword" ForeColor="Red" Text="Field cannot be empty" ValidationGroup="signup">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="Lblrepassword">Re-enter password</asp:Label>
                                    <asp:TextBox ID="txtrepassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Retype Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVrepassword" runat="server" ControlToValidate="txtrepassword" ForeColor="Red" Text="Field cannot be empty" ValidationGroup="signup">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CVpasswdcmp" runat="server" ControlToValidate="txtpassword" ControlToCompare="txtrepassword" Text="Password do not match" ForeColor="Red" ValidationGroup="signup">
                                    </asp:CompareValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnSignup" runat="server" CssClass="form-control btn btn-primary submit px-3" OnClick="btnSignup_Click" Text="SignUp" ValidationGroup="signup" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


</asp:Content>
