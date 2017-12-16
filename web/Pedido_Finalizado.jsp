<%-- 
    Document   : Pedido_Finalizado.jsp
    Created on : 12/12/2017, 18:54:30
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

        <title>Pedido Finalizado Com sucesso</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_ConsultarCliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">
            <h2> 
                <center>
                    <%
                        //recupera os produtos do carrinho da sessao
                        Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                        out.print("Pedido Nº "+ carrinho.getCod() +"<br>"+" Realizado com Sucesso!"+ "<br>"+ "Valor Total" + carrinho.CalcTotal());
                    %>
                </center>                   
            </h2>   
                <center>
                    <input type="submit" onclick="window.location.href = 'MenuCliente.jsp'" value="VOLTAR" name="VOLTAR">  <br/> 
                </center>
        </div>
                
    </body>
</html>
