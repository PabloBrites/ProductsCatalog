using System;
using dominio;
using negocio;

namespace ProductsCatalog
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);

                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Articulo seleccionado = negocio.obtenerPorId(id);

                    lblNombre.Text = seleccionado.Nombre;
                    lblMarca.Text = seleccionado.Marca.Descripcion;
                    lblDescripcion.Text = seleccionado.Descripcion;
                    lblCodigo.Text = seleccionado.Codigo;
                    lblPrecio.Text = seleccionado.Precio.ToString("N0");
                    imgArticulo.ImageUrl = seleccionado.ImagenUrl;
                }
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            // FUTURO → Checkout directo
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            // FUTURO → Guardar en carrito en Session
        }
    }
}