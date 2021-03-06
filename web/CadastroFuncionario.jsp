<%-- 
    Document   : CadastroFuncionario
    Created on : May 22, 2017, 11:39:08 PM
    Author     : bruno nakamura
--%>

<%@page import="com.pizzaria.modelo.Perfil"%>
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

        <script src="assets/js/mask.js"></script>
        <script src="assets/js/jquery.mask.min.js"></script>
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

                                <li class="active">Cadastrar Funcionário</li>
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
                                    <strong class="card-title">Cadastrar Funcionário</strong>
                                </div>
                                <div class="card-body">
                                    <div class="card-body card-block">

                                        <form action="Servlet_Func" method="post" onsubmit="return checkForm(this);">

                                            <div class="row form-group">
                                                <div class="col col-md-2"><label for="select" class=" form-control-label">Função</label></div>
                                                <div class="col-12 col-md-9">
                                                    <select name="funcao" id="funcao"  class="form-control">
                                                        <option value=""></option>
                                                        <% // //recupera o objeto resultado

                                                            ArrayList<Perfil> listaperfil = (ArrayList<Perfil>) request.getAttribute("listaPerfil");
                                                            for (Perfil perfil : listaperfil) {
                                                        %>  
                                                        <option value="<%=perfil.getId() %>"> <%=perfil.getNivel_acesso().toString() %> </option>
                                                        <%}%>
                                                    </select> 
                                                  
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Nome</label></div>
                                                <div class="col-12 col-md-9"><input type="text" name="nome" id="nome"  size="100" maxlength="100" class="form-control" required></div>
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


                                                <div class="row form-group">
                                                    <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Nascimento</label></div>
                                                    <div class="col-12 col-md-9"><input type="text" name="nascimento"  id="nascimento"   size="100" maxlength="100" class="form-control" required></div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Telefone</label></div>
                                                    <div class="col-12 col-md-9"><input type="text"  name="telefone" id="telefone"  size="100" maxlength="100" class="form-control" required></div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">RG</label></div>
                                                    <div class="col-12 col-md-9"><input type="text"  name="rg" id="rg" size="100" maxlength="100" class="form-control" required></div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">CPF</label></div>
                                                    <div class="col-12 col-md-9"><input type="text"  name="cpf" id="cpf" size="100" maxlength="100" class="form-control" required></div>
                                                </div>

                                            </div></div>

                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Cadastrar Login</strong>
                                        </div>
                                        <div class="card-body">		 


                                            <div class="row form-group">
                                                <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Usuário</label></div>
                                                <div class="col-12 col-md-9"><input type="text"  name="login" size="100" maxlength="100" class="form-control" required></div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Senha</label></div>
                                                <div class="col-12 col-md-9"><input type="password" name="senha" size="100" maxlength="100" class="form-control" required></div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-2"><label for="hf-nome" class=" form-control-label">Confirme a senha</label></div>
                                                <div class="col-12 col-md-9"><input type="password" name="passconfirm" size="100" maxlength="100" class="form-control" required></div>
                                            </div>


                                        </div>


                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="fa fa-dot-circle-o"></i> Cadastrar
                                            </button>
                                            <button type="reset" class="btn btn-dark btn-sm">
                                                <i class="fa fa-ban"></i> Limpar
                                            </button>
                                        </div>
                                        <div style="color:red; font-size: x-large"><p>${mensagem}</p></div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                function checkForm(form)
                                {
                                    if (form.login.value == "") {
                                        alert("Erro: O nome do usuario deve ser preenchido!");
                                        form.login.focus();
                                        return false;
                                    }

                                    if (form.senha.value != "" && form.senha.value == form.passconfirm.value) {
                                        if (form.senha.value.length < 8) {
                                            alert("Erro: Sua Senha Deve ser maior que 8 caracteres!");
                                            form.senha.focus();
                                            return false;
                                        }
                                        if (form.senha.value == form.login.value) {
                                            alert("Erro: Sua senha deve ser diferente que o login!");
                                            form.senha.focus();
                                            return false;
                                        }

                                        re = /[^\+&¨%$#@!*?]/;
                                        if (!re.test(form.senha.value)) {
                                            alert("Erro: Sua senha deve conter caracteres especiais (^\+&¨%$#@!*?)!");
                                            form.senha.focus();
                                            return false;
                                        }
                                        re = /[0-9]/;
                                        if (!re.test(form.senha.value)) {
                                            alert("Erro: Sua senha deve conter numeros (0-9)!");
                                            form.senha.focus();
                                            return false;
                                        }
                                        re = /[a-z]/;
                                        if (!re.test(form.senha.value)) {
                                            alert("Erro: Sua senha deve conter letras minusculas (a-z)!");
                                            form.senha.focus();
                                            return false;
                                        }
                                        re = /[A-Z]/;
                                        if (!re.test(form.senha.value)) {
                                            alert("Erro: sua senha deve conter letras maisculas (A-Z)!");
                                            form.senha.focus();
                                            return false;
                                        }
                                    } else {
                                        alert("Erro: Por Favor digite sua senha de novo no confirme a senha!");
                                        form.senha.focus();
                                        return false;
                                    }
                                }
                            </script>

                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#bootstrap-data-table-export').DataTable();
                                });
                            </script>


                            </body>
                            </html>
