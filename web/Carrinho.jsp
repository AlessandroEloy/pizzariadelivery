<%-- 
    Document   : Carrinho
    Created on : 28/11/2017, 22:58:55
    Author     : alessandro
--%>
<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.modelo.ItemPedido"%>
<%@page import="com.pizzaria.modelo.Pedido"%>
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
	<SCRIPT Language="javascript">
        function funcao1()
        {
        alert('Pedido Cancelado');
        }
       </SCRIPT>
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
                        <h1>Realizar pedido</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Pizzaria Delivery</a></li>
                            <li class="active">Realizar Pedido</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

			
			
				<div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Table Head</strong>
                        </div>
                        <div class="card-body">
                            <table class="table">
                              <thead class="thead">
                                <tr>
                                  <th scope="col">Excluir</th>
                                  <th scope="col">Item</th>
                                  <th scope="col">Qtd</th>
                                  <th scope="col">Preço Unitário</th>
								  <th scope="col">Total Item</th>
								  <th scope="col">Adicionar</th>
                                </tr>
                              </thead>
							  <%
                //recupera os produtos do carrinho da sessao
                    Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                    for (ItemPedido item : carrinho.getItens()) {
                %>
                              <tbody>
                                <tr>
                                 <td><a
                            href="Servlet_Carrinho?acao=removeProduto&idProduto=<%=item.getProduto().getCod()%>">
                            <img src="imagem/close.png"  width="25px"> </td>
                    <td><%=item.getProduto().getNome()%></td>
                    <td><%=item.getQuantidade()%></td>
                    <td>R$ <%=item.getProduto().getValor()%></td>
                    <td>R$ <%=item.getProduto().getValor() * item.getQuantidade() %></td>
                    <td><a href="Servlet_Carrinho?acao=addProduto&idProduto=<%=item.getProduto().getCod()%>"> <img src="imagem/add.png"  width="25px"></a
                        ></td>
                                </tr>
								 <%
                    }
                %>
                              </tbody>
                            </table>
					 
                  <table class="table">
				 <td><p style="text-align:right;color:#272c33"><b>Valor Total: R$ <%=carrinho.CalcTotal() %></b></p></td>
             </table>
             
              <table class="table">
               <td bgcolor="#dc3545"><font color="white">Observação</font></td>
               <td> 
             <form action="Servlet_Carrinho?acao=finalizar" method="post">
             <textarea name="observacao" cols="50" rows="4">
                    
             </textarea><br/></td></table>
            <table class="table">
            <td cellpadding="50px" ><a href="Pedido.jsp" class="btn btn-danger"> Continue comprando</a></td>
            <td><a href="Servlet_Carrinho?acao=cancelaCompra" class="btn btn-danger" onclick="funcao1()">Cancelar compra</a> </td>
            
           <td> <input class="btn btn-danger" type="submit" value="Finalizar Pedido"> </td>
            </form></table>
                        </div>
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
