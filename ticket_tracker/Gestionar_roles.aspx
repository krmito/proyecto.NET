<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_roles.aspx.cs" Inherits="ticket_tracker.Gestionar_roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <style type="text/css">
    .auto-style2 {
        height: 22px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestionar roles</h1>
<p>&nbsp;</p>
<table class="nav-justified">
    <tr>
        <td class="auto-style2">
            <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
        </td>
        <td class="auto-style2">
            <asp:TextBox ID="txtNombre" runat="server" Width="232px"></asp:TextBox>
        </td>
        <td class="auto-style2"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Descripción:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescripcion" runat="server" Width="232px"></asp:TextBox>
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
            <asp:Label ID="Label5" runat="server" Text="Estado:"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlEstado" runat="server" Height="16px" Width="238px">
            </asp:DropDownList>
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
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
