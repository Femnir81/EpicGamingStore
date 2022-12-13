<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EpicGamingStore.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
        <ItemTemplate>
            <asp:Label ID="NomeProdotto" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label> <br />
            <asp:Label ID="CategoriaProdotto" runat="server" Text="<%# Item.NomeCategoria %>"></asp:Label> <br />
            <asp:Label ID="Data" runat="server" Text="<%# Item.DataRilascio %>"></asp:Label> <br />
            <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn bottoneDettagli" role="button">Dettagli</a> <br />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
