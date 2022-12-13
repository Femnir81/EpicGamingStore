<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EpicGamingStore.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="itemCarrello" runat="server" Text=""></asp:Label><br />
    <asp:Button ID="Button1" runat="server" Text="Svuota Carrello" OnClick="Button1_Click" />
   
</asp:Content>
