using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace ProductsCatalog
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //si no tengo una sesion activa, dejame ver estas paginas es la condicion
            if (!(Page is Login || Page is Registro || Page is Default || Page is Error || Page is DetalleArticulo))             
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                Response.Redirect("Login.aspx", false);
            }


            string avatarDefault = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";

            imgAvatar.ImageUrl = avatarDefault;

            if (Seguridad.sesionActiva(Session["trainee"]))
            {
                Trainee user = (Trainee)Session["trainee"];

                if (!string.IsNullOrEmpty(user.ImagenPerfil))
                {
                    string ruta = "~/Images/" + user.ImagenPerfil;

                    if (System.IO.File.Exists(Server.MapPath(ruta)))
                        imgAvatar.ImageUrl = ruta + "?v=" + DateTime.Now.Ticks;
                }
                lblUser.Text = user.Email;
            }


            if (!Page.AppRelativeVirtualPath.Equals("~/Default.aspx", StringComparison.OrdinalIgnoreCase)) //esto es para que el footer solo aparezca en default
            {
                footerDefault.Visible = false;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();                                 
            Response.Redirect("Login.aspx", false);
        }
    }
}