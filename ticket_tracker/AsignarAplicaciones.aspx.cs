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
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                cargarUsuarios();
                cargarAplicativos();
                txtId.Text = Convert.ToString(id);
               // consultarAplicativosByUsuario(2);
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
                ddlUsuarios2.DataSource = prioridades;
                ddlUsuarios2.DataBind();
            }
        }

        public void cargarAplicativos()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var aplicativo = entidades.Aplicativos
                                .Where(s => s.Estado.Id == 7)
                                .ToList<Aplicativo>();
                lbAplicativo.DataSource = aplicativo;
                lbAplicativo.DataBind();
            }
        }

        public void InsertWithData(int usuarioID, ListItemCollection aplicativoID)
        {
            try
            {
                using (proyecto_finalEntities conn = new proyecto_finalEntities())
                {
                    Usuario p = new Usuario { Id = usuarioID };
                    // 2
                    conn.Usuarios.Add(p);
                    // 3
                    conn.Usuarios.Attach(p);

                    // 1
                    for (int i = 0; i < lbAplicativo.Items.Count; i++)
                    {
                        Aplicativo s = new Aplicativo { Id = Convert.ToInt32(lbAplicativo.Items[i].Value) };
                        // 2
                        conn.Aplicativos.Add(s);
                        // 3
                        conn.Aplicativos.Attach(s);

                        // like previous method add instance to navigation property
                        p.Aplicativo.Add(s);

                        // call SaveChanges
                        conn.SaveChanges();
                        LblMessage.Text = "Registro guardado exitosamentepara el usuario: " + p.NombreUsuario;
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    
                }
            }catch(Exception e){
                LblMessage.Text = "Ha ocurrido un error al guardar" + e.StackTrace;
            }
        }

        public void consultarAplicativosByUsuario(int idUsuario)
        {
            using (proyecto_finalEntities conn = new proyecto_finalEntities())
            {
                var result = 
                    (
                        // instance from context
                        from a in conn.Usuarios
                        // instance from navigation property
                        from b in a.Aplicativo
                        //join to bring useful data
                        join c in conn.Aplicativos on b.Id equals c.Id
                        where a.Id == idUsuario
                        select new Aplicativo
                        {
                            Id = c.Id,
                            Nombre = c.Nombre
                        }
                    ).ToList();


            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            InsertWithData(Convert.ToInt32(ddlUsuario.SelectedItem.Value), lbAplicativo.Items);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = true;
            this.formulario.Visible = false;
            this.btnNuevo.Visible = true;
        }

       
    }
}