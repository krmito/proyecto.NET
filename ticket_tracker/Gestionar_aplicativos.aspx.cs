using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Gestionar_aplicativos : System.Web.UI.Page
    {
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                id = 0;
                txtId.Text = Convert.ToString(id);
                cargarEstados();
                cargarTipo();
                cargarAplicativos();
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
        }

        private void cargarEstados()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var estados = entidades.Estados
                                .Where(s => s.Tipo == 2)
                                .ToList<Estado>();
                ddlEstado.DataSource = estados;
                ddlEstado.DataBind();
            }
        }

        private void cargarTipo()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var tipo = entidades.Tipo_aplicativo
                                .ToList<Tipo_aplicativo>();
                ddlTipo.DataSource = tipo;
                ddlTipo.DataBind();
            }
        }

        private void cargarAplicativos()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var aplicativos = entidades.Aplicativos 
                                .ToList<Aplicativo>();
                gvAplicativos.DataSource = aplicativos;
                gvAplicativos.DataBind();
            }
        }

        public void limpiar()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtId.Text = Convert.ToString(id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
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
                        entidades.Aplicativos.Add(new Aplicativo
                        {
                            Nombre = txtNombre.Text,
                            Descrpcion = txtDescripcion.Text,
                            Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value),
                            Id_tipo = Convert.ToInt32(ddlTipo.SelectedItem.Value)
                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        cargarAplicativos();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Aplicativo aplicativos = entidades.Aplicativos.SingleOrDefault(c => c.Id == id);


                        aplicativos.Nombre = txtNombre.Text;
                        aplicativos.Descrpcion = txtDescripcion.Text;
                        aplicativos.Id_tipo = Convert.ToInt32(ddlTipo.SelectedItem.Value);
                        aplicativos.Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value);

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        cargarAplicativos();
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
                    int id = Convert.ToInt32(gvAplicativos.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Aplicativo aplicativos = entidades.Aplicativos.SingleOrDefault(c => c.Id == id);
                        entidades.Aplicativos.Remove(aplicativos);
                        entidades.SaveChanges();
                        cargarAplicativos();
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
                    int id = Convert.ToInt32(gvAplicativos.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Aplicativo aplicativos = entidades.Aplicativos.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(aplicativos.Id);
                        txtNombre.Text = aplicativos.Nombre;
                        txtDescripcion.Text = aplicativos.Descrpcion;
                        ddlEstado.SelectedItem.Value = Convert.ToString(aplicativos.Id_estado);
                        ddlTipo.SelectedItem.Value = Convert.ToString(aplicativos.Id_tipo);
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = true;
            this.formulario.Visible = false;
            this.btnNuevo.Visible = true;
            limpiar();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = false;
            this.formulario.Visible = true;
            this.btnNuevo.Visible = false;
            limpiar();
        }
    }
}