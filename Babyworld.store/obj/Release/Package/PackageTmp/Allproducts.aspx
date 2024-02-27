<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Allproducts.aspx.cs" Inherits="Babyworld.store.Allproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .table th, .table td {
            border-color: #d5d5d5!important;
            border: 1px solid black;
        }
    </style>


    <script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />

    <script>
        $(function () {
            $("table[id$='products_detail_GV']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                ordering: false,
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="">
        <div class="container">

            <asp:Button ID="btnAddProduct" runat="server" Text="Add New Product" OnClick="btnAddProduct_Click" CssClass="btn btn-success my-3" />

            <asp:GridView ID="products_detail_GV" runat="server" AutoGenerateColumns="false" OnRowDeleting="products_detail_GV_RowDeleting" OnRowEditing="products_detail_GV_RowEditing" OnRowCommand="products_detail_GV_RowCommand" CssClass="table" HeaderStyle-BackColor="#000F50" HeaderStyle-ForeColor="White">

                <Columns>

                    <asp:BoundField HeaderText="Product Name" DataField="productname" />
                    <asp:BoundField HeaderText="Product Price" DataField="productprice" DataFormatString="{0:C}" />
                    <%--<asp:BoundField HeaderText="Product Quantity" DataField="productqty" />--%>
                    <asp:BoundField HeaderText="Product Brand" DataField="brandname" />

                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="productimg" runat="server" ImageUrl='<%# Eval("productimage") %>' Height="50px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary mr-2" CommandName="edit" CommandArgument='<%# Eval("productid") %>' />
                            <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%# Eval("productid") %>' OnClientClick="return confirm('Are you sure you want delete');" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </div>

</asp:Content>
