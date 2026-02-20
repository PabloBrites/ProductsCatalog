<%@ Page Title="Lista de Artículos" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="ProductsCatalog.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="mb-4">Lista de Artículos</h1>

    <div class="card shadow-sm p-3">

        <!-- FILTRO COMÚN + CHECK AVANZADO -->
        <div class="row mb-3">
            <div class="col-12 d-flex align-items-center gap-3">

                <asp:Label Text="Filtrar" runat="server" CssClass="mb-0" />

                <asp:TextBox
                    runat="server"
                    ID="txtFiltro"
                    CssClass="form-control"
                    Style="width: 350px;"
                    AutoPostBack="true"
                    OnTextChanged="filtro_TextChanged" />

                <asp:CheckBox
                    Text="Filtro Avanzado"
                    ID="chkAvanzado"
                    runat="server"
                    AutoPostBack="true"
                    OnCheckedChanged="chkAvanzado_CheckedChanged" />

            </div>
        </div>

        <% if (chkAvanzado.Checked)
            { %>

        <!-- FILTRO AVANZADO -->
        <div class="row mb-3">

            <div class="col-3">
                <asp:Label Text="Campo" runat="server" />
                <asp:DropDownList
                    ID="ddlCampo"
                    runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Marca" />
                    <asp:ListItem Text="Categoria" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
            </div>

            <div class="col-3">
                <asp:Label Text="Criterio" runat="server" />
                <asp:DropDownList
                    ID="ddlCriterio"
                    runat="server"
                    CssClass="form-control">
                </asp:DropDownList>
            </div>

            <div class="col-3">
                <asp:Label Text="Filtro" runat="server" />
                <asp:TextBox
                    ID="txtFiltroAvanzado"
                    runat="server"
                    CssClass="form-control" />
            </div>

            <div class="col-3 d-flex align-items-end">
                <asp:Button
                    Text="Buscar"
                    ID="btnBuscar"
                    runat="server"
                    CssClass="btn btn-primary w-100"
                    OnClick="btnBuscar_Click" />
            </div>

        </div>

        <% } %>

        <asp:GridView
            ID="dgvArticulos"
            runat="server"
            CssClass="table table-hover"
            AutoGenerateColumns="false"
            DataKeyNames="Id"
            AllowPaging="true"
            PageSize="8"
            OnPageIndexChanging="dgvArticulos_PageIndexChanging">

            <HeaderStyle CssClass="table-secondary" />

            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Código" DataField="Codigo" />
                <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:N0}" />

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
