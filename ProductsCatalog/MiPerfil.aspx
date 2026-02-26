<%@ Page Title="Mi Perfil" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true"
    CodeBehind="MiPerfil.aspx.cs"
    Inherits="ProductsCatalog.MiPerfil"
    UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-perfil {
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 30px;
            background-color: white;
        }

        .img-perfil {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid #dee2e6;
        }

        .btn-gris {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .btn-gris:hover {
            background-color: #5a6268;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="card-perfil">

            <h2 class="text-center fw-bold mb-4">Mi Perfil</h2>

            <div class="row">

                <!-- DATOS PERSONALES -->
                <div class="col-md-6">

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control bg-light text-muted" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                    </div>                    

                </div>

                <!-- IMAGEN -->
                <div class="col-md-6 text-center">

                    <div class="mb-3">
                        <label class="form-label">Imagen de Perfil</label>
                        <input type="file" id="txtImagen" runat="server" class="form-control" />
                    </div>

                    <asp:Image 
                        ID="imgPerfil"
                        runat="server"
                        ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                        CssClass="img-perfil mt-3" />

                </div>

            </div>

            <!-- BOTONES -->
            <div class="mt-4 text-center">

                <asp:Button 
                    ID="btnGuardar"
                    runat="server"
                    Text="Guardar"
                    CssClass="btn btn-primary"
                    OnClick="btnGuardar_Click" />

                <asp:HyperLink 
                    ID="btnRegresar"
                    runat="server"
                    NavigateUrl="Default.aspx"
                    CssClass="btn btn-secondary">
                    Regresar
                </asp:HyperLink>

            </div>

        </div>
    </div>

</asp:Content>
