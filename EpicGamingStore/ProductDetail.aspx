<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="EpicGamingStore.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Image ID="copertina" Style="object-fit: cover" runat="server" />

    <div class="container">
        <div class="row">
            <div class="col-12 form-control">
                <div class="row g-0">
                    <div class="col-md-4">
                        <asp:Image ID="front" class="img-fluid rounded-start" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <div class="card-body ms-5 d-flex flex-column justify-content-center">
                            <asp:Label ID="titolo" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="sviluppatore" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="publisher" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="dataUscita" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="prezzo" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Button ID="ADD" runat="server" Text="Aggiungi al Carello" OnClick="AddCarrello" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="col-8">
                <asp:Label ID="descrizione" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <div class="col-12">
                    <div>
                        <asp:Image ID="gallery1" CssClass="d-block w-50" runat="server" />
                    </div>
                    <div>
                        <asp:Image ID="gallery2" CssClass="d-block w-50" runat="server" />
                    </div>
                    <div>
                        <iframe width="560" height="315" id="iframe" runat="server"  title="YouTube video player" 
                            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                            allowfullscreen="true"></iframe>
                    </div>
                    <div>
                        <asp:Image ID="gallery4" CssClass="d-block w-50" runat="server" />
                    </div>
                </div>
            </div>
                    <div>
                        <iframe width="560" height="315" id="iframe" runat="server"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>

        </div>
    
</asp:Content>
