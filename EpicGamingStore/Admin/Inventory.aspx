<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"  CodeBehind="Inventory.aspx.cs" Inherits="EpicGamingStore.Admin.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="justify-content-end">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Logout" />
    </div>
    <hr />
    <div class="container">
        <asp:Label ID="DeleteMessage" runat="server" Visible="false" Text=""></asp:Label>
        <asp:GridView ID="GrigliaInventario" runat="server" AutoGenerateColumns="false" ItemType="EpicGamingStore.Prodotto" CssClass="table table-striped">
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
                <asp:TemplateField HeaderText="In Saldo">
                    <ItemTemplate>
                        <asp:CheckBox ID="InSaldo" runat="server" Checked="<%# Item.InSaldo %>" Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Categoria">
                    <ItemTemplate>
                        <asp:Label ID="Categoria" runat="server" Text="<%# Item.NomeCategoria %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <a href="ModProducts.aspx?idprod=<%# Item.IDProdotto %>" class="btn btn-danger" role="button"></a>
                        <asp:Button ID="Elimina" runat="server" Text="Elimina" OnClick="Elimina_Click" CommandArgument="<%# Item.IDProdotto %>"  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
