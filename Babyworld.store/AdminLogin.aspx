<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Babyworld.store.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>

<body>
    <form id="form1" runat="server">

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-2">
                        <asp:ImageButton ID="imgbtn" runat="server" ImageUrl="~/assets/images/logo2.PNG" />
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Welcome to Login</h2>
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <div class="alert alert-danger" role="alert" id="dvfailure" runat="server" visible="false"></div>
                                        <h3 class="mb-4">Admin log In</h3>
                                    </div>

                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="lblemail">Email</asp:Label>
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVemail" runat="server" ControlToValidate="txtemail" ForeColor="Red" Text="Email is required">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="txtemail" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Email format is incorrect"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group mb-3">
                                    <asp:Label CssClass="label" runat="server" ID="Lblpassword">Password</asp:Label>
                                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ControlToValidate="txtpassword" ForeColor="Red" Text="Password is required">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="Btn_login" runat="server" CssClass="form-control btn btn-primary submit px-3" OnClick="Btn_login_Click" Text="Login" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </form>
</body>
</html>
