<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EpicGamingStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Username" runat="server">Username:</asp:Label> 
        <input id="Username1" type="text" /> <br />
        <asp:Label ID="Password" runat="server">Password:</asp:Label> 
        <input id="Password1"  type="password"/>
    </div>
    <div class="">
        <asp:Button ID="Invio" runat="server" Text="Login" OnClick="Invio_Click" />
    </div>
</asp:Content>

