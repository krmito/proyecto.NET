using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ticket_tracker.Modelos;

namespace ticket_tracker
{
    public partial class Gestionar_usuarios : System.Web.UI.Page
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                txtId.Text = Convert.ToString(id);
                cargarEstados();
                CargarRoles();
                CargarUsuarios();
                this.tabla.Visible = true;
                this.formulario.Visible = false;
            }
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
                var roles = entidades.Roles
                    .ToList<Role>();
                ddlRol.DataSource = roles;
                ddlRol.DataBind();
            }
        }

        public void CargarUsuarios()
        {
            using (proyecto_finalEntities entidades = new proyecto_finalEntities())
            {
                var usuarios = entidades.Usuarios.ToList<Usuario>();
                gvUsuario.DataSource = usuarios;
                gvUsuario.DataBind();
            }
        }

        public void limpiar()
        {
            txtNombre.Text = "";
            txtUsename.Text = "";
            txtFecha.Text = "";
            txtPass.Text = "";
            txtId.Text = "0";
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

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.tabla.Visible = false;
            this.formulario.Visible = true;
            this.btnNuevo.Visible = false;
            limpiar();
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
                        entidades.Usuarios.Add(new Usuario
                        {
                            Nombre = txtNombre.Text,
                            NombreUsuario = txtUsename.Text,
                            Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value),
                            Id_rol = Convert.ToInt32(ddlRol.SelectedItem.Value),
                            Fecha_nacimiento = Convert.ToDateTime(txtFecha.Text),
                            Contrasena = txtPass.Text,

                        });
                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Insertado Satisfactoriamente.";
                        CargarUsuarios();
                        this.tabla.Visible = true;
                        this.formulario.Visible = false;
                        this.btnNuevo.Visible = true;
                    }
                    else
                    {
                        Usuario usuario = entidades.Usuarios.SingleOrDefault(c => c.Id == id);


                        usuario.Nombre = txtNombre.Text;
                        usuario.NombreUsuario = txtUsename.Text;
                        usuario.Id_estado = Convert.ToInt32(ddlEstado.SelectedItem.Value);
                        usuario.Id_rol = Convert.ToInt32(ddlRol.SelectedItem.Value);
                        usuario.Fecha_nacimiento = Convert.ToDateTime(txtFecha.Text);
                        usuario.Contrasena = txtPass.Text;

                        entidades.SaveChanges();
                        LblMessage.Text = "Registro Actualizado Satisfactoriamente.";
                        CargarUsuarios();
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
                    int id = Convert.ToInt32(gvUsuario.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Usuario usuarios = entidades.Usuarios.SingleOrDefault(c => c.Id == id);
                        entidades.Usuarios.Remove(usuarios);
                        entidades.SaveChanges();
                        CargarUsuarios();
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
                    int id = Convert.ToInt32(gvUsuario.Rows[rowIndex].Cells[0].Text);

                    using (proyecto_finalEntities entidades = new proyecto_finalEntities())
                    {
                        Usuario usuario = entidades.Usuarios.SingleOrDefault(c => c.Id == id);

                        txtId.Text = Convert.ToString(usuario.Id);
                        txtNombre.Text = usuario.Nombre;
                        txtUsename.Text = usuario.NombreUsuario;
                        ddlEstado.SelectedItem.Value = Convert.ToString(usuario.Id_estado);
                        ddlRol.SelectedItem.Value = Convert.ToString(usuario.Id_rol);
                        txtFecha.Text = Convert.ToString(usuario.Fecha_nacimiento);
                        txtPass.Text = usuario.Contrasena;
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
    }
}