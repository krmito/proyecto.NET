<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Soporte.Master" AutoEventWireup="true" CodeBehind="Incidencias.aspx.cs" Inherits="ticket_tracker.Incidencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <style type="text/css">
    .auto-style2 {
        height: 20px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
        <asp:Label ID="LblMessage" runat="server"></asp:Label>
        <br />
     <div id="formulario" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Aplicativo:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAplicativo" runat="server" Height="16px" Width="219px" DataTextField="Nombre" DataValueField="Id" Enabled="False">
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
                    <asp:Label ID="Label4" runat="server" Text="Asignado a:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAsignadoA" runat="server" Height="16px" Width="218px" DataTextField="Nombre" DataValueField="Id" Enabled="False">
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
                    <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Width="209px"></asp:TextBox>
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
                    <asp:Label ID="Label7" runat="server" Text="Fecha de asignación:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFecha" runat="server" Height="16px" TextMode="Date" Width="209px" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Prioridad</td>
                <td>
                    <asp:DropDownList ID="ddlPrioridad" runat="server" Height="18px" Width="217px" DataTextField="Nombre" DataValueField="Id" Enabled="False">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Estados"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlEstados" runat="server" Height="16px" Width="217px" DataTextField="Nombre" DataValueField="Id">
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
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

    <div id="tabla" runat="server">
        <asp:GridView ID="gvIncidencias" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="gvIncidencias_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Aplicativo.Nombre" HeaderText="APLICATIVO" />
                <asp:BoundField DataField="Usuario.Nombre" HeaderText="USUARIO" />
                <asp:BoundField DataField="Descripcion" HeaderText="DESCRIPCION" />
                <asp:BoundField DataField="Fecha_estimada" HeaderText="FECHA ESTIMADA" />
                <asp:BoundField DataField="Prioridad.Nombre" HeaderText="PRIORIDAD" />
                <asp:BoundField DataField="Id_incidencia_papa" HeaderText="ID INCIDENCIA PAPÁ" />
                <asp:ButtonField CommandName="Upd" Text="Gestionar" />
                <asp:ButtonField CommandName="Del" Text="Elimimar" />
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
