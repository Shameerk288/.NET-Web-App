<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Babyworld.store.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Contact</h4>
                        <div class="breadcrumb__links">
                            <asp:LinkButton ID="btnhome" runat="server" Text="Home" OnClick="btnhome_Click" Font-Underline="false"></asp:LinkButton>
                            <span>Contact</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Information</span>
                            <h2>Contact Us</h2>
                            <p>
                                As you might expect of a company that began as a high-end interiors contractor, we pay
                                strict attention.
                            </p>
                        </div>
                        <ul>
                            <li>
                                <h4>Pakistan</h4>
                                <p>
                                    195 E Parker Square Dr, Parker, CO 801
                                    <br />
                                    +43 982-314-0958
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                     
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtname" runat="server" placeholder="Name"></asp:TextBox>
                                  
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtemail" runat="server" placeholder="Email"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <asp:TextBox ID="txtmessage" runat="server" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                                    <asp:Button ID="btnsend" runat="server" CssClass="site-btn" Text="Send Message" ForeColor="White" />
                                </div>
                            </div>
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->



</asp:Content>
