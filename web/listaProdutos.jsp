<%-- 
    Document   : listaProdutos
    Created on : 23/10/2017, 20:57:43
    Author     : Alessandro
--%>

<%@page import="com.pizzaria.modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form name="forml" action="Servlet_Listar_Produto" method="get"> 
                <br>
                <h3> LISTA DE PRODUTOS</h3>
                <fieldset>
                    <legend>PRODUTOS</legend>
                    <table>
                        <tr>
                            <td>CATEGORIA</td>
                            <td>NOME</td>
                            <td>DESCRIÇÃO</td>
                            <td>VALOR</td>
                            <td>USUARIO</td>
                        </tr>
                        <% //recupera o objeto resultado
                            ArrayList<Produto> listaProdutos = (ArrayList<Produto>) request.getAttribute("listaProdutos");
                            for (Produto produto : listaProdutos) {
                        %>  
                        <tr>
                            <td><%=produto.getCategoria().getCategoria()%></td>
                            <td><%=produto.getNome()%></td>
                            <td><%=produto.getIngredientes()%></td>
                            <td><%=produto.getValor()%></td>
                            <td><%=produto.getUsuario().getLogin()%></td>
                            <td><a href="Servlet_Excluir_Prod?cod=<%=produto.getCod()%>"> X </a></td>
                            <td><a href="Servlet_Buscar_Prod?cod=<%=produto.getCod()%>"> Atualizar </a></td>
                        </tr>
                        <%}%>
                    </table> 
                </fieldset>
            </form>
            <center>
                <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR"> 
            </center>
        </div>                  
    </body>
</html>
