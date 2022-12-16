<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModProducts.aspx.cs" Inherits="EpicGamingStore.Admin.ModProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="promo">
         <div class="d-flex justify-content-between px-5 me-4 my-5 ">
            <div>
                <a href="/Admin/AddProducts.aspx" class="btn btn-success btn-sm mx-1 px-3 ms-4 py-2 adminBtn" role="button"><i class="fa-solid fa-plus"></i></a>
                <a href="/Admin/Register.aspx" class="btn btn-warning btn-sm mx-1 px-3 py-2 adminBtn" role="button"><i class="fa-solid fa-user-plus"></i></a>
                <a href="/Admin/Inventory.aspx" class="btn btn-primary btn-sm mx-1 px-3 py-2 adminBtn" role="button"><i class="fa-solid fa-cubes-stacked"></i></a>
            </div>
            <div>
                <asp:Label ID="Label1" CssClass="fs-5 fw-bold" runat="server" Text=""></asp:Label>
                <button id="Button1" runat="server" class="btn btn-primary btn-sm px-3 py-2 ms-3" onserverclick="Logout"><i class="fa-solid fa-person-walking-arrow-right"></i></button>
            </div>
        </div>
    <div class="container p-5 d-flex justify-content-center">
    <div class="d-flex flex-wrap addWindow p-5 glass-object">
        <h1 class="w-100 mb-4 fw-bold headings">Modifica prodotto</h1>
        <div class="addForm">
        <h3 class="fw-bold">Nome prodotto</h3>
        <input id="Nome" class="my-2 rounded-2 input" type="text" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Descrizione</h3>
        <input id="Descrizione" class="my-2 rounded-2 input" type="text" runat="server"  />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Piattaforma</h3>
        <asp:CheckBoxList ID="CheckBoxPiattaforma" runat="server" CssClass="d-flex my-2 fs-5 "  >
            <asp:ListItem>Playstation</asp:ListItem>
            <asp:ListItem>XBOX</asp:ListItem>
            <asp:ListItem>PC</asp:ListItem>
            <asp:ListItem>Nintendo</asp:ListItem>
        </asp:CheckBoxList>
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Prezzo intero</h3>
        <input class="my-2 rounded-2 input" id="PrezzoIntero" type="text" runat="server"  />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Prezzo in saldo</h3>
        <input class="my-2 rounded-2 input" id="PrezzoSaldo" type="text" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Promozioni in corso</h3>
        <asp:CheckBox CssClass="my-2 me-2 fs-5 " ID="InSaldo" runat="server" Text="In saldo" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Sviluppatore</h3>
        <input class="my-2 rounded-2 input" id="Sviluppatore" type="text" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Publisher</h3>
        <input class="my-2 rounded-2 input" id="Publisher" type="text" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Data di rilascio</h3>
        <input class="my-2 rounded-2 input" id="DataRilascio" type="date" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Immagine prodotto</h3>
        <asp:FileUpload CssClass="my-2" ID="FrontUpload" runat="server"   />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Copertina prodotto</h3>
        <asp:FileUpload CssClass="my-2" ID="CoverUpload" runat="server"  />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Gallery prodotto</h3>
        <asp:FileUpload CssClass="my-2" ID="Gallery1" runat="server"  />
        <asp:FileUpload CssClass="my-2" ID="Gallery2" runat="server"  />
        <asp:FileUpload CssClass="my-2" ID="Gallery3" runat="server"  />
        <asp:FileUpload CssClass="my-2" ID="Gallery4" runat="server"  />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Video trailer</h3>
        <input class="my-2 rounded-2 input" id="VideoUrl" type="text" runat="server" />
        </div>
        <div class="addForm">
        <h3 class="fw-bold">Categoria</h3>
        <asp:DropDownList CssClass="my-2 rounded-2 input" ID="DDLCategory" runat="server"></asp:DropDownList>
        </div>
        <div class="text-end w-100">
        <asp:Button CssClass="my-2 btn btn-primary btn-lg align-self-end" ID="Add" runat="server" Text="Aggiorna" OnClick="UpdateBtn_Click" />
        </div>
    </div>

    <hr />
    <asp:Label ID="LabelEX" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
