using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Master_Soporte : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dt = (Usuario)Session["USUARIO"];
                LblUsuario.Text = dt.NombreUsuario;
            }
        }
    }
}