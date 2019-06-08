<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_prioridades.aspx.cs" Inherits="ticket_tracker.Gestionar_prioridades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestionar prioridades</h1>
<p>
    <asp:Label ID="LblMessage" runat="server"></asp:Label>
</p>
<p>
    <asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="Nuevo" />
</p>

<div id="formulario" runat="server">
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
        <td>
            <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Limpiar" OnClick="Button2_Click" />
            <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</div>
<div id="tabla" runat="server">



    <asp:GridView ID="gvPrioridades" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
            <asp:BoundField DataField="Descripcion" HeaderText="DESCRIPCION" />
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
