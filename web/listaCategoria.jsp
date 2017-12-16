<%-- 
    Document   : listaCategoriajsp
    Created on : 15/12/2017, 19:56:00
    Author     : alessandro
--%>

<%@page import="com.pizzaria.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Lista de categoria</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form name="forml" action="Servlet_Listar_Cat" method="get"> 
                <br>
                <h3> CATEGORIA</h3>
                <fieldset>
                    <legend>Dados Pessoais</legend>
                    <table>
                        <tr>
                            <td>CATEGORIA</td>

                        </tr>
                        <% //recupera o objeto resultado
                            ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria");
                            for (Categoria cat : listaCategoria) {
                        %>  
                        <tr>
                            <td><%=cat.getCategoria()%></td>
                            <td><%=cat.isDisponivel()%></td>
                            
                            <td><a href="Servlet_Excluir_Categoria?cod=<%=cat.getCod()%>"> X </a></td>
                            <td><a href="Servlet_Buscar_Categoria?cod=<%=cat.getCod()%>">atualizar</a></td> 
                        </tr>
                        <%}%>
                    </table> 
                    <input type="submit" onclick="window.location.href = 'MenuGarente.jsp'" value="VOLTAR" name="VOLTAR">
                </fieldset>
            </form>
        </div>           
    </body>
</html>
