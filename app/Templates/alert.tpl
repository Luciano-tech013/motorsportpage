<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <div class="small-box text-center p-5 alert alert-danger">
        <h1 class="fs-2">ALERTA!!</h1>
        <div class="fs-4">
            {$error}
        </div>
        <a href="volver" class="btn btn-primary mt-5">VOLVER</a>
    </div>
    <div>
        <p class="ml-4 p-5 fs-4">Si se muestra el error "¡Alerta!" u otro código de error, significa que usted debe eliminar primero los autos que contengan dicha categoria.
        Si aparece un error de eliminar categoria, siga los pasos que aparecen a continuacion: </p>
        <div class="m-5 mt-0">
            <h1 class="fs-3">1.Pruebe eliminando los autos</h1>
            <ul class="fs-5">
                <li>Vaya a la Tabla Autos</li>
                <li>Fijese que categoria tienen en la columna "Categorias"</li>
                <li>Eliminela</li>
                <li>Pruebe de eliminar de nuevo dicha categoria</li>
            </ul>
        </div>
        <p class="ml-4 p-5 fs-4"> También es posible que sea error de la página o problemas de conexion.
        Si aparece un error de carga de la página: Para solucionar el problema, sigue los pasos que aparecen a
        continuación. Para comenzar, vuelve a cargar la página. </p>
        <div class="m-5 mt-0">
            <h1 class="fs-3">1.Pruebe eliminando los autos</h1>
            <ul class="fs-5">
                <li>Comprueba tu conexión a Internet</li>
                <li>Borra la caché</li>
                <li>Cierra otras pestañas o apps</li>
            </ul>
        </div>
    </div>
</body>

{include file="app/templates/footer.tpl"} 

