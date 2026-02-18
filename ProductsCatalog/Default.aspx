<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProductsCatalog.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .glow-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .glow-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 0 20px #0dcaf0;
            }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Catálogo de Productos</h1>
    <p class="fs-5">Explorá nuestros artículos disponibles.</p>
    <br />

    <div class="row row-cols-1 row-cols-md-3 g-4">

        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>
                <div class="col">
                    <div class="card glow-card h-100">

                        <img src="<%#Eval("ImagenUrl")%>" class="card-img-top" alt="Imagen producto">

                        <div class="card-body d-flex flex-column">

                            <!-- Nombre -->
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>

                            <!-- Descripción -->
                            <p class="card-text"><%#Eval("Descripcion") %></p>

                            <!-- Marca y Categoría enfrentadas -->
                            <div class="d-flex justify-content-between">
                                <span><strong>Marca:</strong> <%#Eval("Marca.Descripcion") %></span>
                                <span><strong>Categoría:</strong> <%#Eval("Categoria.Descripcion") %></span>
                            </div>

                            <!-- Spacer para empujar precio y botón abajo -->
                            <div class="mt-auto">

                                <!-- Precio y Botón enfrentados -->
                                <div class="d-flex justify-content-between align-items-center mt-3">

                                    <span class="fw-bold">$ <%# String.Format("{0:N2}", Eval("Precio")) %>
                                    </span>

                                    <a href="DetalleArticulo.aspx?id=<%#Eval("Id") %>"
                                        class="btn btn-primary btn">Ver Detalle
                                    </a>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

    <br>
    <br>
    <br>
    <br />

</asp:Content>
