<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EpicGamingStore.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./assets/img/copertina/spMoralesCover.jpg" alt="Alternate Text" />

                <div class="container">
                    <div class="carousel-caption glass-object">
                        <h1>Offerte Natalizie</h1>
                        <div class="iconFather">
                        <img class="carouselIcon" src="./Assets/Img/Utility/santa.png" alt="Santa" />
                        </div>
                        <p>Risparmia oltre il 60% sulla nostra speciale selezione di giochi.</p>
                        
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./assets/img/copertina/fmCover.jpg" alt="Alternate Text" />

                <div class="container">
                    <div class="carousel-caption glass-object">
                        <h1>Football Manager 2023</h1>
                        <p>Ora disponibile su pc</p>
                        
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./assets/img/copertina/mhCover.jpg" alt="Alternate Text" />

                <div class="container">
                    <div class="carousel-caption glass-object ">
                        <h1>Monster Hunter</h1>
                        <p>Tuffati insieme ai tuoi amici nella caccia più sfrenata di sempre! Ora in offerta speciale!</p>
                        
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="promo py-5">
        <h1 class="ps-5 pb-2 fw-bold">Best Seller</h1>
    <div class="d-flex flex-wrap container-fluid justify-content-center py-2">
        <div class="productCard glass-object m-2">
            <img src="./Assets/Img/Utility/hot-sale.png" class="onSale" alt="Sale" />
            <div class="productImg1"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Horizon Zero Dawn Complete Edition</p>
                <p class="PrezzoInt glass-object p-2">14,99 €</p>
                <a role="button" href="ProductDetail.aspx?idprodotto=3" class="btn btn-primary btn-sm px-3 py-2">Scopri</a>
            </div>
        </div>
        <div class="productCard glass-object  m-2">
            <img src="./Assets/Img/Utility/hot-sale.png" class="onSale" alt="Sale" />
            <div class="productImg2"></div>
            <div class="productDesc p-2">

                <p class="mb-1">Crisis Core – Final Fantasy VII - Reunion</p>
                <p class="PrezzoInt glass-object p-2">36,99 €</p>
                <a role="button" href="ProductDetail.aspx?idprodotto=7" class="btn btn-primary btn-sm px-3 py-2">Scopri</a>
            </div>
        </div>
        <div class="productCard glass-object  m-2">
            <img src="./Assets/Img/Utility/hot-sale.png" class="onSale" alt="Sale" />
            <div class="productImg3"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Call of Duty: Modern Warfare II</p>
                <p class="PrezzoInt text-black glass-object p-2">62,29 €</p>
                <a role="button" href="ProductDetail.aspx?idprodotto=5" class="btn btn-primary btn-sm px-3 py-2">Scopri</a>
            </div>
        </div>
        <div class="productCard glass-object m-2">
            <div class="productImg4"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Xbox Game Pass Ultimate 12 Months</p>
                <p class="PrezzoInt glass-object p-2">130,00 €</p>
                <a  role="button" href="ProductDetail.aspx?idprodotto=9" class="btn btn-primary btn-sm px-3 py-2">Scopri</a>
            </div>
        </div>
        
    </div>
    </div>
    <div class="px-4 py-5 text-center" id="sort">
        
        <h1 class="display-5 fw-bold mb-5 headings">Filtra per categoria</h1>
        <div class="col-lg-6 mx-auto">
            
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <asp:Repeater ID="RepeaterCat" runat="server" ItemType="EpicGamingStore.Categoria">
                    <ItemTemplate>
                        <a href="ProductByCategory.aspx?idcat=<%# Item.IDCategoria %>" class="btn btn-primary btn-sm px-4 gap-3 mx-2 fs-4" role="button">

                            <%# Item.NomeCategoria  %>
                        </a>
                        
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="d-flex promo justify-content-center py-5 flex-wrap catalog">
        <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
            <ItemTemplate>
                <div class="productCard glass-object m-2">
                    <img runat="server" visible="<%# Item.InSaldo %>" src="./Assets/Img/Utility/hot-sale.png" class="onSale" alt="Sale" />    
                    <div class="productImg" style="background-image: url('./assets/img/front/<%# Item.URLImg  %>')"></div>
                    <div class="productDesc p-2">

                        <asp:Label ID="Label2" CssClass="mb-2" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label> <br />
                        
                        <p ID="Label3" class="PrezzoInt glass-object p-2" runat="server"><%# Item.GetPrice().ToString("c2") %></p>
                        <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn btn-primary btn-sm px-3 py-2 mt-2 ms-3" role="button">scopri</a>
                    </div>
                </div>
              



            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
