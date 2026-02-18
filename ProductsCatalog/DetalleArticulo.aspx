<%@ Page Title="Detalle Producto" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true"
    CodeBehind="DetalleArticulo.aspx.cs"
    Inherits="ProductsCatalog.DetalleArticulo" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">

    <style>
        .articulo-details-container {
            padding: 40px 20px;
            width: 100%;
        }

        .articulo-card {
            display: flex;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            width: 100%;
            min-height: 500px;
            overflow: hidden;
        }

        .articulo-imagen-seccion {
            flex: 1.2;
            padding: 50px;
            text-align: center;
            background: #f8f9fa;
        }

        .articulo-info-seccion {
            flex: 1;
            padding: 50px;
        }

        /* ===== ZOOM REAL ===== */

        .zoom-container {
            overflow: hidden;
            border-radius: 15px;
            cursor: zoom-in;
        }

        .zoom-img {
            width: 100%;
            max-height: 420px;
            object-fit: contain; /* 👈 CLAVE */
            transition: transform 0.2s ease;
        }
    </style>

    <script>

        function zoomImage(e) {
            const img = e.target;
            const rect = img.getBoundingClientRect();

            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            const xPercent = (x / rect.width) * 100;
            const yPercent = (y / rect.height) * 100;

            img.style.transformOrigin = xPercent + "% " + yPercent + "%";
            img.style.transform = "scale(2)";
        }

        function resetZoom(e) {
            const img = e.target;
            img.style.transform = "scale(1)";
            img.style.transformOrigin = "center center";
        }

    </script>

</asp:Content>



<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5">

        <div class="articulo-details-container">

            <div class="articulo-card">

                <!-- 🔥 IMAGEN CON ZOOM -->
                <div class="articulo-imagen-seccion">

                    <div class="zoom-container">

                        <asp:Image
                            ID="imgArticulo"
                            runat="server"
                            CssClass="img-fluid zoom-img"
                            onmousemove="zoomImage(event)"
                            onmouseleave="resetZoom(event)" />

                    </div>

                </div>

                <!-- 🔥 INFO PRODUCTO -->
                <div class="articulo-info-seccion">

                    <h2 class="fw-bold">
                        <asp:Label ID="lblNombre" runat="server" />
                    </h2>

                    <p class="text-muted">
                        Código:
                        <asp:Label ID="lblCodigo" runat="server" />
                    </p>

                    <p>
                        <strong>Marca:</strong>
                        <asp:Label ID="lblMarca" runat="server" />
                    </p>

                    <h3 class="text-success">$
                        <asp:Label ID="lblPrecio" runat="server" />
                    </h3>

                    <hr />

                    <h5>Descripción</h5>

                    <p>
                        <asp:Label ID="lblDescripcion" runat="server" />
                    </p>

                    <!-- BOTONES -->
                    <div class="mt-4 d-flex gap-3">

                        <asp:Button
                            ID="btnComprar"
                            runat="server"
                            Text="Comprar ahora"
                            CssClass="btn btn-primary " />

                        <asp:Button
                            ID="btnCarrito"
                            runat="server"
                            Text="Agregar al carrito"
                            CssClass="btn btn-primary" />

                        <a href="Default.aspx" class="btn btn-secondary">Volver
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
