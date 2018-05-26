<%-- 
    Document   : CadastroCliente
    Created on : May 22, 2017, 11:39:08 PM
    Author     : bruno nakamura
--%>

<%@page import="com.pizzaria.modelo.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html>
    <head>
        <script src="jquery-3.2.1.min.js" type="text/javascript"></script>

        <script src="JS/valida_CPF.js" type="text/javascript"></script>

        <!-- Basics -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Cadastro de Cliente</title>

        <!-- CSS -->
        <link rel="stylesheet" href="styles_Cliente.css">

    </head>

    <!-- Main HTML -->
    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <!-- Begin Page Content -->
        <div id="container">

            <form action="Servlet_Cliente" method="post" onsubmit="return checkForm(this);">
                <h3> CADASTRO DO CLIENTE</h3>
                <fieldset>
                    <legend>Dados Pessoais</legend>
                    <table cellspacing="10">


                        <tr>
                            <td>
                                <label for="nome">Nome: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="nome" id="nome" placeholder="nome" required>
                            </td>

                        <tr>
                            <td>
                                <label>Sexo: </label>
                            </td>
                            <td align="left">
                                <input type="radio" name="sexo"  value="M" > Masculino
                                <input type="radio" name="sexo"  value="F" > Feminino
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>Nascimento: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="nascimento"  id="nascimento" placeholder="00/00/0000" required> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="telefone">Telefone: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="telefone" id="telefone" placeholder="0000-0000" required> 
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>CPF:</label>
                            </td>
                            <td align="left">
                                <input type="text" name="cpf" id="cpf" placeholder="000.000.000-00"> 
                            </td>
                        </tr>  

                        <td>
                            <label>RG:</label>
                        </td>
                        <td align="left">
                            <input type="text" name="rg" id="rg" placeholder="000000000" required> 
                        </td>


                        <%
                            Endereco end = (Endereco) request.getAttribute("endereco");
                        %>

                        <tr>
                            <td>
                                <input type="hidden" name="idendereco" value="<%= end.getId()%>">
                            </td>
                        </tr>

                    </table>


                    <br />

                    <form action="Servlet_Cliente" method="post">
                        <input class="finalizar" type="submit" value="CADASTRAR">
                    </form>
                    </table>
                    </div>
                    <!--/ container-->
                    </body>
                    <!-- End Page Content -->
                    </html>
