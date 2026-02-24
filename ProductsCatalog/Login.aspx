<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProductsCatalog.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid d-flex justify-content-center align-items-center bg-light p-0" style="height: calc(90vh - 70px);">
        <div class="card shadow p-4" style="width: 380px; border-radius: 12px;">
            <div class="text-center mb-4">
                <h2 class="fw-bold">ProductsCatalog</h2>
                <span class="text-muted">Iniciar sesión</span>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese su email" />
            </div>
            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese su contraseña" />
            </div>
            <div class="d-grid">
                <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            </div>
            <div class="text-center mt-3">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-semibold" />
            </div>
        </div>
    </div>
    <hr />
</asp:Content>
