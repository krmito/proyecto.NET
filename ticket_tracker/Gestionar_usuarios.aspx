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
    <p>&nbsp;</p>
    <table class="nav-justified">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nombre completo:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="257px"></asp:TextBox>
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
                <asp:TextBox ID="TextBox2" runat="server" Width="256px"></asp:TextBox>
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
                <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTime" Width="258px"></asp:TextBox>
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
                <asp:DropDownList ID="DropDownList1" runat="server" Width="265px">
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
                <asp:DropDownList ID="DropDownList2" runat="server" Height="26px" Width="268px">
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
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Width="260px"></asp:TextBox>
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
                <asp:Button ID="Button1" runat="server" Text="Guardar" />
                <asp:Button ID="Button2" runat="server" Text="Limpiar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
