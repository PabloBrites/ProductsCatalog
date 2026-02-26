using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace ProductsCatalog
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (negocio.Seguridad.sesionActiva(Session["trainee"]))
                {
                    Trainee user = (Trainee)Session["trainee"];

                    txtEmail.Text = user.Email;
                    txtEmail.ReadOnly = true;

                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;

                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgPerfil.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    else
                        imgPerfil.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["trainee"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("~/Images/");
                    string nombreArchivo = "perfil-" + user.Id + ".jpg";

                    txtImagen.PostedFile.SaveAs(ruta + nombreArchivo);
                    user.ImagenPerfil = nombreArchivo;
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.actualizar(user);
                Session["trainee"] = user;

                string rutaConVersion = "~/Images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks;

                // Imagen grande
                imgPerfil.ImageUrl = rutaConVersion;

                // Imagen avatar en Master
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = rutaConVersion;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }      
    }
}