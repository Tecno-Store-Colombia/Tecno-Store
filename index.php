<!DOCTYPE html>
<html lang="es">
<head>
    <title>Inicio - Tecno Store</title>
    <?php include './inc/link.php'; ?>
    <style>
        .thumbnail {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 400px; /* Altura fija para asegurar uniformidad */
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 20px; /* Espacio entre recuadros */
        }
        .thumbnail img {
            max-height: 150px;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .caption {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }
        .caption h3 {
            font-size: 1.25em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .caption p {
            margin: 10px 0;
        }
        .caption .price {
            color: #d9534f;
            font-size: 1.15em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body id="container-page-index">
    <?php include './inc/navbar.php'; ?>
    <div class="jumbotron" id="jumbotron-index">
        <h1><span class="tittles-pages-logo">Tecno Store</span> <small style="color: #fff;">Colombia</small></h1>
        <p>
            Un mundo de tecnología al alcance de su empresa, oficina y hogar, donde buscamos su comodidad.
        </p>
    </div>
    <section id="new-prod-index">
        <div class="container">
            <div class="page-header">
                <h1>Conoce Nuestros Productos Destacados</h1>
            </div>
            <div class="row">
                <?php
                    include 'library/configServer.php';
                    include 'library/consulSQL.php';
                    $consulta= ejecutarSQL::consultar("select * from producto where Stock > 0 limit 6");
                    $totalproductos = mysql_num_rows($consulta);
                    if($totalproductos > 0){
                        while($fila = mysql_fetch_array($consulta)){
                            echo '
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="assets/img-products/' . $fila['Imagen'] . '" alt="Producto" class="img-responsive">
                                    <div class="caption">
                                        <h3>' . $fila['Marca'] . '</h3>
                                        <p>' . $fila['NombreProd'] . '</p>
                                        <p class="price">$' . $fila['Precio'] . '</p>
                                        <p class="text-center">
                                            <a href="infoProd.php?CodigoProd=' . $fila['CodigoProd'] . '" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>&nbsp; Detalles</a>&nbsp;&nbsp;
                                            <button value="' . $fila['CodigoProd'] . '" class="btn btn-success btn-sm botonCarrito"><i class="fa fa-shopping-cart"></i>&nbsp; Añadir</button>
                                        </p>
                                    </div>
                                </div>
                            </div>';
                        }   
                    } else {
                        echo '<h2>No hay productos registrados en la base de datos, administre la tienda</h2>';
                    }  
                ?>  
            </div>
        </div>
    </section>
    <section id="reg-info-index">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 text-center">
                    <article style="margin-top:20%;">
                        <p><i class="fa fa-users fa-4x"></i></p>
                        <h3>Regístrate</h3>
                        <p>Regístrate y hazte cliente de <span class="tittles-pages-logo">Tecno Store</span> para recibir las mejores ofertas y descuentos especiales de nuestros productos y servicios.</p>
                        <p><a href="registration.php" class="btn btn-info btn-block">Regístrate en Tecno Store Colombia</a></p>   
                    </article>
                </div>
                <div class="col-xs-12 col-sm-6">
                    <img src="assets/img/Serverdell2.png" alt="Servidores" class="img-responsive">
                </div>
            </div>
        </div>
    </section>
    <section id="distribuidores-index">
        <div class="container">
            <div class="col-xs-12 col-sm-6"></div>
            <div class="col-xs-12 col-sm-6"></div>
            <div class="col-xs-12">
                <div class="page-header">
                    <h1>Nuestros aliados <small style="color: #333;">estratégicos</small></h1>
                </div>
                <br><br>
                <img src="assets/img/logos-marcas.png" alt="logos-marcas" class="img-responsive">
            </div>
        </div>
    </section>
    <?php include './inc/footer.php'; ?>
</body>
</html>
