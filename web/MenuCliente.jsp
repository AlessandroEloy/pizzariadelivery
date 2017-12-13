<%-- 
    Document   : MenuGerente
    Created on : May 26, 2017, 12:13:29 AM
    Author     : bruno nakamura
--%>

<%@page import="com.pizzaria.modelo.Usuario"%>
<%@page import="com.pizzaria.controle.Servlet_Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>

<!Doctype html> 
<html> 
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>MenuCliente</title>
        
 
    
        <!-- CSS -->

        <link rel="stylesheet" href="styles_TelaPosLoginCli.css">

    </head>

    <!-- Main HTML -->

    <body> 
        

        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" >  </div></section>
        <!-- Begin Page Content -->
        


        <div id="container">
            
    <div id="BemVindo"> 
        
        <h4> <center> 
         <%
        Usuario usuarioLog = (Usuario)session.getAttribute("usuarioLog");
        out.print("Seja bem vindo! " +usuarioLog.getLogin());
        %>
        </h4></center>
             </div>
            <center> 
                <input type="submit" onclick="window.location.href = 'CadastroCliente.jsp'" value="CADASTRO" id='func'>              
                <input type="submit" onclick="window.location.href = 'Servlet_Buscar?id=${usuarioLog.id}'" value="ATUALIZAR DADOS" name ='Buscar'>  
                <input type="submit" onclick="window.location.href = 'Pedido.jsp'" value="PEDIDO" name="PEDIDO"> 
                <input type="submit" onclick="window.location.href = 'Login_index.jsp'" value="SAIR" name="SAIR">
            </center>

            <label> ${mensagem} </label>

        </div><!--/ container-->

            

        <!--JAVA SCRIPT-->
        <script> src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js";</script>
        <script>
            $("#func").click(function () {
                document.location.href = "CadastroCliente.jsp";
            });
        </script>

        <!-- End Page Content -->
    </body> 
  
</html>



