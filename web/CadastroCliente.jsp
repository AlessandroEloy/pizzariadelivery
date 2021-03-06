<%-- 
    Document   : CadastroCliente
    Created on : May 22, 2017, 11:39:08 PM
    Author     : bruno nakamura
--%>

<%@page import="com.pizzaria.modelo.Endereco"%>
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
	
	<script type="text/javascript" src="jquery.maskedinput-1.3.min.js"></script>
	
	<script src="JS/valida_CPF.js" type="text/javascript"></script>
	<script src="JS/jquery-3.2.1.min.js"></script>
    <script src="JS/exibePedido.js"></script>
    <script src="JS/bootstrap.min.js"></script>
	<script>
		jQuery(function($){
		$("#nascimento").mask("99/99/9999");
		$("#telefone").mask("(99) 9999-9999");
		$("#cpf").mask("999.999.999-99");
		$("#rg").mask("99.999.999-9");
		});
	</script>
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
                            
                            <li class="active">Cadastrar dados</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Cadastrar dados</strong>
                        </div>
                        <div class="card-body">
                  <div class="card-body card-block">
				  
					    <form action="Servlet_Cliente" method="post" onsubmit="return checkForm(this);">
						
						
					  
                          <div class="row form-group">
                            <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Nome</label></div>
                            <div class="col-12 col-md-9">  <input type="text" name="nome" id="nome" placeholder="nome"  class="form-control" required></div>
                          </div>
						  
                       
		
						  
						   <div class="row form-group">
                            <div class="col col-md-2"><label class=" form-control-label">Sexo</label></div>
                            <div class="col col-md-9">
                              <div class="form-check">
                                <div class="radio">
                                  <label for="radio1" class="form-check-label ">
                                    <input type="radio" id="radio1" name="sexo"  value="M" class="form-check-input">Masculino
                                  </label>
                                </div>
                                <div class="radio">
                                  <label for="radio2" class="form-check-label ">
                                    <input type="radio" id="radio2" name="sexo"  value="F" class="form-check-input">Feminino
                                  </label>
                                </div>
                               
                              </div>
                            </div>
							</div>
						  
						  
						    <div class="row form-group">
                            <div class="col col-md-2"><label for="hf-nascimento" class=" form-control-label">Nascimento</label></div>
                            <div class="col-12 col-md-9"><input type="text" name="nascimento"  id="nascimento" placeholder="00/00/0000" class="form-control" required></div>
                          </div>
						  
						   <div class="row form-group">
                            <div class="col col-md-2"><label for="hf-telefone" class=" form-control-label">Telefone</label></div>
                            <div class="col-12 col-md-9">  <input type="text" name="telefone" id="telefone" placeholder="(00) 0000-0000" class="form-control" required></div>
                          </div>
						  
						  <div class="row form-group">
                            <div class="col col-md-2"><label for="hf-cpf" class=" form-control-label">CPF</label></div>
                            <div class="col-12 col-md-9"> <input type="text" name="cpf" id="cpf" placeholder="000.000.000-00" class="form-control"></div>
                          </div>
						  
						   <div class="row form-group">
                            <div class="col col-md-2"><label for="hf-rg" class=" form-control-label">RG</label></div>
                            <div class="col-12 col-md-9"> <input type="text" name="rg" id="rg" placeholder="000000000" class="form-control" required></div>
                          </div>
						  <%
                            Endereco end = (Endereco) request.getAttribute("endereco");
						  %>
						   <input type="hidden" name="idendereco" value="<%= end.getId()%>">
						  
						 </div></div>
				
                    <div class="card">
                    
                      <div class="card-footer">
                        <button type="submit" class="btn btn-danger btn-sm">
                          <i class="fa fa-dot-circle-o"></i> Cadastrar
                        </button>
                        <button type="reset" class="btn btn-dark btn-sm">
                          <i class="fa fa-ban"></i> Limpar
                        </button>
                      </div>
                    </div>
                

				
				
				 </form>

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
