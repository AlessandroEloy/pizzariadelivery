<%-- 
    Document   : Cadastro_Usuario
    Created on : 23/08/2017, 20:50:53
    Author     : Carol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cadastro de usuário</title>
   
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
						<h5 class="pb-2 display-5 text-center">CADASTRAR USUÁRIO</h5>
					</div>
			
			
                    <form action="Servlet_Usuario" method="post" onsubmit="return checkForm(this);"> 
                        <div class="form-group">
                            <label>Usuário</label>
                            <input type="text" name="login" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Senha</label>
                            <input type="password" name="senha"  class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Confirme a senha</label>
                            <input type="password" name="passconfirm"  class="form-control" required>
                        </div>
                       
                        <button type="submit" class="btn btn-dark btn-flat m-b-30 m-t-30">Cadastrar</button>
                       
                        <div class="register-link m-t-15 text-center">
                            <p>Já possui uma conta? <a href="Login_index.jsp"> Entre</a></p>
                        </div>
						<!--JAVA SCRIPT -->
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

                            re = /[^@#-.&*_!+$]/;
                            if (!re.test(form.senha.value)) {
                                alert("Erro: Sua senha deve conter caracteres especiais (^@#-._!+$)!");
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
                    } //Fecha Function
                </script>
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
