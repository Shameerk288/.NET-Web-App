<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminSignup.aspx.cs" Inherits="Babyworld.store.AdminSignup" %>

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
                                <h3 class="mb-4">Admin Details</h3>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblname">Your Name</asp:Label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVname" runat="server" ControlToValidate="txtusername" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="Lblemail">Email</asp:Label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVemail" runat="server" ControlToValidate="txtemail" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="txtemail" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Email format is incorrect"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="lblpassword">Password</asp:Label>
                            <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ControlToValidate="txtpassword" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label CssClass="label" runat="server" ID="Lblrepassword">Re-enter password</asp:Label>
                            <asp:TextBox ID="txtrepassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Retype Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVrepassword" runat="server" ControlToValidate="txtrepassword" ForeColor="Red" Text="Field cannot be empty">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CVpasswdcmp" runat="server" ControlToValidate="txtpassword" ControlToCompare="txtrepassword" Text="Password do not match" ForeColor="Red">
                            </asp:CompareValidator>
                        </div>

                        <div class="form-group mb-3">
                            <asp:Button ID="btnSignup" runat="server" CssClass="btn btn-primary" OnClick="btnSignup_Click" Text="Sign up" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>









</asp:Content>
