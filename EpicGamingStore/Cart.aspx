<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EpicGamingStore.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:Label ID="itemCarrello" runat="server" Text=""></asp:Label><br />
    <asp:Button ID="Button1" runat="server" Text="Svuota Carrello" OnClick="Button1_Click" />--%>
    <div class="d-flex flex-column justify-content-between CartContainer promo">
    <div class="container my-5 glass-object p-5  " id="ContenitoreGriglia" runat="server" visible="false">
        <asp:GridView ID="GrigliaCarrello" runat="server" AutoGenerateColumns="false" ItemType="EpicGamingStore.Prodotto" CssClass="table  table-borderless">
            <Columns>
                <asp:TemplateField HeaderText="Nome Articolo" ControlStyle-CssClass="fs-3 fw-bold">
                    <ItemTemplate>
                        <asp:Label ID="NomeArticolo" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prezzo" ControlStyle-CssClass="fs-4 fw-bold">
                    <ItemTemplate>
                        <asp:Label ID="PrezzoArticolo" CssClass="end" runat="server" Text=""><%# Item.PrezzoIntero.ToString("c2") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Elimina" CssClass="btn btn-sm px-3 py-2 btn-danger float-end" CommandArgument="<%# Item.IDProdotto %>" OnClick="EliminaArticolo"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="d-flex flex-column CartDetail justify-content-end align-items-end ">
            <asp:Label ID="SommaArticoli" runat="server" Text="" CssClass="mb-3 fs-3" Font-Bold="true"></asp:Label>
            <div class="">
            <asp:Button ID="Button2" runat="server" Text="Checkout" CssClass="btn btn-primary me-1 "  />
            <asp:Button ID="BottoneCancella" runat="server" Text="Svuota il carrello" CssClass="btn btn-danger me-1 " OnClick="SvuotaCarrello" />
            </div>
        </div>
    </div>
    <div id="ExMessage" runat="server" class="container  d-flex EmptyCard justify-content-center glass-object">
        <asp:Label ID="MessaggioCarrelloVuoto" runat="server" Text="" Visible="true" CssClass="my-5 mx-5" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
    </div>
    </div>
</asp:Content>
