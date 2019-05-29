using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Gestionar_prioridades : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                txtId.Text = Convert.ToString(id);
                cargarPrioridades();
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
        }

        public void cargarPrioridades()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var prioridades = entidades.Prioridads
                                .ToList<Prioridad>();
                gvPrioridades.DataSource = prioridades;
                gvPrioridades.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                LblMessage.Text = "";
                using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                {
                    id = Convert.ToInt32(txtId.Text);

                    if (id == 0)
                    {
                        entidades.Prioridads.Add(new Prioridad
                        {
                            Nombre = txtNombre.Text,
                            Descripcion = txtDescripcion.Text
                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        cargarPrioridades();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Prioridad prioridades = entidades.Prioridads.SingleOrDefault(c => c.Id == id);


                        prioridades.Nombre = txtNombre.Text;
                        prioridades.Descripcion = txtDescripcion.Text;

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        cargarPrioridades();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }

                }
            }
            catch (Exception sqlEx)
            {
                LblMessage.Text = "Error insertando datos." + sqlEx.Message;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(gvPrioridades.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Prioridad prioridades = entidades.Prioridads.SingleOrDefault(c => c.Id == id);
                        entidades.Prioridads.Remove(prioridades);
                        entidades.SaveChanges();
                        cargarPrioridades();
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
                    int id = Convert.ToInt32(gvPrioridades.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Prioridad prioridades = entidades.Prioridads.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(prioridades.Id);
                        txtNombre.Text = prioridades.Nombre;
                        txtDescripcion.Text = prioridades.Descripcion;
                        this.tabla.Visible = false;
                        this.formulario.Visible = true;
                        this.btnNuevo.Visible = false;
                        entidades.SaveChanges();
                    }
                }
                catch (Exception sqlEx)
                {
                    LblMessage.Text = "Error al eliminar datos." + sqlEx.Message;
                }
            }
        }

        public void limpiar()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtId.Text = Convert.ToString(0);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = false;
            this.formulario.Visible = true;
            this.btnNuevo.Visible = false;
            limpiar();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            this.tabla.Visible = true;
            this.formulario.Visible = false;
            this.btnNuevo.Visible = true;
            limpiar();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}