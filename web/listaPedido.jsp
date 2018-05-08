<%-- 
    Document   : listapedido.jsp
    Created on : 16/12/2017, 17:44:11
    Author     : alessandro
--%>

<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.modelo.Pedido"%>
<%@page import="com.pizzaria.modelo.ItemPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="JS/exibePedido.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <!-- Basics -->

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Lista de Pedidos</title>

    <!-- CSS -->

    <link rel="stylesheet" href="styles_Cliente.css">
    <link rel="stylesheet" href="bootstrap.min.css">

</head>

<!-- Main HTML -->

<body> 
    <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
    <!-- Begin Page Content -->

    <div id="container">

        <%
            Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
        %>

        <form name="forml" action="Servlet_Listar_Pedido" method="post"> 
            <br>
            <h3> LISTAR </h3>
            <fieldset>
                <legend>Lista Pedidos</legend>
                <table  cellpadding="10" class="comBordaSimples">
                    <tr>
                        <td bgcolor="#DCDCDC">Codigo</td>
                        <td bgcolor="#DCDCDC">STATUS</td>
                        <td bgcolor="#DCDCDC">Data</td>
                        <td bgcolor="#DCDCDC">Nome</td>
                        <td bgcolor="#DCDCDC">Valor Total</td>
                        <td bgcolor="#DCDCDC">Observação</td>
                        <td bgcolor="#DCDCDC">Detalhes</td>
                    </tr>
                    <% //recupera o objeto resultado

                        ArrayList<Pedido> listaPedido = (ArrayList<Pedido>) request.getAttribute("listaPedido");
                        for (Pedido pedido : listaPedido) {
                    %>  
                    <tr>
                        <td><%=pedido.getCod()%></td>
                        <td><%=pedido.getStatus()%></td>
                        <td><%=pedido.getData()%></td>
                        <td><%=pedido.getCliente().getNome()%></td>
                        <td><%=pedido.getValorTotal()%></td>
                        <td><%=pedido.getObservacao()%></td>
                        <td><a href="#myModalDetalhes" data-toggle="modal" data-target="#myModalDetalhes"><img id="detalhe" class="detalhes" data-cod="<%=pedido.getCod()%>" src="imagem/add.png"  width="25px"></a></td>
                    </tr>
                    <%}%>

                </table> 

            </fieldset>
        </form>
        <center>
            <input type="submit" onclick="window.location.href = 'MenuCliente.jsp'" value="VOLTAR" name="VOLTAR">
        </center>
    </div>  
    <!-- Div Modal para Detalhes do Pedido-->
    <div class="modal fade" id="myModalDetalhes" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Detalhes do Pedidos</h4>
                </div>
                <div class="modal-body">
                    <tr>
                        <td> Valor Total <span id="ValorTotal"></span></td></br>
                        <td> Nome <span id="nome"></span></td></br>
                        <td> Quantidade <span id="qtd" ></span></td></br>
                        <td> Valor Unitario <span id="valor"></span></td></br>
                        <td> Ingredientes <span id="ingredientes"></span></td></br>

                    </tr>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

