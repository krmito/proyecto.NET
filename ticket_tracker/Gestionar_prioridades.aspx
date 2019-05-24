<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_prioridades.aspx.cs" Inherits="ticket_tracker.Gestionar_prioridades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestionar prioridades</h1>
<p>&nbsp;</p>
<table class="nav-justified">
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" Width="260px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Descripción:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Width="264px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Guardar" />
            <asp:Button ID="Button2" runat="server" Text="Limpiar" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
