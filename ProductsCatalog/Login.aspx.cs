using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductsCatalog
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    Usuario usuario = new Usuario(
        //        txtUsuario.Text.Trim(),
        //        txtPassword.Text.Trim(),
        //        false // esto se va a recalcular cuando loguea
        //    );

        //    UsuarioNegocio negocio = new UsuarioNegocio();

        //    if (negocio.Loguear(usuario))
        //    {
        //        Session.Add("usuario", usuario);
        //        Response.Redirect("ListaArticulos.aspx", false);
        //    }
        //    else
        //    {
        //        lblError.Text = "Usuario o contraseña incorrectos";
        //    }
        //}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Trainee trainee = new Trainee();
            TraineeNegocio negocio = new TraineeNegocio();
            try
            {
                if (Validaciones.CamposVacios(txtEmail.Text, txtPassword.Text))
                {
                    lblError.Text = "Debe completar el email y la contraseña.";
                    lblError.Visible = true;
                    return;
                }

                trainee.Email = txtEmail.Text;
                trainee.pass = txtPassword.Text;
                if (negocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("MiPerfil.aspx", false);

                }
                else
                {
                    lblError.Text = "Usuario o contraseña incorrectos.";
                    lblError.Visible = true;
                }

            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
                Context.ApplicationInstance.CompleteRequest();

            }
        }
    }
}

