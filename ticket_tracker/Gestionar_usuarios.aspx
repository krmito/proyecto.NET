<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="Gestionar_usuarios.aspx.cs" Inherits="ticket_tracker.Gestionar_usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestionar usuarios</h1>
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
                <asp:Label ID="Label3" runat="server" Text="Nombre completo:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="257px"></asp:TextBox>
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
                <asp:Label ID="Label4" runat="server" Text="Username:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUsename" runat="server" Width="256px"></asp:TextBox>
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
                <asp:Label ID="Label5" runat="server" Text="Fecha de nacimiento:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" Width="258px"></asp:TextBox>
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
                <asp:DropDownList ID="ddlEstado" runat="server" Width="265px" DataTextField="Nombre" DataValueField="Id">
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
                <asp:Label ID="Label7" runat="server" Text="Rol"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRol" runat="server" Height="26px" Width="268px" DataTextField="Nombre" DataValueField="Id">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Contraseña:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="260px"></asp:TextBox>
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
                <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" OnClick="Button2_Click" />
                <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

    <div id="tabla" runat="server">



        <asp:GridView ID="gvUsuario" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField ConvertEmptyStringToNull="False" DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="NOMBRE DE USUARIO" />
                <asp:BoundField DataField="Id_rol" HeaderText="ROL" />
                <asp:BoundField DataField="Id_estado" HeaderText="ESTADO" />
                <asp:BoundField DataField="Fecha_nacimiento" HeaderText="FECHA DE NACIMIENTO" />
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
