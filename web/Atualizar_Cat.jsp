<%-- 
    Document   : Atualiazar_Cat.jsp
    Created on : 16/12/2017, 09:02:46
    Author     : alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>
<!DOCTYPE html>
<html>

    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Atualizar Categoria</title>



        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">


    </head>
    <body>


        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container"> 

            <form method="post" action="Servlet_Buscar_Func"> 
                <tr> 
                    <td>
                        <label for="cod">Digite o CODIGO do cadastro que deseja atualizar:</label>
                        <input type="text" name="cod" required>
                        <input type="submit" value="BUSCAR"></td>
                <div id="msg">
                    ${mensagem} 
                </div>


            </form>

            <table>

                <form action="Servlet_Atualizar_Categoria" method="post"> 

                    <tr>
                    <tr>
                        <td> 
                            <input type="hidden" name="cod" value="${categoria.getCod()}"></td>

                    <tr>
                        <td> 
                            <label for="categoria">Categoria: </label> 
                            <input type="text" name="categoria" value="${categoria.getCategoria()}">
                        </td>
                    <tr>
                        <td> 
                            <input type="submit" value="ATUALIZAR">
                            <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR">
                        </td>

                </form>

            </table>

        </div>
    </body>
</html>
