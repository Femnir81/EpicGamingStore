<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="EpicGamingStore.Admin.AddProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-column">

        <input id="Nome" type="text" runat="server" placeholder="nome"/>
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ErrorMessage="RequiredFieldValidator" 
            ControlToValidate="Nome" EnableClientScript="false"></asp:RequiredFieldValidator>--%>
        <input id="Descrizione" type="text" runat="server" placeholder="Descrizione" />
        <asp:CheckBoxList ID="CheckBoxPiattaforma" runat="server">
            <asp:ListItem>Playstation</asp:ListItem>
            <asp:ListItem>XBOX</asp:ListItem>
            <asp:ListItem>PC</asp:ListItem>
            <asp:ListItem>Nintendo</asp:ListItem>
        </asp:CheckBoxList>
        <%--<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
        <input id="PrezzoIntero" type="text" runat="server" placeholder="p int" />
        <input id="PrezzoSaldo" type="text" runat="server" placeholder="p saldo"/>
        <asp:CheckBox ID="InPromo" runat="server" Text="Promo" />
        <input id="Sviluppatore" type="text" runat="server" placeholder="Sviluppatore"/>
        <input id="Publisher" type="text" runat="server" placeholder="Publish"/>
        <input id="DataRilascio" type="date" runat="server" />
        <asp:FileUpload ID="FrontUpload" runat="server"  placeholder="Front" />
        <asp:FileUpload ID="CoverUpload" runat="server"  placeholder="Cover"/>
        <asp:FileUpload ID="Gallery1" runat="server"  placeholder="G1"/>
        <asp:FileUpload ID="Gallery2" runat="server"  placeholder="G2"/>
        <asp:FileUpload ID="Gallery3" runat="server"  placeholder="G3"/>
        <asp:FileUpload ID="Gallery4" runat="server"  placeholder="G4"/>
        <input id="VideoUrl" type="text" runat="server" placeholder="VideoURL"/>
        <asp:DropDownList ID="DDLCategory" runat="server"></asp:DropDownList>
        <asp:Button ID="Add" runat="server" Text="Aggiungi" OnClick="Aggiungi_Click" />
    </div>

    <hr />
    <asp:Label ID="LabelEX" runat="server" Text=""></asp:Label>
</asp:Content>
