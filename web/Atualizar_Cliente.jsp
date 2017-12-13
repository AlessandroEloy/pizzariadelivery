<%-- 
    Document   : Atualizar_Cliente
    Created on : 07/06/2017, 20:41:25
    Author     : Alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Atualizar Cliente</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_atualizar.css">

    </head>

    <!-- Main HTML -->

    <body>
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">
            <form action="Servlet_Atualizar" method="post">
                <table>


                    <h3> ATUALIZAÇÃO DE DADOS</h3> 
                  
                                        <legend>Dados Pessoais</legend>
                                        <table cellspacing="10"> 
                    <tr>
                        <td>
                            <input type="hidden" name="id" value="${cliente.getId()}">
                        </td>
                    </tr>

                    <tr>
                        <td> 
                            <label for="funcao">Nome: </label> 
                            <input type="text" name="nome" value="${cliente.getNome()}">
                        </td>
                    </tr>
                    <tr>
                        <td> 
                            <label for="funcao">Sexo: </label> 
                            <input type="text" name="sexo" value="${cliente.getSexo()}">
                        </td>
                    </tr>    
                    <tr>
                        <td> 
                            <label for="funcao">Nascimento: </label> 
                            <input type="text" name="nascimento" value="${cliente.getNascimento()}">
                        </td>
                    </tr>    
                    <tr>
                        <td>
                            <label for="funcao">Telefone: </label>
                            <input type="text" name="telefone" value="${cliente.getTelefone()}">
                        </td>
                    </tr>    
                    <tr>
                        <td>
                            <label for="funcao">RG: </label>
                            <input type="text" name="rg" value="${cliente.getRg()}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="funcao">CPF: </label>
                            <input type="text" name="cpf" value="${cliente.getCpf()}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="ATUALIZAR">
                            <input type="submit" onclick="window.location.href = 'MenuCliente.jsp'" value="VOLTAR" name="VOLTAR">
                        </td>
                    </tr>
                    </table>
                </table>
            </form>
        </div>       
    </body>
</html>