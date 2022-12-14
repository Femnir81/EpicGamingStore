<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EpicGamingStore.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:Label ID="itemCarrello" runat="server" Text=""></asp:Label><br />
    <asp:Button ID="Button1" runat="server" Text="Svuota Carrello" OnClick="Button1_Click" />--%>
    <div class="container my-5" id="ContenitoreGriglia" runat="server" visible="false">
        <asp:GridView ID="GrigliaCarrello" runat="server" AutoGenerateColumns="false" ItemType="EpicGamingStore.Prodotto" CssClass="table table-striped">
            <Columns>
                <asp:TemplateField HeaderText="Nome Articolo">
                    <ItemTemplate>
                        <asp:Label ID="NomeArticolo" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prezzo">
                    <ItemTemplate>
                        <asp:Label ID="PrezzoArticolo" runat="server" Text=""><%# Item.PrezzoIntero.ToString("c2") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Elimina" CssClass="btn" CommandArgument="<%# Item.IDProdotto %>" OnClick="EliminaArticolo"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="d-flex justify-content-between align-items-center my-5">
            <asp:Label ID="SommaArticoli" runat="server" Text="" CssClass="" Font-Bold="true"></asp:Label>
            <asp:Button ID="BottoneCancella" runat="server" Text="CancellaAcquisti" CssClass="btn btn-danger ms-5 me-1 " OnClick="SvuotaCarrello" />
        </div>
    </div>
    <div class="my-5 d-flex justify-content-center">
        <asp:Label ID="MessaggioCarrelloVuoto" runat="server" Text="" Visible="true" CssClass="my-5 mx-5" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
    </div>
</asp:Content>
