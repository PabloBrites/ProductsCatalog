<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ProductsCatalog.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Toast de bienvenida -->
    <div class="position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1055;">
        <div id="toastBienvenida" class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body" runat="server" id="toastMensaje">
                    <!-- Aquí se inyecta el mensaje desde code-behind -->
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>

    <!-- Contenedor azul centrado como Login -->
    <div class="container-fluid d-flex justify-content-center align-items-center bg-primary bg-opacity-10 p-0" style="height: calc(90vh - 70px);">
        <div class="card shadow p-4" style="width: 380px; border-radius: 12px;">

            <div class="text-center mb-4">
                <h2 class="fw-bold">ProductsCatalog</h2>
                <span class="text-muted">Crear cuenta</span>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Email"
                    placeholder="Ingrese su email" />
            </div>

            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Ingrese su contraseña" />
            </div>

            <div class="d-grid">
                <asp:Button
                    ID="btnRegistrar"
                    runat="server"
                    Text="Registrarse"
                    CssClass="btn btn-primary"
                    OnClick="btnRegistrar_Click" />
            </div>

            <div class="text-center mt-3">
                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="text-primary fw-semibold" />
            </div>

        </div>
    </div>
    <hr />

    <!-- Script de Bootstrap para activar el Toast -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["mensajeBienvenida"] != null)
            {
                toastMensaje.InnerHtml = Session["mensajeBienvenida"].ToString();
                Session.Remove("mensajeBienvenida");

                // Mostrar toast usando JS
                string script = "var toastEl = document.getElementById('toastBienvenida');" +
                                "var toast = new bootstrap.Toast(toastEl, {delay: 3000});" +
                                "toast.show();";
                ClientScript.RegisterStartupScript(this.GetType(), "mostrarToast", script, true);
            }
        }
    </script>

</asp:Content>
