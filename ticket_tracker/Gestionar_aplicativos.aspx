<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_aplicativos.aspx.cs" Inherits="ticket_tracker.Gestionar_aplicativos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Getionar aplicativos</h1>
    <p>&nbsp;</p>
    <table class="nav-justified">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="244px"></asp:TextBox>
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
                <asp:TextBox ID="txtDescripcion" runat="server" Width="246px"></asp:TextBox>
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
                <asp:Label ID="Label5" runat="server" Text="Tipo:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTipo" runat="server" Height="16px" Width="255px">
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
            <td>
                <asp:Label ID="Label6" runat="server" Text="Estado:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEstado" runat="server" Height="16px" Width="254px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">
                <asp:Button ID="Button1" runat="server" Text="Guardar" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" />
            </td>
            <td class="auto-style2"></td>
        </tr>
    </table>
</asp:Content>
