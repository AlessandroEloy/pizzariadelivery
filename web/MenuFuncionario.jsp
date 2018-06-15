<%-- 
    Document   : MenuFuncionario
    Created on : May 22, 2017, 11:39:39 PM
    Author     : bruno nakamura
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
    <title>Painel Balconista</title>
   
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
                         <a href="MenuFuncionario.jsp"> <i class="menu-icon fa fa-dashboard"></i>Painel Balconista</a>
                    </li>
                    <h3 class="menu-title">Funções</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-shopping-cart"></i>Pedidos</a>
                        <ul class="sub-menu children dropdown-menu">
						 
                                <form name ="forml" action="Servlet_Listar_Pedidos_Func" method="post"> 
                                    <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Consultar Pedidos" id='funcionario' value="CONSULTAR PEDIDOS"></li>
                                </form> 
								
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users"></i>Clientes</a>
                        <ul class="sub-menu children dropdown-menu">
                            
                     
						   <form name ="forml" action="Servlet_Listar" method="post"> 
                                <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'AlterarDadosGF.jsp'" value="Consultar Clientes" id='funcionario'> </a></li>
                            </form>
						   
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cutlery"></i>Produtos</a>
                        <ul class="sub-menu children dropdown-menu">
                           
						   <li><input type="submit"  class="btn btn-danger btn-sm"  onclick="window.location.href = 'CadProdutosFunc.jsp'" value="Cadastrar Produto" id='funcionario'> </li><br>
                            <form name ="forml" action="Servlet_Listar_Produto" method="post"> 
                                <li><input type="submit"  class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Gerenciar Produtos" id='funcionario'>  </li>
                            </form>
	
							
                        </ul>
                    </li>
					 
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
                        <h1>Painel Balconista</h1>
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
                        <div class="social-box facebook">
                            <i class="fa fa-facebook"></i>
                            <ul>
                                <li>
                                    <sctrong><span class="count">3</span> k</strong>
                                    <span>Seguidores</span>
                                </li>
                                <li>
                                    <sctrong><span class="count">50</span></strong>
                                    <span>Posts</span>
                                </li>
                            </ul>
                        </div>
                        <!--/social-box-->
                    </div><!--/.col-->


                    <div class="col-lg-3 col-md-6">
                        <div class="social-box twitter">
                            <i class="fa fa-twitter"></i>
                            <ul>
                                <li>
                                    <sctrong><span class="count">500</span> k</strong>
                                    <span>Seguidores</span>
                                </li>
                                <li>
                                    <sctrong><span class="count">100</span></strong>
                                    <span>tweets</span>
                                </li>
                            </ul>
                        </div>
                        <!--/social-box-->
                    </div><!--/.col-->


                    <div class="col-lg-3 col-md-6">
                        <div class="social-box linkedin">
                            <i class="fa fa-linkedin"></i>
                            <ul>
                                <li>
                                    <sctrong><span class="count">1500</span> +</strong>
                                    <span>Contatos</span>
                                </li>
                                <li>
                                    <sctrong><span class="count">100</span></strong>
                                    <span>Posts</span>
                                </li>
                            </ul>
                        </div>
                        <!--/social-box-->
                    </div><!--/.col-->


                    <div class="col-lg-3 col-md-6">
                        <div class="social-box google-plus">
                            <i class="fa fa-google-plus"></i>
                            <ul>
                                <li>
                                    <sctrong><span class="count">894</span> k</strong>
                                    <span>Seguidores</span>
                                </li>
                                <li>
                                    <sctrong><span class="count">30</span></strong>
                                    <span>Posts</span>
                                </li>
                            </ul>
                        </div>
                        <!--/social-box-->
                    </div><!--/.col-->



               
                    </div>


                  





                </div><!-- .row -->
            </div><!-- .animated -->
        </div><!-- .content -->




    </div><!-- /#right-panel -->
 
        <!--JAVA SCRIPT-->
            <script> src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"</script>
            <script>
                $("#funcionario").click(function(){
                    document.location.href="CadastroCliente.jsp";
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
