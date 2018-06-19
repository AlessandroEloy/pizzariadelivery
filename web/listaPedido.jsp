<%-- 
    Document   : listapedido.jsp
    Created on : 16/12/2017, 17:44:11
    Author     : Carol
--%>

<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.modelo.Pedido"%>
<%@page import="com.pizzaria.modelo.ItemPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Painel Cliente</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
        <link rel="stylesheet" href="assets/scss/widgets.css">
        <link rel="stylesheet" href="assets/scss/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

        <script src="JS/jquery-3.2.1.min.js"></script>
        <script src="JS/exibePedido.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

    </head>
    <body>
        <!-- Left Panel -->

        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo.png" alt="Logo"></a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="Pedido.jsp"> <i class="menu-icon fa fa-dashboard"></i>Painel Cliente </a>
                        </li>
                        <h3 class="menu-title">Atividades</h3><!-- /.menu-title -->
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-shopping-cart"></i>Meus pedidos</a>
                            <ul class="sub-menu children dropdown-menu">


                                <li><input type="submit" onclick="window.location.href = 'Servlet_Listar_Pedido?id_user=${usuarioLog.id}'" value="Consultar" name ='listaPedido' class="btn btn-danger btn-sm"></li> 

                                </form>
                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa  fa-user"></i>Meus dados</a>
                            <ul class="sub-menu children dropdown-menu">

                                <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Servlet_Buscar?id=${usuarioLog.id}'" value="Atualizar" name ='Buscar'></a></li> 

                            </ul>
                        </li>



                    </ul> </div>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->

        <!-- Left Panel -->


        <!-- Right Panel -->

        <div id="right-panel" class="right-panel">

            <!-- Header-->
            <header id="header" class="header bg-warning">

                <div class="header-menu">

                    <div class="col-sm-7">
                        <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>

                    </div> 



                    <div class="col-sm-5">
                        <div class="user-area dropdown float-right"> 
                            <button type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Login_index.jsp'">Sair</button>
                            <button type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Pedido.jsp'">Voltar</button></p>


                        </div>



                    </div> 
                </div>

            </header><!-- /header -->
            <!-- Header-->

            <div class="breadcrumbs">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Painel Cliente</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">Pizzaria Delivery</a></li>

                                <li class="active">Consultar pedidos</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Lista de pedidos</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <%
                                            Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                                        %> <form name="forml" action="Servlet_Listar_Pedido" method="post"> 
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Status</th>
                                                    <th>Data</th>
                                                    <th>Nome</th>
                                                    <th>Valor Total</th>
                                                    <th>observação</th>
                                                    <th>Cancelar</th>
                                                    <th>Detalhes</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <% //recupera o objeto resultado

                                                    ArrayList<Pedido> listaPedido = (ArrayList<Pedido>) request.getAttribute("listaPedido");
                                                    for (Pedido pedido : listaPedido) {
                                                %>  
                                                <tr>
                                                    <td><%=pedido.getCod()%></td>
                                                    <td><b><%=pedido.getStatus()%><b></td>
                                                                <td><%=pedido.getData()%></td>
                                                                <td><%=pedido.getCliente().getNome()%></td>
                                                                <td><%=pedido.getValorTotal()%></td>
                                                                <td><%=pedido.getObservacao()%></td>
<!--                                                                <td><a href="Servlet_Atualizar_Status?status=<%=pedido.getStatus()%>"><img src="imagem/close.png"  width="25px"></a></td>-->
                                                                <td><a href = "Servlet_Atualizar_Status?cod=<%=pedido.getCod()%>"><img src="imagem/close.png"  width="25px"></a></td>
                                                                <td><a href="#myModalDetalhes" data-toggle="modal" data-target="#myModalDetalhes"><img id="detalhes" class="detalhes" data-cod="<%=pedido.getCod()%>" src="imagem/add.png"  width="25px"></a></td>
                                                                </tr>
                                                                <%}%>


                                                                </tbody>
                                                                </table>
                                                                </div>
                                                                </div>
                                                                </div>

                                                                </form>
                                                                </div>
                                                                </div><!-- .animated -->
                                                                </div><!-- .content -->


                                                                </div><!-- /#right-panel -->

                                                                <!-- Div Modal para Detalhes do Pedido-->
                                                                <div class="modal fade" id="myModalDetalhes" role="dialog">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">

                                                                                <h4 class="modal-title">Detalhes do Pedidos</h4>
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <tr>
                                                                                    <td> <b>Valor Total: </b> R$<span id="ValorTotal"></span></td></br>
                                                                                    <td><b> Nome: </b><span id="nome"></span></td></br>
                                                                                    <td> <b>Quantidade: </b> <span id="qtd" ></span></td></br>
                                                                                    <td> <b>Valor Unitario: </b>R$ <span id="valor"></span></td></br>
                                                                                    <td> <b>Ingredientes: </b> <span id="ingredientes"></span></td></br>

                                                                                </tr>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Right Panel -->


                                                                <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
                                                                <script src="assets/js/popper.min.js"></script>
                                                                <script src="assets/js/plugins.js"></script>
                                                                <script src="assets/js/main.js"></script>


                                                                <script src="assets/js/lib/data-table/datatables.min.js"></script>
                                                                <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
                                                                <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
                                                                <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
                                                                <script src="assets/js/lib/data-table/jszip.min.js"></script>
                                                                <script src="assets/js/lib/data-table/pdfmake.min.js"></script>
                                                                <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
                                                                <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
                                                                <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
                                                                <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
                                                                <script src="assets/js/lib/data-table/datatables-init.js"></script>


                                                                <script type="text/javascript">
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });
                                                                </script>


                                                                </body>
                                                                </html>
