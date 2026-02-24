using negocio;
using System;
using dominio;

namespace ProductsCatalog
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["mensajeBienvenida"] != null)
            {
                // Ponemos el texto dentro del div del toast
                toastMensaje.InnerHtml = Session["mensajeBienvenida"].ToString();

                // Borramos la Session para que no aparezca de nuevo
                Session.Remove("mensajeBienvenida");

                // Llamamos al toast con JS para que se muestre
                string script = @"
            var toastEl = document.getElementById('toastBienvenida');
            var toast = new bootstrap.Toast(toastEl, {delay: 3000});
            toast.show();
        ";
                ClientScript.RegisterStartupScript(this.GetType(), "mostrarToast", script, true);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio traineeNegocio = new TraineeNegocio();
                EmailService emailService = new EmailService();

                user.Email = txtEmail.Text;
                user.pass = txtPassword.Text;
                user.Id = traineeNegocio.insertarNuevo(user);

                emailService.ArmarCorreo(user.Email, "¡Bienvenido!", "🎉\nGracias por registrarte en ProductsCatalog.\nNos alegra tenerte acá y que formes parte de la comunidad.");
                emailService.EnviarEmail();

                Session.Add("trainee", user);

                // Mensaje genérico de bienvenida
                toastMensaje.InnerHtml = "¡Muchas gracias por registrarte en ProductsCatalog! Ahora podés completar tu perfil.";

                // Mostrar toast y luego redirigir a Default.aspx
                string script = @"
            var toastEl = document.getElementById('toastBienvenida');
            var toast = new bootstrap.Toast(toastEl, {delay: 5000});
            toast.show();
            // Redirigir después de 5 segundos
            setTimeout(function(){ window.location='Default.aspx'; }, 5000);
        ";
                ClientScript.RegisterStartupScript(this.GetType(), "mostrarToast", script, true);
            }
            catch (Exception ex)
            {
                lblError.Text = "Ocurrió un error: " + ex.Message;
            }
        }
    }
}