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
<p>
    <asp:Label ID="LblMessage" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnNuevo" runat="server" OnClick="Button3_Click" Text="Nuevo" />
    </p>
  <div id="formulario" runat="server">
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
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="Activo"></asp:Label>
                :</td>
            <td class="auto-style2">
                <asp:DropDownList ID="ddlActivo" runat="server" Height="16px" Width="289px">
                    <asp:ListItem Value="True">Activo</asp:ListItem>
                    <asp:ListItem Value="false">Inactivo</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" />
                <asp:Button ID="txtCerrar" runat="server" OnClick="txtCerrar_Click" Text="Cerrar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

    <div id="tabla" runat="server">
         <asp:GridView ID="gvEstados" runat="server" AutoGenerateColumns="False" OnRowCommand="gvEstados_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                <asp:BoundField DataField="Descripcion" HeaderText="DESCRIPCIÓN" />
                <asp:ButtonField CommandName="Upd" Text="Editar" />
                <asp:ButtonField CommandName="Del" Text="Eliminar" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
