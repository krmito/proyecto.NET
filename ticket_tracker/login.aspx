<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ticket_tracker.login" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Tracker Login</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #2c4236;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {}
        .auto-style4 {
            width: 305px;
            text-align: right;
        }
        .auto-style5 {
            height: 142px;
        }
    </style>
</head>
<body  style="background-color: #85bfa1">
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="calibri" ForeColor="White" Text="Login - Acceso de Usuarios"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style5">
                    <table align="center" class="auto-style3">
                        <tr>
                            <td class="auto-style4">
                                <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Principal.aspx" Font-Names="Verdana" OnAuthenticate="Login1_Authenticate" style="width: 284px" Width="282px" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Size="10pt" PasswordLabelText="Contraseña:" RememberMeText="Recordarme" TitleText="Iniciar sesión" UserNameLabelText="Nombre de usuario:">
                                    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                                </asp:Login>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
