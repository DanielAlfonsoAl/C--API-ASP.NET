<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ConsumoApiREST.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>

    <!-- CSS -->
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.0.0.js" crossorigin="anonymous"></script>

    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>


</head>

<body>
    <div class="container">
        <div class="row mb-3 mt-3">
            <div class="col-4">
                <button type="button" class="btn btn-primary“ onclick=" IrFormularioCrear()" id="btn">Crear Nuevo</button>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre Arma</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Tipo Arma</th>
                            <th scope="col">Fecha ingreso</th>
                            <th scope="col">Balas (Si/No)</th>
                            <th scope="col">Permiso(1/0)</th>
                            <th scope="col">Accesorios</th>
                            <th scope="col">Descripcion</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>


        let button = document.getElementById("btn") 

        button.addEventListener("click", IrFormularioCrear)


        window.onload = function () {
            listar();
        };

        function IrFormularioCrear() {
            window.location = "Registro.aspx";
        }

        function listar() {
            $(".table tbody").html("");
            $.get("https://localhost:44381/api/Armas")
                .done(function (response) {
                    console.log(response);
                    $.each(response, function (id, fila) {
                        $("<tr>").append(
                            $("<td>").text(fila.Id_Arma),
                            $("<td>").text(fila.Nombre_Arma),
                            $("<td>").text(fila.Cantidad_Arma),
                            $("<td>").text(fila.Costo_Arma),
                            $("<td>").text(fila.Tipo_Arma),
                            $("<td>").text(fila.Fecha_Arma),
                            $("<td>").text(fila.Balas_Ama),
                            $("<td>").text(fila.Permiso_Arma),
                            $("<td>").text(fila.Accesorios_Arma),
                            $("<td>").text(fila.Descripcion_Arma),
                            $("<br>"),
                            $("<td>").append(
                                $("<button>").data("id", fila.Id_Arma).addClass("btn btn-success btn-sm mr-1 editar").text("Editar ").attr({ "type": "button" }),
                                $("<button>").data("id", fila.Id_Arma).addClass("btn btn-danger btn-sm eliminar").text("Eliminar").attr({ "type": "button" })
                            )
                        ).appendTo(".table");
                    });
                });
        }

        //creamos el siguiente código que permite direccionar a la página de registro llevando el id a editar

        $(document).on('click', '.editar', function () {
            console.log($(this).data("id"));
            window.location = "Registro.aspx?id=" + $(this).data("id");
        });


        //Ahora programamos el evento click de eliminar


        $(document).on('click', '.eliminar', function () {
            console.log($(this).data("id"));
            $.ajax({
                method: "DELETE",
                url: "https://localhost:44381/api/Armas/" + $(this).data("id")
            })
                .done(function (response) {
                    console.log(response);
                    if (response) {
                        listar();
                    } else {
                        alert("Error al eliminar")
                    }
                });
        });




    </script>
</body>


</asp:Content>


