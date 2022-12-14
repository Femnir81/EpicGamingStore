<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="EpicGamingStore.Admin.AddProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <input id="Nome" type="text" runat="server" />
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ErrorMessage="RequiredFieldValidator" 
            ControlToValidate="Nome" EnableClientScript="false"></asp:RequiredFieldValidator>--%>
        <input id="Descrizione" type="text" runat="server" />
        <asp:CheckBoxList ID="CheckBoxPiattaforma" runat="server">
            <asp:ListItem>Playstation</asp:ListItem>
            <asp:ListItem>XBOX</asp:ListItem>
            <asp:ListItem>PC</asp:ListItem>
            <asp:ListItem>Nintendo</asp:ListItem>
        </asp:CheckBoxList>
        <%--<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
        <input id="PrezzoIntero" type="text" runat="server" />
        <input id="PrezzoSaldo" type="text" runat="server" />
        <asp:CheckBox ID="InPromo" runat="server" Text="Promo" />
        <input id="Sviluppatore" type="text" runat="server" />
        <input id="Publisher" type="text" runat="server" />
        <input id="DataRilascio" type="date" runat="server" />
        <asp:FileUpload ID="FrontUpload" runat="server" AllowMultiple="true" />
        <asp:FileUpload ID="CoverUpload" runat="server" AllowMultiple="true" />
        <asp:FileUpload ID="Gallery1" runat="server" AllowMultiple="true" />
        <asp:FileUpload ID="Gallery2" runat="server" AllowMultiple="true" />
        <asp:FileUpload ID="Gallery3" runat="server" AllowMultiple="true" />
        <asp:FileUpload ID="Gallery4" runat="server" AllowMultiple="true" />
        <input id="VideoUrl" type="text" runat="server" />
        <asp:DropDownList ID="DDLCategory" runat="server"></asp:DropDownList>
        <asp:Button ID="Add" runat="server" Text="Aggiungi" OnClick="Aggiungi_Click" />
    </div>
</asp:Content>
