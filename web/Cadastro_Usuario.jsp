<%-- 
    Document   : Cadastro_Usuario
    Created on : 23/08/2017, 20:50:53
    Author     : Alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Cadastro de Cliente</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_cadastre-se.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form action="Servlet_Usuario" method="post" onsubmit="return checkForm(this);"> 

                <h3> CADASTRO</h3>
                <!-- DADOS DE LOGIN -->
                <fieldset>
                    <legend>Dados de Login</legend>
                    <table cellspacing="10">

                        <tr>
                            <td>
                                <label for="login">Login de usuário: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="login" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="senha">Senha: </label>
                            </td>
                            <td align="left">
                                <input type="password" name="senha" required>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label for="passconfirm">Confirme a senha: </label>
                            </td>
                            <td align="left">
                                <input type="password" name="passconfirm" required>
                            </td>
                        </tr> 

                    </table> <input type="submit" value="CADASTRAR">
                </fieldset> 

                <br />


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

        </div><!--/ container-->

    </body>
    <!-- End Page Content -->
</html>
