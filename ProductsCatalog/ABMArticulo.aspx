<%@ Page Title="ABM Artículo" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMArticulo.aspx.cs" Inherits="ProductsCatalog.ABMArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="row">

        <!-- ===== COLUMNA IZQUIERDA ===== -->
        <div class="col-6">

            <div class="mb-3">
                <label class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Código</label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Marca</label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label class="form-label">Categoría</label>
                <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <a href="ListaArticulos.aspx" class="btn btn-secondary">Cancelar</a>
            </div>

        </div>


        <!-- ===== COLUMNA DERECHA ===== -->
        <div class="col-6">

            <div class="mb-3">
                <label class="form-label">Descripción</label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" />
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="mb-3">
                        <label class="form-label">URL Imagen</label>
                        <asp:TextBox runat="server"
                            ID="txtImagenUrl"
                            CssClass="form-control"
                            AutoPostBack="true"
                            OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>

                    <asp:Image
                        ID="imgArticulo"
                        runat="server"
                        Width="60%"
                        ImageUrl="https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png" />

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>


    <!-- ===== ELIMINAR ===== -->
    <div class="row mt-3">
        <div class="col-6">

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="mb-3">
                        <asp:Button Text="Eliminar"
                            ID="btnEliminar"
                            CssClass="btn btn-primary"
                            OnClick="btnEliminar_Click"
                            runat="server" />
                    </div>

                    <% if (ConfirmaEliminacion)
                        { %>

                    <div class="mb-3">
                        <asp:CheckBox Text="Confirmar eliminación"
                            ID="chkConfirmaEliminacion"
                            runat="server" />

                        <asp:Button Text="Eliminar definitivamente"
                            ID="btnConfirmaEliminacion"
                            CssClass="btn btn-outline-primary"
                            OnClick="btnConfirmaEliminacion_Click"
                            runat="server" />
                    </div>

                    <% } %>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

</asp:Content>
