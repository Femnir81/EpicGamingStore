<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EpicGamingStore.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Repeater ID="RepeaterCat" runat="server" ItemType="EpicGamingStore.Categoria">
        <ItemTemplate>

             <a href="ProductByCategory.aspx?idcat=<%# Item.IDCategoria %>" class="btn btn-primary" role="button"><%# Item.NomeCategoria %></a> <br />
            
        </ItemTemplate>
    </asp:Repeater>

    <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
        <ItemTemplate>

            <asp:Label ID="NomeProdotto" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label>
            <br />
            <asp:Label ID="CategoriaProdotto" runat="server" Text="<%# Item.NomeCategoria %>"></asp:Label>
            <br />
            <asp:Label ID="Data" runat="server" Text="<%# Item.DataRilascio %>"></asp:Label>
            <br />
            <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn btn-primary" role="button">Dettagli</a>
            <br />

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
