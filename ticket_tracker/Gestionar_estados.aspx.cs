using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    

    public partial class Gestionar_estados : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstados();
                txtId.Text = Convert.ToString(id);
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
        }

        private void CargarEstados()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var roles = entidades.Estados.ToList<Estado>();
                gvEstados.DataSource = roles;
                gvEstados.DataBind();
            }
        }

        public void limpiar()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtId.Text = "0";
            ddlActivo.SelectedValue = "1";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                LblMessage.Text = "";
                using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                {
                    var id = Convert.ToInt32(txtId.Text);

                    if (id == 0)
                    {
                        entidades.Estados.Add(new Estado
                        { 
                            Nombre = txtNombre.Text,
                            Descripcion = txtDescripcion.Text,
                            Estado1 = Convert.ToBoolean(ddlActivo.SelectedItem.Value)
                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        CargarEstados();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Estado estado = entidades.Estados.SingleOrDefault(c => c.Id == id);

                       
                        estado.Nombre = txtNombre.Text;
                        estado.Descripcion = txtDescripcion.Text;
                        estado.Estado1 = Convert.ToBoolean(ddlActivo.SelectedItem.Value);

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        CargarEstados();
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = false;
            this.formulario.Visible = true;
            this.btnNuevo.Visible = false;
            limpiar();
        }

        protected void txtCerrar_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = true;
            this.formulario.Visible = false;
            this.btnNuevo.Visible = true;
            limpiar();
        }

        protected void gvEstados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(gvEstados.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Estado estado = entidades.Estados.SingleOrDefault(c => c.Id == id);
                        entidades.Estados.Remove(estado);
                        entidades.SaveChanges();
                        CargarEstados();
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
                    int id = Convert.ToInt32(gvEstados.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Estado estado = entidades.Estados.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(estado.Id);
                        txtNombre.Text = estado.Nombre;
                        txtDescripcion.Text = estado.Descripcion;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}