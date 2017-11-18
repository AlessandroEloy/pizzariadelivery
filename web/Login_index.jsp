<%-- 
   Document   : Login_index
   Created on : May 23, 2017, 9:31:41 PM
   Author     : Bruno nakamura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>
<!Doctype html>
<html>
    <head>

        <!-- Basics -->

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Login</title>

        <!-- CSS -->


        <link rel="stylesheet" href="styles.css">

    </head>

    <!-- Main HTML -->

    <body>
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form action="Servlet_Login" method="post">

                <label for="username">Usuário:</label>

                <input type="text" id="username" name="Login" required>

                <label for="password">Senha:</label>

                <input type="password" id="password" name="Senha" required>

                <p><a href="#">Esqueceu sua senha?</a></p> <br/>

                <p><a href="Cadastro_Usuario.jsp">Cadastre-se</a></p> 

                <div id="lower">

                    <label> ${mensagem} </label>

                    <input type="submit" value="LOGIN">
                </div><!--/ lower-->
            </form>
        </div><!--/ container-->
        <!-- End Page Content -->
    </body>
</html>
