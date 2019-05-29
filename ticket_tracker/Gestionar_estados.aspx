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
                    <asp:ListItem Value="1">--Selecciona--</asp:ListItem>
                    <asp:ListItem Value="true">Activo</asp:ListItem>
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
                <asp:Button ID="Button2" runat="server" Text="Limpiar" OnClick="Button2_Click" />
                <asp:Button ID="txtCerrar" runat="server" OnClick="txtCerrar_Click" Text="Cerrar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

    <div id="tabla" runat="server">
         <asp:GridView ID="gvEstados" runat="server" AutoGenerateColumns="False" OnRowCommand="gvEstados_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                <asp:BoundField DataField="Descripcion" HeaderText="DESCRIPCIÓN" />
                <asp:TemplateField HeaderText="ESTADO">
                    <ItemTemplate>
                    <asp:Label Text='<%# Eval("Estado1").ToString() == "true" ? "Activo" : "Inactivo" %>'
                    runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="Upd" Text="Editar" />
                <asp:ButtonField CommandName="Del" Text="Eliminar" />
            </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
             <RowStyle BackColor="White" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
</asp:Content>
