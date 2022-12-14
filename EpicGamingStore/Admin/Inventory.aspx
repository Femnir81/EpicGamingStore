<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="EpicGamingStore.Admin.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="justify-content-end">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Logout"/>
    </div>
    <hr />
</asp:Content>
