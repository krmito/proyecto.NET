<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_estados.aspx.cs" Inherits="ticket_tracker.Gestionar_estados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestión de estados</h1>
<p>&nbsp;</p>
    <table class="nav-justified">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="282px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label4" runat="server" Text="Descripción:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="103px" TextMode="MultiLine" Width="286px"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Guardar" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
