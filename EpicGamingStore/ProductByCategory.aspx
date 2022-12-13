<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductByCategory.aspx.cs" Inherits="EpicGamingStore.ProductByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
        <ItemTemplate>
            <asp:Label ID="ProductNameLbl" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label>

        </ItemTemplate>
    </asp:Repeater>
    
    
</asp:Content>
