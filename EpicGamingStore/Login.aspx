<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EpicGamingStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="promo accessMain d-flex justify-content-center align-content-center">
    <div class="container my-5 d-flex justify-content-center align-content-center promo">
    <div class="w-50 my-5  d-flex flex-column align-items-center justify-content-center glass-object">
        <h1 class="icon"><i class="fa-solid fa-user-tie"></i></h1>
        <asp:Label ID="Username" CssClass="fw-bold fs-4 mb-2 mt-3" runat="server">Username:</asp:Label> 
        <input id="Username1" class="w-50 rounded-2" type="text" runat="server"  /> <br />
        <asp:Label ID="Password" CssClass="fw-bold fs-4 mb-2 " runat="server">Password:</asp:Label> 
        <input id="Password1" class="w-50 rounded-2"  type="password" runat="server"/><br />
        <asp:Label ID="Error" runat="server" Visible="false" Text=""></asp:Label>
    <div class="">
        <asp:Button ID="Invio" runat="server" CssClass="btn btn-primary btn-sm mx-1 fs-5 px-3 py-2" Text="Login" OnClick="Logins" />
    </div>
    </div>
    </div>
    </div>
</asp:Content>

