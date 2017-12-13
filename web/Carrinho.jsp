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
         <link rel="stylesheet" href="tab.css">
       
       <SCRIPT Language="javascript">
        function funcao1()
        {
        alert('Pedido Cancelado');
        }
       </SCRIPT>

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">


            <h3> CARRINHO DE PEDIDO</h3>

            <table border="1" cellpadding="10" >
                <tr>
                    <td bgcolor="#ec2222"><font color="white">Excluir</font></td>
                    <td bgcolor="#ec2222"><font color="white">Item</font></td>
                    <td bgcolor="#ec2222"><font color="white">QTD</font></td>
                    <td bgcolor="#ec2222"><font color="white">Preço Unitário</font></td>
                    <td bgcolor="#ec2222"><font color="white">Total Item</font></td>
                    <td bgcolor="#ec2222"><font color="white">Adicionar</font></td>
                </tr>
               
                <%
                //recupera os produtos do carrinho da sessao
                    Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                    for (ItemPedido item : carrinho.getItens()) {
                %>
                <tr>
                    <td><a
                            href="Servlet_Carrinho?acao=removeProduto&idProduto=<%=item.getProduto().getCod()%>">
                            <img src="imagem/close.png"  width="25px"> </td>
                    <td><%=item.getProduto().getNome()%></td>
                    <td><%=item.getQuantidade()%></td>
                    <td>R$ <%=item.getProduto().getValor()%></td>
                    <td>R$ <%=item.getProduto().getValor() * item.getQuantidade() %></td>
                    <td><a href="Servlet_Carrinho?acao=addProduto&idProduto=<%=item.getProduto().getCod()%>"> <img src="imagem/add.png"  width="25px"></a
                        ></td>
                </tr>
                <%
                    }
                %>
            </table>
             <table border="1" cellpadding="10" >
                 <td><strong>Valor Total: R$ <%=carrinho.CalcTotal() %></strong><br/></td>
             </table>
             
             <table border="1" cellpadding="10" >
               <td bgcolor="#ec2222"><font color="white">Observação</font></td>
               <td> 
             <form action="Servlet_Carrinho?acao=finalizar" method="post">
             <textarea name="observacao" cols="50" rows="4">
                    
             </textarea><br/></td></table>
            
            <a href="Pedido.jsp" class="comprando"> Continue comprando</a>
            <a href="Servlet_Carrinho?acao=cancelaCompra" class="cancelar" onclick="funcao1()">Cancelar compra</a>
            
            <input class="finalizar" type="submit" value="Finalizar Pedido">
            </form>
    </body>
</html>
