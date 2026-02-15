using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using System.Drawing;
using System.Web.Services.Description;
using System.Security.Policy;
using System.Security.Cryptography;


namespace ProductsCatalog
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos = new List<Articulo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listar();

            if (!IsPostBack)
            {
                repRepetidor.DataSource = ListaArticulos;
                repRepetidor.DataBind();
            }
        }

        protected void btnEjemplo_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;

            // Ejemplo futuro:
            // Response.Redirect("DetalleArticulo.aspx?id=" + valor);
        }
    }
}