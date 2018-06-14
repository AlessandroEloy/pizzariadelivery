<%-- 
    Document   : listaFuncionario
    Created on : 08/06/2017, 01:05:43
    Author     : Carol
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.pizzaria.modelo.Funcionario"%>
<%@page import="com.pizzaria.DAO.Funcionario_DAO"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                        <a href="MenuGerente.jsp"> <i class="menu-icon fa fa-dashboard"></i>Painel Gerente</a>
                    </li>
                    <h3 class="menu-title">Funções</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-shopping-cart"></i>Pedidos</a>
                        <ul class="sub-menu children dropdown-menu">
						 
                                <form name ="forml" action="Servlet_Listar_Pedidos" method="post"> 
                                    <li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'LISTAR'" value="Consultar Pedidos" id='func' value="CONSULTAR PEDIDOS"></li>
                                </form>
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
							<li><input type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'CadastroFuncionario.jsp'" value="Cadastrar" id='func'></li>
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
                    <a id="menuToggle" class="menutoggle pull-left bg-danger"><i class="fa fa fa-tasks"></i></a>
                    
                </div> 

                              
 
                <div class="col-sm-5">
                    <div class="user-area dropdown float-right"> <button type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'Login_index.jsp'">Sair</button>
                        <button type="submit" class="btn btn-danger btn-sm" onclick="window.location.href = 'MenuGerente.jsp'">Voltar</button></p>
                        
								
                        
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
                            
                            <li class="active">Gerenciar Funcionários</li>
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
                            <strong class="card-title">Lista de Funcionários</strong>
                        </div>
                        <div class="card-body">
                  <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <thead>
                      <tr>
						<th>Função</th>
                        <th>Nome</th>
                        <th>Sexo</th>
                        <th>Nascimento</th>
                        <th>Telefone</th>
						<th>RG</th>
						<th>CPF</th>
						<th>Excluir</th>
						<th>Atualizar</th>
                      </tr>
                    </thead>
					
                    <tbody>
					 <% //recupera o objeto resultado
                            ArrayList<Funcionario> listaFuncionario = (ArrayList<Funcionario>) request.getAttribute("listaFuncionario");
                            for (Funcionario funcionario : listaFuncionario) {
                        %>  
                      <tr>
                            <td><%=funcionario.getFuncao()%></td>
                            <td><%=funcionario.getNome()%></td>
                            <td><%=funcionario.getSexo()%></td>
                            <td><%=funcionario.getNascimento()%></td>
                            <td><%=funcionario.getTelefone()%></td>
                            <td><%=funcionario.getRg()%></td>
                            <td><%=funcionario.getCpf()%></td>
                            <td><a href="Servlet_Excluir_Func?id=<%=funcionario.getId()%>"> X </a></td>
                            <td><a href="Servlet_Buscar_Func?id=<%=funcionario.getId()%>"> Atualizar </a></td>
                        </tr>
                        <%}%>
                      
                     
                    </tbody>
                  </table>
                        </div>
                    </div>
                </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

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
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>


</body>
</html>
