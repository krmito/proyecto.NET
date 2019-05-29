using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Gestionar_roles : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                txtId.Text = Convert.ToString(id);
                cargarEstados();
                CargarRoles();
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
        }

        public void limpiar()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtId.Text = "0"; 
        }

        private void cargarEstados()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var estados = entidades.Estados
                                .Where(s => s.Estado1 == true)
                                .ToList<Estado>();
                ddlEstado.DataSource = estados;
                ddlEstado.DataBind();
            }
        }

        public void CargarRoles()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var roles = entidades.Roles.ToList<Role>();
                gvRoles.DataSource = roles;
                gvRoles.DataBind();
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
                        entidades.Roles.Add(new Role
                        {
                            Nombre = txtNombre.Text,
                            Descripcion = txtDescripcion.Text,
                            Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value)
                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        CargarRoles();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Role estado = entidades.Roles.SingleOrDefault(c => c.Id == id);


                        estado.Nombre = txtNombre.Text;
                        estado.Descripcion = txtDescripcion.Text;
                        estado.Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value);

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        CargarRoles();
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
                    int id = Convert.ToInt32(gvRoles.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Role roles = entidades.Roles.SingleOrDefault(c => c.Id == id);
                        entidades.Roles.Remove(roles);
                        entidades.SaveChanges();
                        CargarRoles();
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
                    int id = Convert.ToInt32(gvRoles.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Role roles = entidades.Roles.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(roles.Id);
                        txtNombre.Text = roles.Nombre;
                        txtDescripcion.Text = roles.Descripcion;
                        ddlEstado.SelectedValue = Convert.ToString(roles.Id_estado);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = true;
            this.formulario.Visible = false;
            this.btnNuevo.Visible = true;
            limpiar();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
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