using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Gestionar_tipo_aplicativo : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                CargarTipoAplicatvos();
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
        }

        private void CargarTipoAplicatvos()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var ta = entidades.Tipo_aplicativo.ToList<Tipo_aplicativo>();
                gvTipoAplicativo.DataSource = ta;
                gvTipoAplicativo.DataBind();
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

                    if (id == 0)
                    {
                        entidades.Tipo_aplicativo.Add(new Tipo_aplicativo
                        {
                            Nombre = txtNombre.Text,
                            Descripcion = txtDescripcion.Text,
                            Estado = Convert.ToBoolean(ddlEstado.SelectedItem.Value)
                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        CargarTipoAplicatvos();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Tipo_aplicativo estado = entidades.Tipo_aplicativo.SingleOrDefault(c => c.Id == id);


                        estado.Nombre = txtNombre.Text;
                        estado.Descripcion = txtDescripcion.Text;
                        estado.Estado = Convert.ToBoolean(ddlEstado.SelectedItem.Value);

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        CargarTipoAplicatvos();
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

        public void limpiar()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtId.Text = "0";
            ddlEstado.SelectedValue = "1";
        }

        protected void gvTipoAplicativo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(gvTipoAplicativo.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Tipo_aplicativo ta = entidades.Tipo_aplicativo.SingleOrDefault(c => c.Id == id);
                        entidades.Tipo_aplicativo.Remove(ta);
                        entidades.SaveChanges();
                        CargarTipoAplicatvos();
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
                    int id = Convert.ToInt32(gvTipoAplicativo.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Tipo_aplicativo estado = entidades.Tipo_aplicativo.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(estado.Id);
                        txtNombre.Text = estado.Nombre;
                        txtDescripcion.Text = estado.Descripcion;
                        ddlEstado.SelectedValue = Convert.ToString(estado.Estado).ToLower();
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

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}