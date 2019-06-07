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
    <p>
        <asp:Label ID="LblMessage" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
    </p>

<div id="formulario" runat="server">
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
                <asp:TextBox ID="txtDescripcion" runat="server" Width="250px" Height="54px" TextMode="MultiLine"></asp:TextBox>
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
                <asp:DropDownList ID="ddlTipo" runat="server" Height="16px" Width="255px" DataTextField="Nombre" DataValueField="Id" AutoPostBack="True">
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
                <asp:DropDownList ID="ddlEstado" runat="server" Height="16px" Width="254px" DataTextField="Nombre" DataValueField="Id">
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
            <td class="auto-style2">
                <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" OnClick="Button2_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            </td>
            <td class="auto-style2"></td>
        </tr>
    </table>
</div>

     <div id="tabla" runat="server">




         <asp:GridView ID="gvAplicativos" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
             <Columns>
                 <asp:BoundField HeaderText="ID" DataField="Id" />
                 <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                 <asp:BoundField HeaderText="DESCRIPCION" DataField="Descrpcion" />
                 <asp:BoundField DataField="Estado.Nombre" HeaderText="ESTADO" />
                 <asp:BoundField HeaderText="TIPO" DataField="Tipo_aplicativo.Nombre" />
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
