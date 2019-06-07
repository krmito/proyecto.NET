using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Incidencias : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtId.Text = Convert.ToString(id);
                this.tabla.Visible = true;
                this.formulario.Visible = false;
                CargarIncidencias();
                CargarUsuarios();
                CargarAplicativos();
                CargarPrioridades();
                CargarEstados();
            }
        }

        private void CargarIncidencias()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var dt = (Usuario)Session["USUARIO"];
                var incidencias = entidades.Incidencias
                    .Where(s => s.Id_usuario == dt.Id)
                    .ToList<Incidencia>();
                gvIncidencias.DataSource = incidencias;
                gvIncidencias.DataBind();
            }
        }

        private void CargarAplicativos()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var aplicativo = entidades.Aplicativos.ToList<Aplicativo>();
                ddlAplicativo.DataSource = aplicativo;
                ddlAplicativo.DataBind();
            }
        }


        private void CargarEstados()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var estados = entidades.Estados
                    .Where(s => s.Tipo == 1)
                    .ToList<Estado>();
                ddlEstados.DataSource = estados;
                ddlEstados.DataBind();
            }
        }

        private void CargarUsuarios()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var usuarios = entidades.Usuarios.ToList<Usuario>();
                ddlAsignadoA.DataSource = usuarios;
                ddlAsignadoA.DataBind();
            }
        }

        private void CargarPrioridades()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var prioridades = entidades.Prioridads.ToList<Prioridad>();
                ddlPrioridad.DataSource = prioridades;
                ddlPrioridad.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                LblMessage.Text = "";
                using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                {
                    var id = Convert.ToInt32(txtId.Text);
                    var ent = entidades.Incidencias.ToList();

                    entidades.Incidencias.Add(new Incidencia
                    {
                        Id_aplicativo = Convert.ToInt32(ddlAplicativo.SelectedItem.Value),
                        Id_usuario = Convert.ToInt32(ddlAsignadoA.SelectedItem.Value),
                        Descripcion = txtDescripcion.Text.Trim(),
                        Fecha_estimada = Convert.ToDateTime(txtFecha.Text),
                        Id_prioridad = Convert.ToInt32(ddlPrioridad.SelectedItem.Value),
                        Id_incidencia_papa = txtPapa.Text == "" ? Convert.ToInt32(txtId.Text) : Convert.ToInt32(txtPapa.Text),
                        Id_estado = Convert.ToInt32(ddlEstados.SelectedItem.Value)
                    });
                    entidades.SaveChanges();
                    LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                    CargarIncidencias();
                    this.tabla.Visible = true;
                    this.formulario.Visible = false; 
                }
            }
            catch (Exception sqlEx)
            {
                LblMessage.Text = "Error insertando datos." + sqlEx.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = true;
            this.formulario.Visible = false; 
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = false;
            this.formulario.Visible = true;
        }

        protected void gvIncidencias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(gvIncidencias.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Incidencia incidencias = entidades.Incidencias.SingleOrDefault(c => c.Id == id);
                        entidades.Incidencias.Remove(incidencias);
                        entidades.SaveChanges();
                        CargarIncidencias();
                    }
                }
                catch (Exception sqlEx)
                {
                    LblMessage.Text = "Error al eliminar datos." + sqlEx.Message;
                }
            }

            if (e.CommandName == "Upd")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(gvIncidencias.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Incidencia incidencias = entidades.Incidencias.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(incidencias.Id);
                        ddlAplicativo.SelectedItem.Value = Convert.ToString(incidencias.Id_aplicativo);
                        ddlAsignadoA.SelectedItem.Value = Convert.ToString(incidencias.Id_usuario);
                        ddlPrioridad.SelectedItem.Value = Convert.ToString(incidencias.Id_prioridad);
                        txtDescripcion.Text = Convert.ToString(incidencias.Descripcion);
                        txtFecha.Text = incidencias.Fecha_estimada.ToShortDateString();
                        txtPapa.Text = Convert.ToString(incidencias.Id_incidencia_papa);
                        this.tabla.Visible = false;
                        this.formulario.Visible = true;
                    }
                }
                catch (Exception sqlEx)
                {
                    LblMessage.Text = "Error al eliminar datos." + sqlEx.Message;
                }
            }
        }
    }
}