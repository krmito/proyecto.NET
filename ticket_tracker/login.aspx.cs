using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool autenticado = false;
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var usuario = entidades.Usuarios
                                .Where(s => s.NombreUsuario == Login1.UserName
                                    && s.Contrasena == Login1.Password && s.Id_estado == 1)
                                .FirstOrDefault<Usuario>();
                if (usuario != null)
                {
                    autenticado = true;
                    Session.Add("USUARIO", usuario);
                    e.Authenticated = autenticado;
                }

            }
        }
    }
}