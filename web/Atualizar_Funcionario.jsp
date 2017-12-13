<%-- 
    Document   : Atualizar_Funcionario
    Created on : 08/06/2017, 00:55:44
    Author     : Alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                <form method="post" action="Servlet_Buscar_Func"> 
                    <tr> 
                        <td>
                            <label for="id">Digite o ID do cadastro que deseja atualizar:</label>
                            <input type="text" name="id" required>
                            <input type="submit" value="BUSCAR"></td>
                    <div id="msg">
                        ${mensagem} 
                    </div>


                </form>

                <form action="Servlet_Atualizar_Func" method="post"> 

                    <tr>
                    <tr>
                        <td> 
                            <input type="hidden" name="id" value="${funcionario.getId()}">
                        </td>

                    <tr>
                        <td> 
                            <label for="funcao">Função: </label> 
                            <input type="text" name="funcao" value="${funcionario.getFuncao()}">
                        </td>
                    <tr>
                        <td> 
                            <label for="funcao">Nome: </label> 
                            <input type="text" name="nome" value="${funcionario.getNome()}">
                        </td>
                    <tr>
                        <td>
                            <label for="sexo">Sexo: </label>
                            <input type="text" name="sexo" value="${funcionario.getSexo()}">
                        </td>
                    <tr>
                        <td>
                            <label for="nascimento">Nascimento: </label> 
                            <input type="text" name="nascimento" value="${funcionario.getNascimento()}">
                        </td>
                    <tr>
                        <td> 
                            <label for="nascimento">Telefone: </label>
                            <input type="text" name="telefone" value="${funcionario.getTelefone()}">
                        </td>
                    <tr>
                        <td>
                            <label for="nascimento">RG: </label> 
                            <input type="text" name="rg" value="${funcionario.getRg()}">
                        </td>
                    <tr>
                        <td> 
                            <label for="nascimento">CPF: </label>
                            <input type="text" name="cpf" value="${funcionario.getCpf()}">
                        </td>
                    <tr> <td> <input type="submit" value="ATUALIZAR"></td></table>
                              <input type="submit" onclick="window.location.href = 'MenuFuncionario.jsp'" value="VOLTAR" name="VOLTAR">
                </form>
        </div>
    </body>
</html>

