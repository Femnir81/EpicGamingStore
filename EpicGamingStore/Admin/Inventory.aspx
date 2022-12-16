<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="EpicGamingStore.Admin.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="promo">
        <div class="text-end me-4 my-5 ">
            <asp:Label ID="Label1" CssClass="fs-5 fw-bold" runat="server" Text=""></asp:Label>
            <button id="Button1" runat="server" class="btn btn-primary btn-sm px-3 py-2 ms-3" onserverclick="Logout"><i class="fa-solid fa-person-walking-arrow-right"></i></button>
        </div>

        <div class="container glass-object p-5 mb-5 mt-3">
            <h1 class="mb-5">Inventario prodotti</h1>
            <asp:Label ID="DeleteMessage" runat="server" Visible="false" Text=""></asp:Label>
            <asp:GridView ID="GrigliaInventario" runat="server" AutoGenerateColumns="false" ItemType="EpicGamingStore.Prodotto" CssClass="table table-borderless">
                <Columns>
                    <asp:TemplateField HeaderText="Nome Articolo">
                        <ItemTemplate>
                            <asp:Label ID="NomeArticolo" runat="server" ControlStyle-CssClass="fs-5 fw-bold" Text="<%# Item.NomeProdotto %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prezzo" ControlStyle-CssClass="fs-5 fw-bold">
                        <ItemTemplate>
                            <asp:Label ID="PrezzoArticolo" runat="server" Text=""><%# Item.PrezzoIntero.ToString("c2") %></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="In Saldo" ControlStyle-CssClass="fs-5 fw-bold ms-4">
                        <ItemTemplate>
                            <asp:CheckBox ID="InSaldo" runat="server" Checked="<%# Item.InSaldo %>" Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" ControlStyle-CssClass="fs-5 fw-bold">
                        <ItemTemplate>
                            <asp:Label ID="Categoria" runat="server" Text="<%# Item.NomeCategoria %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="/Admin/ModProducts.aspx?idprod=<%# Item.IDProdotto %>" class="btn btn-primary btn-sm mx-1 px-3 py-2" role="button">Modifica</a>
                            <asp:Button ID="Elimina" runat="server" Text="Elimina" CssClass="btn btn-danger btn-sm mx-1 px-3 py-2" OnClick="Elimina_Click" CommandArgument="<%# Item.IDProdotto %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
