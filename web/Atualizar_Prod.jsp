<%-- 
    Document   : Atualizar_Prod
    Created on : 18/11/2017, 17:04:02
    Author     : alessandro
--%>

%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>
<!DOCTYPE html>
<html>

    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Atualizar Funcionario</title>



        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">


    </head>
    <body>


        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container"> 

            <table>

                <form method="post" action="Servlet_Buscar_Prod"> 
                    <tr> 
                        <td>
                            <label for="cod">Digite o ID do cadastro que deseja atualizar:</label>
                            <input type="text" name="cod" required>
                            <input type="submit" value="BUSCAR"></td>
                    <div id="msg">
                        ${mensagem} 
                    </div>

                </form>

                <form action="Servlet_Atualizar_Prod" method="post"> 

                    <tr>
                    <tr>
                        <td> 
                            <input type="hidden" name="cod" value="${produto.getCod()}"></td>

                    <tr>
                        <td> 
                            <label for="categoria">Categoria: </label> 
                            <input type="text" name="codcat" value="${produto.getCategoria().getCategoria()}"disabled>
                        </td>
                    <tr>
                        <td>
                            <label for="nome">Nome: </label>
                            <input type="text" name="nome" value="${produto.getNome()}">
                        </td>
                    <tr>
                        <td>
                            <label for="ingretientes">Descrição: </label> 
                            <input type="text" name="ingredientes" value="${produto.getIngredientes()}">
                        </td>
                    <tr>
                        <td> 
                            <label for="valor">Valor: </label>
                            <input type="text" name="valor" value="${produto.getValor()}">
                        </td>
                    <tr>
                        <td>
                            <label for="funcionario">Funcionario: </label> 
                            <input type="text" name="funcionario" value="${produto.getFuncionario().getNome()}"disabled>
                        </td>
                    <tr>

                    <tr> 
                        <td> 
                            <input type="submit" value="ATUALIZAR">
                            <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR">
                        </td>
                        </table>

                </form>
        </div>
    </body>
</html>

