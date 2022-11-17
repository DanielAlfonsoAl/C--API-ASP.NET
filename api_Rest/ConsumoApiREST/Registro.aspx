<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ConsumoApiREST.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<head>
  <!-- CSS -->
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>

  <script
    src="https://code.jquery.com/jquery-3.0.0.js" crossorigin="anonymous"
  ></script>

  <!-- jQuery and JS bundle w/ Popper.js -->
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>

<body>
  <div class="container">
    <div class="row mt-3">
      <div class="col-12">
        <form>
          <div class="form-group">
            <label for="exampleInputEmail1">ID del Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtIdArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Nombre del Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtNombreArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Cantidad Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtCantidadArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Costo Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtCostoArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Tipo Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtTipoArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Balas Arma (Si/No)</label>
            <input
              type="text"
              class="form-control"
              id="txtBalasArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Permiso Arma (0/1)</label>
            <input
              type="text"
              class="form-control"
              id="txtPermisoArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Acesorios del Arma</label>
            <input
              type="text"
              class="form-control"
              id="txtAcesoriosArma"
              placeholder=""
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">descripcion del Arma (Corta)</label>
            <input
              type="text"
              class="form-control"
              id="txtDescripcionArma"
              placeholder=""
            />
          </div>
          <button type="button" class="btn btn-primary" id="Guardar" onclick="GuardarArma()">
            Guardar
          </button>
          <button type="button" class="btn btn-warning" id="Volver" onclick="volverIndex()">
            Volver
          </button>
        </form>
      </div>
    </div>
  </div>
  <script>

      // se crea la funcion  para volver al index.aspx

      function volverIndex() {
          window.location = "index.aspx";
      }

      // se crea funcion para guardar el Arma

      function GuardarArma() {
          if (editar) {
              var data = {
                  Id_Arma: $("#txtIdArma").val(),
                  Nombre_Arma: $("#txtNombreArma").val(),
                  Cantidad_Arma: $("#txtCantidadArma").val(),
                  Costo_Arma: $("#txtCostoArma").val(),
                  Tipo_Arma: $("#txtTipoArma").val(),
                  Balas_Ama: $("#txtBalasArma").val(),
                  Permiso_Arma: $("#txtPermisoArma").val(),
                  Accesorios_Arma: $("#txtAcesoriosArma").val(),
                  Descripcion_Arma: $("#txtDescripcionArma").val(),
              };

              $.ajax({
                  method: "PUT",
                  url: "https://localhost:44381/api/Armas/",
                  contentType: "application/json",
                  data: JSON.stringify(data), // access in body
              }).done(function (response) { 
                  console.log(data)
                  console.log(response);
                  if (response) {
                      alert("Se guardaron los cambios");
                      window.location = "Index.aspx";
                  } else {
                      alert("Error al Modificar");
                  }
              });
          } else {
              var data = {
                  Id_Arma: $("#txtIdArma").val(),
                  Nombre_Arma: $("#txtNombreArma").val(),
                  Cantidad_Arma: $("#txtCantidadArma").val(),
                  Costo_Arma: $("#txtCostoArma").val(),
                  Tipo_Arma: $("#txtTipoArma").val(),
                  Balas_Ama: $("#txtBalasArma").val(),
                  Permiso_Arma: $("#txtPermisoArma").val(),
                  Accesorios_Arma: $("#txtAcesoriosArma").val(),
                  Descripcion_Arma: $("#txtDescripcionArma").val(),
              };
              $.post("https://localhost:44381/api/Armas", data).done(function (
                  response
              ) {
                  console.log(response);
                  if (response) {
                      alert("Arma registrada");
                      window.location = "Index.aspx";
                  } else {
                      alert("Error al crear");
                  }
              });
          }
      }

      // se crea la funcion para verificar el id que nosea null

      $.urlParam = function (name) {
          var results = new RegExp("[\?&]" + name + "=([^&#]*)").exec(
              window.location.href
          );
          if (results == null) {
              return null;
          }
          return decodeURI(results[1]) || 0;
      };

      // se crea funcion para mostrar el arma que se modifico
      function PintarArma(id) {
          console.log("este es el id:" + id)
          $.get("https://localhost:44381/api/Armas/" + id).done(function (
              response
          ) {
              console.log("respuesta:");
              console.log(response);
              $("#txtNombreArma").val(response[0].Nombre_Arma),
                  $("#txtCantidadArma").val(response[0].Cantidad_Arma),
                  $("#txtCostoArma").val(response[0].Costo_Arma),
                  $("#txtTipoArma").val(response[0].Tipo_Arma),
                  $("#txtBalasArma").val(response[0].Balas_Ama),
                  $("#txtPermisoArma").val(response[0].Permiso_Arma),
                  $("#txtAcesoriosArma").val(response[0].Accesorios_Arma),
                  $("#txtDescripcionArma").val(response[0].Descripcion_Arma);
          });
      }

      //
      var editar = false;
      window.onload = function () {
          var id = $.urlParam("id");
          console.log(id);
          if (id != null) {
              editar = true;
              $("#txtIdArma").val(id);
              PintarArma(id);
              console.log(PintarArma(id));
          }
      };
  </script>
</body>



</asp:Content>
