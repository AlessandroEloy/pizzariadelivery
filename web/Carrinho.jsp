<%-- 
    Document   : Carrinho
    Created on : 28/11/2017, 22:58:55
    Author     : alessandro
--%>

<%@page import="com.pizzaria.modelo.ItemPedido"%>
<%@page import="com.pizzaria.modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Carrinho De Pedido</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_ConsultarCliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">


            <h3> Carrinho De Pedido</h3>

            <table border="1" cellpadding="2" >
                <tr>
                    <td bgcolor="#000088"><font color="white">Excluir</font></td>
                    <td bgcolor="#000088"><font color="white">Item</font></td>
                    <td bgcolor="#000088"><font color="white">QTD</font></td>
                    <td bgcolor="#000088"><font color="white">Preço Unitário</font></td>
                    <td bgcolor="#000088"><font color="white">Total Item</font></td>
                    <td bgcolor="#000088"><font color="white">+1</font></td>
                </tr>
                <%
                //recupera os produtos do carrinho da sessao
                    Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                    for (ItemPedido item : carrinho.getItens()) {
                %>
                <tr>
                    <td><a
                            href="Servlert_Carrinho?acao=removeProduto&idProduto=<%=item.getProduto().getCod()%>">
                            X</td>
                    <td><%=item.getProduto().getNome()%></td>
                    <td><%=item.getQuantidade()%></td>
                    <td><%=item.getProduto().getValor()%></td>
                    <td><%=item.getValorItem()%></td>
                    <td><a
                            href="Servlet_Carrinho?acao=addProduto&idProduto=<%=item.getProduto().getCod()%>">+</a
                        ></td>
                </tr>
                <%
                    }
                %>
            </table>
                <strong>Valor Total: <%=carrinho.CalcTotal(itens)%></strong><br/>
            <a href="index.jsp"> Continue comprando</a><br/>
            <a href="ControleCarrinho?acao=cancelaCompra">Cancelar comprar</a>

    </body>
</html>
