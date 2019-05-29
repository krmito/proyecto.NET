using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class AsignarAplicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                cargarUsuarios();
                cargarAplicativos();
            }
        }

        public void cargarUsuarios()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var prioridades = entidades.Usuarios
                                .Where(s => s.Estado.Id == 2)
                                .ToList<Usuario>();
                ddlUsuario.DataSource = prioridades;
                ddlUsuario.DataBind();
            }
        }

        public void cargarAplicativos()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var aplicativo = entidades.Aplicativos
                                .Where(s => s.Estado.Id == 2)
                                .ToList<Aplicativo>();
                lbAplicativo.DataSource = aplicativo;
                lbAplicativo.DataBind();
            }
        }
    }
}