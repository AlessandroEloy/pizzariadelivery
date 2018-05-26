<%-- 
    Document   : listaFuncionario
    Created on : 08/06/2017, 01:05:43
    Author     : Alessandro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.pizzaria.modelo.Funcionario"%>
<%@page import="com.pizzaria.DAO.Funcionario_DAO"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype htmlPUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Cadastro de Funcionarios</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Funcionario.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form name="forml" action="Servlet_Listar_Func" method="get"> 
                <br>
                <h3> LISTA DE FUNCIONARIOS</h3>
                <fieldset>
                    <legend>Dados Pessoais</legend>
                   <table  cellpadding="10" class="comBordaSimples" align="center">
                        <tr>
                            <td bgcolor="#DCDCDC">FUNCAO</td>
                            <td bgcolor="#DCDCDC">NOME</td>
                            <td bgcolor="#DCDCDC">SEXO</td>
                            <td bgcolor="#DCDCDC">NASCIMENTO</td>
                            <td bgcolor="#DCDCDC">TELEFONE</td>
                            <td bgcolor="#DCDCDC">RG</td>
                            <td bgcolor="#DCDCDC">CPF</td>
                            <td bgcolor="#DCDCDC">DESATIVAR</td>
                            <td bgcolor="#DCDCDC">ATUALIZAR</td>
                        </tr>
                        <% //recupera o objeto resultado
                            ArrayList<Funcionario> listaFuncionario = (ArrayList<Funcionario>) request.getAttribute("listaFuncionario");
                            for (Funcionario funcionario : listaFuncionario) {
                        %>  
                        <tr>
                            <td><%=funcionario.getFuncao()%></td>
                            <td><%=funcionario.getNome()%></td>
                            <td><%=funcionario.getSexo()%></td>
                            <td><%=funcionario.getNascimento()%></td>
                            <td><%=funcionario.getTelefone()%></td>
                            <td><%=funcionario.getRg()%></td>
                            <td><%=funcionario.getCpf()%></td>
                            <td><a href="Servlet_Excluir_Func?id=<%=funcionario.getId()%>"> X </a></td>
                            <td><a href="Servlet_Buscar_Func?id=<%=funcionario.getId()%>"> Atualizar </a></td>
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