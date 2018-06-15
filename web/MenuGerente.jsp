<%-- 
    Document   : MenuGerente
    Created on : May 26, 2017, 12:13:29 AM
    Author     : Carol
--%>

<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>



<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Painel Gerente</title>

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
                            <a href="index.html"> <i class="menu-icon fa fa-dashboard"></i>Painel Gerente</a>
                        </li>
                        <h3 class="menu-title">Funções</h3><!-- /.menu-title -->
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-shopping-cart"></i>Pedidos</a>
                            <ul class="sub-menu children dropdown-menu">


                                <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'ListaPedidosPorStatus.jsp'" value="Consultar Pedidos" id='func' value="CONSULTAR PEDIDOS"></li>

                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users"></i>Clientes</a>
                            <ul class="sub-menu children dropdown-menu">


                                <form name ="forml" action="Servlet_Listar" method="post"> 
                                    <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'AlterarDadosGF.jsp'" value="Consultar Clientes" id='func'> </a></li>
                                </form>

                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cutlery"></i>Produtos</a>
                            <ul class="sub-menu children dropdown-menu">

                                <li><input type="submit"  class="btn btn-danger btn-sm"  onclick="window.location.href = 'CadProdutos.jsp'" value="Cadastrar Produto" id='func'> </li><br>
                                <form name ="forml" action="Servlet_Listar_Produto" method="post"> 
                                    <li><input type="submit"  class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Gerenciar Produtos" id='func'>  </li>
                                </form>


                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list-alt"></i>Categorias</a>
                            <ul class="sub-menu children dropdown-menu">

                                <li><input type="submit"  class="btn btn-danger btn-sm" onclick="window.location.href = 'Cadastro_Categoria.jsp'" value="Cadastrar Categoria" id='func'>  </li>
                                <br>
                                <form name ="forml" action="Servlet_Listar_Cat" method="post"> 
                                    <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Gerenciar Categoria" id='func'></li>
                                </form>


                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-id-card-o"></i>Funcionários</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Servlet_Func'" value="Cadastrar" id='func'></li>
                                <br>
                                <form name ="forml" action="Servlet_Listar_Func" method="post"> 
                                    <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Gerenciar" id='func'></li>
                                </form>
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
                            <button type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Login_index.jsp'">Sair</button></p>



                        </div>



                    </div> 
                </div>

            </header><!-- /header -->
            <!-- Header-->

            <div class="breadcrumbs">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Painel Gerente</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">Pizzaria Delivery</a></li>
                                    <%
                                        Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                                    %>
                                <li class="active"><%out.print(usuarioLog.getLogin());%></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>




            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Lucros</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Novos Usuários</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-layout-grid2 text-warning border-warning"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Projetos</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-link text-danger border-danger"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Referências</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-four">
                            <div class="stat-icon dib">
                                <i class="ti-server text-muted"></i>
                            </div>
                            <div class="stat-content">
                                <div class="text-left dib">
                                    <div class="stat-heading">Dados</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-four">
                            <div class="stat-icon dib">
                                <i class="ti-user text-muted"></i>
                            </div>
                            <div class="stat-content">
                                <div class="text-left dib">
                                    <div class="stat-heading">Usuários</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-four">
                            <div class="stat-icon dib">
                                <i class="ti-stats-up text-muted"></i>
                            </div>
                            <div class="stat-content">
                                <div class="text-left dib">
                                    <div class="stat-heading">Vendas</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-four">
                            <div class="stat-icon dib">
                                <i class="ti-pulse text-muted"></i>
                            </div>
                            <div class="stat-content">
                                <div class="text-left dib">
                                    <div class="stat-heading">Regras</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>









            <div class="col-sm-12 mb-4">
                <div class="card-group">
                    <div class="card col-lg-2 col-md-6 no-padding bg-flat-color-1">
                        <div class="card-body">
                            <div class="h1 text-muted text-right mb-4">
                                <i class="fa fa-users text-light"></i>
                            </div>


                            <small class="text-uppercase font-weight-bold text-light">Visitantes</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                    <div class="card col-lg-2 col-md-6 no-padding no-shadow">
                        <div class="card-body bg-flat-color-2">
                            <div class="h1 text-muted text-right mb-4">
                                <i class="fa fa-user-plus text-light"></i>
                            </div>

                            <small class="text-uppercase font-weight-bold text-light">Novos Clientes</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                    <div class="card col-lg-2 col-md-6 no-padding no-shadow">
                        <div class="card-body bg-flat-color-3">
                            <div class="h1 text-right mb-4">
                                <i class="fa fa-cart-plus text-light"></i>
                            </div>

                            <small class="text-light text-uppercase font-weight-bold">Produtos</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                    <div class="card col-lg-2 col-md-6 no-padding no-shadow">
                        <div class="card-body bg-flat-color-5">
                            <div class="h1 text-right text-light mb-4">
                                <i class="fa fa-pie-chart"></i>
                            </div>

                            <small class="text-uppercase font-weight-bold text-light">Relatórios</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                    <div class="card col-lg-2 col-md-6 no-padding no-shadow">
                        <div class="card-body bg-flat-color-4">
                            <div class="h1 text-light text-right mb-4">
                                <i class="fa fa-clock-o"></i>
                            </div>

                            <small class="text-light text-uppercase font-weight-bold">Tempo de espera</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                    <div class="card col-lg-2 col-md-6 no-padding no-shadow">
                        <div class="card-body bg-flat-color-1">
                            <div class="h1 text-light text-right mb-4">
                                <i class="fa fa-comments-o"></i>
                            </div>

                            <small class="text-light text-uppercase font-weight-bold">Comunicação</small>
                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                        </div>
                    </div>
                </div>

            </div>








        </div><!-- .row -->
    </div><!-- .animated -->
</div><!-- .content -->




</div><!-- /#right-panel -->
<!--JAVA SCRIPT-->
<script> src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"</script>
<script>
    $("#func").click(function () {
        document.location.href = "CadastroFuncionario.jsp";
    })
</script>
<!-- Right Panel -->


<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>

<!--  Chart js -->
<script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="assets/js/widgets.js"></script>

</body>
</html>
