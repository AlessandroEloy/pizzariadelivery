<%-- 
   Document   : Login_index
   Created on : May 23, 2017, 9:31:41 PM
   Author     : Bruno nakamura
--%>

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
        <title>Login</title>

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
        <link rel="stylesheet" href="assets/scss/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

        <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

    </head>
    <body class="bg-warning">


        <div class="sufee-login d-flex align-content-center flex-wrap">
            <div class="container">
                <div class="login-content">
                    <div class="login-logo">

                        <img class="align-content" src="images/logo.png" alt="">

                    </div>
                    <div class="login-form">
                        <div class="typo-headers">
                            <h5 class="pb-2 display-5 text-center">LOGIN</h5>
                        </div>
                        <form action="Servlet_Login" method="post">
                            <div class="form-group">
                                <label>Usuário</label>
                                <input type="text" class="form-control" id="username" name="Login" required>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input type="password" class="form-control" id="password" name="Senha" required>
                            </div>
                            <div class="checkbox">



                            </div>
                            <button type="submit" class="btn btn-dark btn-flat m-b-30 m-t-30">Entrar</button>

                            <div class="register-link m-t-15 text-center">
                                <p>Não tem uma conta ? <a href="Cadastro_Usuario.jsp"> Cadastre-se</a></p>
                            </div>
                            <div class="alert alert-light" role="alert">
                                ${mensagem}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>


    </body>
</html>
