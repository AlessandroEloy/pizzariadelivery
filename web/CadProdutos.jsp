<%-- 
    Document   : CadProdutos
    Created on : Oct 2, 2017, 7:16:37 PM
    Author     : bruno nakamura
--%>
<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.controle.Servlet_Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="jquery-3.2.1.min.js"></script>        
        <title>Cadastro de Produtos</title>

        <link rel="stylesheet" href="styles_Produto.css">

    </head>

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form action="Servlet_Produtos" method="post" onsubmit="return checkForm(this);"> 
                <h4> <center> 
                        <%
                            Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                            out.print("Seja bem vindo! " + usuarioLog.getLogin());
                        %>
                </h4></center>
                <h3> CADASTRO DE PRODUTOS</h3>
                <fieldset>
                    <legend>Dados dos Produtos</legend>
                    <table cellspacing="10">
                        <tr>
                            <td>
                                <label for="categoria">Categoria:</label>
                            </td>
                            <td align="left">
                                <select name="categoria" id="categoria" class="select_box" > 
                                    <option value=""></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nome">Nome: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="nome" id="nome" placeholder="nome" required>
                            </td>

                        <tr>                


                        <tr>
                            <td>
                                <label for="ingredientes">Descrição: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="ingredientes" id="ingredientes" placeholder="Descrição" required>
                            </td>

                        <tr>
                            <td>
                                <label for="valor">Valor: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="valor" id="valor" placeholder="$0,00" required>
                            </td>
                            <td align="left">
                                <input type="hidden" name="id" id="id" value="<%=usuarioLog.getId()%>" >

                            </td>
                    </table>
                    <div style="color:red; font-size: x-large"><p>${mensagem}</p></div>

                    <input type="submit" value="CADASTRAR"> 
                    <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR">
                </fieldset>
            </form>
        </div><!--/ container-->            
        <script>
            $(document).ready(function () {
                $.get("Servlet_Produtos", function (responsejson) {
                    console.log(responsejson);
                    var $select = $("#categoria");
                    $select.find("option").remove();
                    $.each(responsejson, function (index, value) {
                        $("<option value='" + value.cod + "'>").appendTo($("#categoria"))
                                .text(value.categoria);
                    });
                });
            });
        </script>
    </body>
</html>
