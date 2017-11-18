<%-- 
    Document   : listarCliente
    Created on : 05/06/2017, 20:29:57
    Author     : Alessandro
--%>
<%@page import="com.pizzaria.modelo.Cliente"%>
<%@page import="com.pizzaria.DAO.Cliente_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype htmlPUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Cadastro de Cliente</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Cliente.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form name="forml" action="Servlet_Listar" method="get"> 
                <br>
                <h3> LISTA DE CLIENTE</h3>
                <fieldset>
                    <legend>Dados Pessoais</legend>
                    <table>
                        <tr>
                            <td>NOME</td>
                            <td>SEXO</td>
                            <td>NASCIMENTO</td>
                            <td>TELEFONE</td>
                            <td>RG</td>
                            <td>CPF</td>
                        </tr>
                        <% //recupera o objeto resultado
                            ArrayList<Cliente> listaCliente = (ArrayList<Cliente>) request.getAttribute("listaCliente");
                            for (Cliente cliente : listaCliente) {
                        %>  
                        <tr>
                            <td><%=cliente.getNome()%></td>
                            <td><%=cliente.getSexo()%></td>
                            <td><%=cliente.getNascimento()%></td>
                            <td><%=cliente.getTelefone()%></td>
                            <td><%=cliente.getRg()%></td>
                            <td><%=cliente.getCpf()%></td>
                            <td><a href="Servlet_Excluir?id=<%=cliente.getId()%>"> X </a></td>
                            <td><a href="Servlet_Buscar?id=<%=cliente.getId()%>"> Atualizar </a></td>
                        </tr>
                    <%}%>
                    </table>    
                </fieldset>
            </form>
         </div>           
    </body>
</html>