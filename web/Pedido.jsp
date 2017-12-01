<%-- 
    Document   : Pedido
    Created on : 18/11/2017, 14:27:18
    Author     : alessandro
--%>

<%@page import="com.pizzaria.modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Pedidos</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_ConsultarCliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">


            <h3> Item Pedidos</h3>

            <%
                // Recupera os produtos.
                java.util.List<Produto> produtos = (java.util.List<Produto>) request.getAttribute("listaProdutos");
                if (produtos == null) {
                    request.getRequestDispatcher("Servet_Pedido?acao=listaPedido").forward(request,
                            response);
                }
            %>
            <h1>Lista de Produtos</h1>
            <table border="0" cellpadding="5" align="center">
                <%
                    int contadorColuna = 1;
                    for (Produto produto : produtos) {
                        //se é o primeiro produto, cria o inicio da linha
                        if (contadorColuna == 1) {
                            out.println("<tr>");
                        }
                %>
                <td align="center" valign="bottom"> <img src="imagens/<%=produto.getNome()%>"
                                                         alt="Imagem do produto<%=produto.getNome()%>"/> <br/>
                    <%=produto.getNome()%><br/>
                    <a href="Servlet_Carrinho?acao=addProduto&idProduto=<%=produto.getCod()%>">
                        Comprar</a></td>
                        <%
                                //se é o último produto, exibir o término da linha
                                if (contadorColuna == 3) {
                                    out.println("</tr>");
                                    contadorColuna = 0;
                                }
                                //atualiza o contador de colulas
                                contadorColuna++;
                            }//fim do for
%>
            </table>
        </div>
    </body>
</html>
