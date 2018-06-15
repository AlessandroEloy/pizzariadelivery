<%-- 
    Document   : Pedido
    Created on : 18/11/2017, 14:27:18
    Author     : alessandro
--%>
<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.modelo.Produto"%>
<%@page import="com.pizzaria.controle.Servlet_Login"%>
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
                        <h1><%
                            Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                            out.print("Seja muito bem-vindo! " + usuarioLog.getLogin());
                        %></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Pizzaria Delivery</a></li>
                            <li class="active"><%out.print(usuarioLog.getLogin());%></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

			 <div class="content mt-12">
            <div class="animated fadeIn">


                <div class="row">
                  <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Cardápio</strong>
                        </div>
                        <div class="card-body">
						 <%
						// Recupera os produtos.
						java.util.List<Produto> produtos = (java.util.List<Produto>) request.getAttribute("produtos");
						if (produtos == null) {
						request.getRequestDispatcher("Servlet_Pedido?acao=listaPedido").forward(request,
                            response);
							}
						%>
							
                    <table align="center">
                <%
                    int contadorColuna = 1;
                    for (Produto produto : produtos) {
                        //se é o primeiro produto, cria o inicio da linha
                        if (contadorColuna == 1) {
                            out.println("<tr>");
                        }
                %> 
                <tr align="center">  <div class="col-md-3"><img src="imagem/icon5.png" class="img" > 

                    <h5  style= "text-transform: uppercase; "> <%=produto.getNome()%></h5>
                   
				   R$ <%=produto.getValor()%>
                   
					
					
					<p class="card-text"><b>Ingredientes: </b><%=produto.getIngredientes()%> </p>
					
					<form action="Servlet_Carrinho?acao=addProduto&idProduto=<%=produto.getCod()%>" method="post">
                        
						<input type="submit" class="btn btn-danger" value="Comprar"></input></form>
						

                    <script>
                        $(document).ready(function () {
                                $('[data-toggle="tooltip"]').tooltip();
                        });
                    </script>
                    

                    <%
                            //se é o último produto, exibir o término da linha
                            if (contadorColuna == 3) {
                                out.println("</tr>");
                                contadorColuna = 0;
                            }
                            //atualiza o contador de colulas
                            contadorColuna++;
                        }//fim do for
%></div>
            </table>
				   
				   
				   
				   
				   
				   
				</div>
			</div>
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
