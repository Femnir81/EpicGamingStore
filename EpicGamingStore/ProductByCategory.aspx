<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductByCategory.aspx.cs" Inherits="EpicGamingStore.ProductByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="px-4 py-5 text-center" id="sort">
        
        <h1 class="display-5 fw-bold mb-5 headings">Filtra per categoria</h1>
        <div class="col-lg-6 mx-auto">
            
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <asp:Repeater ID="RepeaterCat" runat="server" ItemType="EpicGamingStore.Categoria">
                    <ItemTemplate>
                        <a href="ProductByCategory.aspx?idcat=<%# Item.IDCategoria %>" class="btn btn-primary btn-sm mx-2 px-4 gap-3 fs-4" role="button">

                            <%# Item.NomeCategoria  %>
                        </a>
                        
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="d-flex promo justify-content-start py-5 sortByCat  flex-wrap catalog byCat">
        <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
            <ItemTemplate>
                <div class="productCard glass-object m-2">
                    <div class="productImg" style="background-image: url('./assets/img/front/<%# Item.URLImg  %>')"></div>
                    <div class="productDesc p-2">

                        <asp:Label ID="Label2" CssClass="mb-2" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label> <br />
                        
                        <p ID="Label3" class="PrezzoInt glass-object p-2" runat="server"><%# Item.PrezzoIntero.ToString("c2") %></p>
                        <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn btn-primary btn-sm px-3 py-2 mt-2 ms-3" role="button">scopri</a>
                    </div>
                </div>
              



            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    
</asp:Content>
