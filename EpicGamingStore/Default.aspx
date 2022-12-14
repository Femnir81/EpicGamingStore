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
                        <h1>Example headline.</h1>
                        <p>Some representative placeholder content for the first slide of the carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./assets/img/copertina/fmCover.jpg" alt="Alternate Text" />

                <div class="container">
                    <div class="carousel-caption glass-object">
                        <h1>Another example headline.</h1>
                        <p>Some representative placeholder content for the second slide of the carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./assets/img/copertina/mhCover.jpg" alt="Alternate Text" />

                <div class="container">
                    <div class="carousel-caption glass-object ">
                        <h1>One more for good measure.</h1>
                        <p>Some representative placeholder content for the third slide of this carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
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
    <div class="d-flex container-fluid justify-content-around promo py-5">
        <div class="productCard glass-object">
            <div class="productImg1"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Horizon Zero Dawn Complete Edition</p>
                <p class="PrezzoInt glass-object p-2">50,00 €</p>
                <button type="button" class="btn btn-primary btn-sm px-3 py-2">Scopri</button>
            </div>
        </div>
        <div class="productCard glass-object">
            <div class="productImg2"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Crisis Core – Final Fantasy VII - Reunion</p>
                <p class="PrezzoInt glass-object p-2">50,00 €</p>
                <button type="button" class="btn btn-primary btn-sm px-3 py-2">Scopri</button>
            </div>
        </div>
        <div class="productCard glass-object">
            <div class="productImg3"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Call of Duty: Modern Warfare II</p>
                <p class="PrezzoInt glass-object p-2">80,00 €</p>
                <button type="button" class="btn btn-primary btn-sm px-3 py-2">Scopri</button>
            </div>
        </div>
        <div class="productCard glass-object">
            <div class="productImg4"></div>
            <div class="productDesc p-2">
                <p class="mb-1">Xbox Game Pass Ultimate 12 Months</p>
                <p class="PrezzoInt glass-object p-2">130,00 €</p>
                <button type="button" class="btn btn-primary btn-sm px-3 py-2">Scopri</button>
            </div>
        </div>
        
    </div>
    <div class="px-4 py-5 text-center" id="sort">
        
        <h1 class="display-5 fw-bold mb-5 headings">Filtra per categoria</h1>
        <div class="col-lg-6 mx-auto">
            
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
               <%-- <button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary button</button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
                <button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary button</button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
                <button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary button</button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
                <button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary button</button>--%>
                <asp:Repeater ID="RepeaterCat" runat="server" ItemType="EpicGamingStore.Categoria">
                    <ItemTemplate>
                        <a href="ProductByCategory?idcat=<%# Item.IDCategoria %>" class="btn btn-primary btn-sm px-4 gap-3" role="button">

                            <%# Item.NomeCategoria  %>
                        </a>
                        
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="d-flex promo justify-content-start py-5 flex-wrap catalog">
        <asp:Repeater ID="Repeater1" runat="server" ItemType="EpicGamingStore.Prodotto">
            <ItemTemplate>
                <div class="productCard glass-object repCard">
                    <div class="productImg" style="background-image: url('./assets/img/front/<%# Item.URLImg  %>')"></div>
                    <div class="productDesc p-2">

                        <asp:Label ID="Label2" CssClass="mb-2" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label> <br />
                        
                        <p ID="Label3" class="PrezzoInt glass-object p-2" runat="server"><%# Item.PrezzoIntero.ToString("c2") %></p>
                        <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn btn-primary btn-sm px-3 py-2 mt-2 ms-3" role="button">scopri</a>
                    </div>
                </div>
                <%--<div class="productCard glass-object m-2 ">
                    <div class="productImg rounded-2" style="background-image: url('./assets/img/front/<%# Item.URLImg  %>')">
                        <div class="glass-object productDesc p-2">
                            <div>
                                <asp:Label ID="Label1" CssClass="mb-1" runat="server" Text="<%# Item.NomeProdotto %>"></asp:Label>
                            </div>
                            <div class="d-flex justify-content-end">
                                <asp:Label ID="Label3" CssClass="PezzoInt" runat="server" Text="<%# Item.PrezzoIntero %>"></asp:Label>

                                <a href="ProductDetail.aspx?idprodotto=<%# Item.IDProdotto %>" class="btn btn-primary btn-sm ms-3" role="button">scopri</a>
                            </div>
                        </div>
                    </div>
                </div>--%>



            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
