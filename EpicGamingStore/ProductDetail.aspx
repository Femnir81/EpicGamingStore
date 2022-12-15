<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="EpicGamingStore.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="promo">
        <asp:Image ID="copertina" Style="object-fit: cover" runat="server" />

        <div class="container detailMain">


            <div class="detailCard glass-object d-flex">
                <div class="">
                    <asp:Image ID="front" class="img-fluid rounded-2 h-100" runat="server" />
                </div>

                <div class="card-body d-flex justify-content-around flex-column  ms-5">
                    <asp:Label ID="titolo" CssClass="fs-2 fw-bold" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="dataUscita" CssClass="fs-4" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="prezzo" CssClass="fs-2 fw-bold fst-italic" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="ADD" runat="server" CssClass="btn btn-sm btn-primary p-3" Text="Aggiungi al Carrello" OnClick="AddCarrello" />
                </div>
            </div>

        </div>

        <div class="detailDesc">
            <h1 class=" py-5 fw-bold headings">Scopri di più</h1>

            <asp:Label ID="descrizione" CssClass="" runat="server" Text=""></asp:Label>
            <h1 class=" py-5 fw-bold headings">Sviluppatore</h1>
            <asp:Label ID="sviluppatore" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="publisher" runat="server" Text=""></asp:Label>
            <h1 class=" py-5 fw-bold headings">Disponibile su</h1>
            <asp:Label ID="piattaforme" runat="server" Text=""></asp:Label>
            <h1 class=" py-5  m-0 fw-bold headings">Gallery</h1>
        </div>
        <div class="gallery pb-5">
            <div class="d-flex flex-wrap">

                <asp:Image ID="gallery1" CssClass="w-25" runat="server" />

                <asp:Image ID="gallery2" CssClass="w-25" runat="server" />

                <asp:Image ID="gallery3" CssClass="w-25" runat="server" />

                <asp:Image ID="gallery4" CssClass="w-25" runat="server" />


            </div>
            <h1 class=" py-5 fw-bold headings">Trailer</h1>
            <iframe width="853" height="483" id="iframe" runat="server" title="YouTube video player"
                frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen="true"></iframe>



        </div>

    </div>



</asp:Content>
