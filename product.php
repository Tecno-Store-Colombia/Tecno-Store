<?php
include './library/configServer.php';
include './library/consulSQL.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Productos</title>
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
            margin-bottom: -10px;
        }
        .caption p {
            margin: 10px 0;
        }
        .caption .price {
            color: #d9534f;
            font-size: 1.15em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body id="container-page-product">
    <?php include './inc/navbar.php'; ?>
    <section id="store">
        <br>
        <div class="container">
            <div class="page-header">
                <h1>Vitrina de productos <small class="tittles-pages-logo">Tecno Store Colombia</small></h1>
            </div>
            <br><br>
            <div class="row">
                <div class="col-xs-12">
                    <ul id="store-links" class="nav nav-tabs" role="tablist">
                        <li role="presentation"><a href="#all-product" role="tab" data-toggle="tab" aria-controls="all-product" aria-expanded="false">Todos nuestros productos</a></li>
                        <li role="presentation" class="dropdown active">
                            <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents" aria-expanded="false">Todas las categorías <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
                                <!-- Lista categorias -->
                                <?php
                                $categorias = ejecutarSQL::consultar("select * from categoria");
                                while ($cate = mysql_fetch_array($categorias)) {
                                    echo '
                                        <li>
                                            <a href="#' . $cate['CodigoCat'] . '" tabindex="-1" role="tab" id="' . $cate['CodigoCat'] . '-tab" data-toggle="tab" aria-controls="' . $cate['CodigoCat'] . '" aria-expanded="false">' . $cate['Nombre'] . '
                                            </a>
                                        </li>';
                                }
                                ?>
                                <!-- Fin lista categorias -->
                            </ul>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade" id="all-product" aria-labelledby="all-product-tab">
                            <br><br>
                            <div class="row">
                                <?php
                                $consulta = ejecutarSQL::consultar("select * from producto where Stock > 0");
                                $totalproductos = mysql_num_rows($consulta);
                                if ($totalproductos > 0) {
                                    while ($fila = mysql_fetch_array($consulta)) {
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
                                    echo '<h2>No hay productos en esta categoría</h2>';
                                }
                                ?>
                            </div>
                        </div><!-- Fin del contenedor de todos los productos -->
                      
                        <!-- Contenedores de categorias -->
                        <?php
                        $consultar_categorias = ejecutarSQL::consultar("select * from categoria");
                        while ($categ = mysql_fetch_array($consultar_categorias)) {
                            echo '<div role="tabpanel" class="tab-pane fade active in" id="' . $categ['CodigoCat'] . '" aria-labelledby="' . $categ['CodigoCat'] . '-tab"><br>';
                            $consultar_productos = ejecutarSQL::consultar("select * from producto where CodigoCat='" . $categ['CodigoCat'] . "' and Stock > 0");
                            $totalprod = mysql_num_rows($consultar_productos);
                            if ($totalprod > 0) {
                                while ($prod = mysql_fetch_array($consultar_productos)) {
                                    echo '
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <div class="thumbnail">
                                                <img src="assets/img-products/' . $prod['Imagen'] . '" alt="Producto" class="img-responsive">
                                                <div class="caption">
                                                    <h3>' . $prod['Marca'] . '</h3>
                                                    <p>' . $prod['NombreProd'] . '</p>
                                                    <p class="price">$' . $prod['Precio'] . '</p>
                                                    <p class="text-center">
                                                        <a href="infoProd.php?CodigoProd=' . $prod['CodigoProd'] . '" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>&nbsp; Detalles</a>&nbsp;&nbsp;
                                                        <button value="' . $prod['CodigoProd'] . '" class="btn btn-success btn-sm botonCarrito"><i class="fa fa-shopping-cart"></i>&nbsp; Añadir</button>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>';
                                }
                            } else {
                                echo '<h2>No hay productos en esta categoría</h2>';
                            }
                            echo '</div>';
                        }
                        ?>
                        <!-- Fin contenedores de categorias -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php include './inc/footer.php'; ?>
    <script>
        $(document).ready(function() {
            $('#store-links a:first').tab('show');
        });
    </script>
</body>
</html>
