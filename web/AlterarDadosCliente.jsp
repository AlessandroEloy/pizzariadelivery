<%-- 
    Document   : AlterarDadosCliente
    Created on : Jun 1, 2017, 1:03:31 AM
    Author     : bruno nakamura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>AlterarDados</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_ConsultarCliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">


            <h3> CONSULTAR DADOS DO CLIENTE</h3>

            <form name="form1" action="Servlet_Listar" method="post">

                <input type="submit" value="LISTAR" name="LISTAR">

            </form>
            <form name="form1" action="Atualizar_Cliente.jsp" method="post">

                <input type="submit" value="ATUALIZAR" name="atualizar">

            </form>
            <form name="form1" action="Excluir_Cliente.jsp" method="post">

                <input type="submit" value="EXCLUIR" name="excluir">          
            </form>

           <label> ${mensagem} </label>

        </div><!--/ container-->


    </body>
</html>
