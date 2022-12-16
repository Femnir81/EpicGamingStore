<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EpicGamingStore.Admin.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between px-5 me-4 my-5 ">
        <div>
            <a href="/Admin/AddProducts.aspx" class="btn btn-success btn-sm mx-1 px-3 ms-4 py-2 adminBtn" role="button"><i class="fa-solid fa-plus"></i></a>
            <a href="/Admin/Register.aspx" class="btn btn-warning btn-sm mx-1 px-3 py-2 adminBtn" role="button"><i class="fa-solid fa-user-plus"></i></a>
            <a href="/Admin/Inventory.aspx" class="btn btn-primary btn-sm mx-1 px-3 py-2 adminBtn" role="button"><i class="fa-solid fa-cubes-stacked"></i></a>
        </div>
        <div>
            <asp:Label ID="Label1" CssClass="fs-5 fw-bold" runat="server" Text=""></asp:Label>
            <button id="Button1" runat="server" class="btn btn-primary adminBtn btn-sm px-3 py-2 ms-3" onserverclick="Logout"><i class="fa-solid fa-person-walking-arrow-right"></i></button>
        </div>
    </div>

    <div class="promo accessMain d-flex justify-content-center align-content-center">
        <div class="container my-5 d-flex justify-content-center align-content-center ">
            <div class="w-50 my-5  d-flex flex-column align-items-center justify-content-center glass-object">
                <h1 class="icon"><i class="fa-solid fa-user-tie"></i></h1>
                <asp:Label ID="Username" CssClass="fw-bold fs-4 mb-2 mt-3" runat="server">Username:</asp:Label>
                <input id="Username1" class="w-50 rounded-2 input" type="text" runat="server" />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Username1"></asp:RequiredFieldValidator>--%>
                <br />
                <asp:Label ID="Password" CssClass="fw-bold fs-4 mb-2 " runat="server">Password:</asp:Label>
                <input id="Password1" class="w-50 rounded-2 input" type="password" runat="server" /><br />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Password1" runat="server"></asp:RequiredFieldValidator>--%>
                <asp:Label ID="RipetiPassword" CssClass="fw-bold fs-4 mb-2 " runat="server">Conferma Password:</asp:Label>
                <input id="Password2" class="w-50 rounded-2 input" type="password" runat="server" /><br />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Password2" runat="server"></asp:RequiredFieldValidator>--%>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Password1" ControlToCompare="Password2" Type="String" EnableClientScript="false"></asp:CompareValidator>
                <div class="d-flex flex-column align-content-center ">
                    <asp:Button ID="Invio" runat="server" CssClass="btn btn-primary btn-sm mx-1 fs-5 px-3 py-2" Text="Register" OnClick="RegisterAdmin" />
                    <asp:Label ID="Error" runat="server" CssClass="my-3" Visible="false" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
