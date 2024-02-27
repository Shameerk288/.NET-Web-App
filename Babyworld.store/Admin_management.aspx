<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_management.aspx.cs" Inherits="Babyworld.store.Admin_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .table {
            margin-bottom: 0;
            margin-top: 15px;
        }

            .table th, .table td {
                border-color: #d5d5d5!important;
                border: 1px solid black;
            }
    </style>

    <script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />



    <script>
        $(function () {
            $("table[id$='user_detail_GV']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                ordering: false,
            });
        });
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:Button ID="btnAddnew" runat="server" Text="Add New Admin" OnClick="btnAddnew_Click" CssClass="btn btn-success my-3" />

    <asp:GridView ID="user_detail_GV" runat="server" AutoGenerateColumns="false" OnRowDeleting="user_detail_GV_RowDeleting" OnRowEditing="user_detail_GV_RowEditing" OnRowCommand="user_detail_GV_RowCommand" CssClass="table" HeaderStyle-BackColor="#000F50" HeaderStyle-ForeColor="White">

        <Columns>

            <asp:BoundField HeaderText="Admin Name" DataField="username" />
            <asp:BoundField HeaderText="Admin Email" DataField="useremail" />

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" CommandName="edit" CommandArgument='<%# Eval("userid") %>' />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%# Eval("userid") %>' OnClientClick="return confirm('Are you sure you want delete');" />
                </ItemTemplate>

            </asp:TemplateField>


        </Columns>

    </asp:GridView>



</asp:Content>
