<%-- 
    Document   : listaPedidos.jsp
    Created on : 16/12/2017, 11:29:04
    Author     : alessandro
--%>

<%@page import="com.pizzaria.modelo.ItemPedido"%>
<%@page import="com.pizzaria.modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Lista de Pedidos</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form name="forml" action="Servlet_Listar_Pedidos" method="post"> 
                <br>
                <h3> LISTAR </h3>
                <fieldset>
                    <legend>Lista Pedidos</legend>
                    <table>
                        <tr>
                            <td>Codigo</td>
                            <td>Data</td>
                            <td>Nome</td>
                            <td>Produto</td>
                            <td>Quantidade</td>
                            <td>Valor Item</td>
                            <td>Valor Unitario</td>
                            <td>Valor Total</td>
                            <td>Observação</td>
                        </tr>
                        <% //recupera o objeto resultado

                            ArrayList<ItemPedido> listaPedidos = (ArrayList<ItemPedido>) request.getAttribute("listaPedidos");
                            for (ItemPedido itens : listaPedidos) {
                        %>  
                        <tr>
                            <td><%=itens.getCod()%></td> 
                            <td><%=itens.getPedido().getData()%></td>
                            <td><%=itens.getPedido().getCliente().getNome()%></td>
                            <td><%=itens.getProduto().getNome()%></td>
                            <td><%=itens.getQuantidade()%></td>
                            <td><%=itens.getValorItem()%></td>
                            <td><%=itens.getProduto().getValor()%></td>
                            <td><%=itens.getPedido().getValorTotal()%></td>
                            <td><%=itens.getPedido().getObservacao()%></td>

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
