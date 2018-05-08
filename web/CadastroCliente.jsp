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

                        <td>
                            <label>RG:</label>
                        </td>
                        <td align="left">
                            <input type="text" name="rg" id="rg" placeholder="000000000" required> 
                        </td>

                        <tr>
                            <td>
                                <label>CPF:</label>
                            </td>
                            <td align="left">
                                <input type="text" name="cpf" id="cpf" placeholder="000.000.000-00" required> 
                                
                            </td>
                        </tr>  
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
                <!-- ENDEREÇO -->
                <!--<fieldset>
                    <legend>Dados de Endereço</legend>
                    <table cellspacing="10">

                        <tr>
                            <td>
                                <label for="rua">Rua:</label>
                            </td>
                            <td align="left">
                                <input type="text" name="rua" id="rua" placeholder="rua">
                            </td>
                        <tr>
                            <td>
                                <label for="bairro">Bairro: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="bairro" id="bairro" placeholder="bairro">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="numero">Número: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="numero" id="numero"  placeholder="00">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="estado">Estado:</label>
                            </td>
                            <td align="left">
                                <select name="estado" class="select_box"> 
                                    <option value="ac">São Paulo</option> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cidade">Cidade: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="cidade"  placeholder="cidade">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cep">CEP: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="cep"  placeholder="cep">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="referencia">Referencias: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="referencias"  placeholder="referencias">
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br /> 
</div> -->
               <!-- <input type="submit" value="CADASTRAR">  
                 <a href="#"> <input type="submit" onclick="window.location.href = 'MenuCliente.jsp'" value="VOLTAR" name="VOLTAR"> </a> <br/>-->

               <form action="Servlet_Cliente" method="post">
                   <input class="finalizar" type="submit" value="CADASTRAR">
               
            </form>
            </table>
        </div><!--/ container-->

    </body>
    <!-- End Page Content -->
</html>
