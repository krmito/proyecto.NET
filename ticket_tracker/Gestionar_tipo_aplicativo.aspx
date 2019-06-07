<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_tipo_aplicativo.aspx.cs" Inherits="ticket_tracker.Gestionar_tipo_aplicativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>

    <br />
    <asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="Nuevo" />
    <br />

<div id="formulario" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="308px"></asp:TextBox>
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
                <asp:TextBox ID="txtDescripcion" runat="server" Height="49px" TextMode="MultiLine" Width="309px"></asp:TextBox>
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
                <asp:DropDownList ID="ddlEstado" runat="server" Height="16px" Width="313px">
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
                <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

    <div id="tabla" runat="server">



        <asp:GridView ID="gvTipoAplicativo" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="gvTipoAplicativo_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                <asp:BoundField HeaderText="DESCRIPCION" DataField="Descripcion" />
                <asp:TemplateField HeaderText="ESTADO">
                     <ItemTemplate>
                    <asp:Label Text='<%# Eval("Estado").ToString() == "True" ? "Activo" : "Inactivo" %>'
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
