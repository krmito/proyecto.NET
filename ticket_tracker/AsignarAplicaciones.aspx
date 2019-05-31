<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="AsignarAplicaciones.aspx.cs" Inherits="ticket_tracker.AsignarAplicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="formulario" runat="server">

        <asp:Label ID="LblMessage" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" />
        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Usuario:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlUsuario" runat="server" Height="25px" Width="197px" DataTextField="Nombre" DataValueField="Id">
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
                    <asp:Label ID="Aplicación" runat="server" Text="Aplicativos:"></asp:Label>
                </td>
                <td>
                    <asp:ListBox ID="lbAplicativo" runat="server"
                         Height="76px" Width="196px"
                         DataTextField="Nombre" DataValueField="Id"
                         SelectionMode="Multiple" Rows="5"
                         ToolTip="Listado de aplicativos"></asp:ListBox>
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
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>

    <div id="tabla" runat="server">

        <asp:DropDownList ID="ddlUsuarios2" runat="server" DataTextField="Nombre" DataValueField="Id" Height="16px" Width="228px">
        </asp:DropDownList>
        <br />
        <br />

    </div>
</asp:Content>
