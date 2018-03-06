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

        <link rel="stylesheet" href="pedido_tab.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">




            <%
                // Recupera os produtos.
                java.util.List<Produto> produtos = (java.util.List<Produto>) request.getAttribute("produtos");
                if (produtos == null) {
                    request.getRequestDispatcher("Servlet_Pedido?acao=listaPedido").forward(request,
                            response);
                }
            %>
            <h1>CARDÁPIO</h1>
            <table border="1" cellspacing="10px" cellpadding="30px" align="center">
                <%
                    int contadorColuna = 1;
                    for (Produto produto : produtos) {
                        //se é o primeiro produto, cria o inicio da linha
                        if (contadorColuna == 1) {
                            out.println("<tr>");
                        }
                %>
                <td align="center"> <img src="imagem/icon5.png" class="imglogo" alt="Imagem do produto<%=produto.getNome()%>"/> 

                    <h3> <%=produto.getNome()%></h3>
                    R$ <%=produto.getValor()%>
                    <form action="Servlet_Carrinho?acao=addProduto&idProduto=<%=produto.getCod()%>" method="post">
                        <input type="submit" value="Comprar"></input></form>


                    <script>
                        $(document).ready(function () {
                                $('[data-toggle="tooltip"]').tooltip();
                        });
                    </script>
                    <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="<%=produto.getIngredientes()%>">
                        Ingredientes
                    </button>

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
            <center>
                <input type="submit" onclick="window.location.href = 'MenuCliente.jsp'" value="VOLTAR" name="VOLTAR">
            </center>
        </div>
    </body>
</html>
