<%@ Page Title="Lista de Artículos" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="ProductsCatalog.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="mb-4">Lista de Artículos</h1>

    <div class="card shadow-sm p-3">

        <asp:GridView
            ID="dgvArticulos"
            runat="server"
            CssClass="table table-hover"
            AutoGenerateColumns="false"
            DataKeyNames="Id"
            AllowPaging="true"
            PageSize="5"
            OnPageIndexChanging="dgvArticulos_PageIndexChanging">

            <HeaderStyle CssClass="table-secondary" />

            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Código" DataField="Codigo" />
                <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:N2}" />

                
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:LinkButton
                            ID="btnAccion"
                            runat="server"
                            CssClass="btn-sm btn-outline-primary"
                            Text="📋"
                            PostBackUrl='<%# "ABMArticulo.aspx?id=" + Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

    <a href="ABMArticulo.aspx" class="btn btn-primary mt-3">Agregar Artículo</a>

</asp:Content>
