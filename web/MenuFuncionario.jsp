<%-- 
    Document   : MenuFuncionario
    Created on : May 22, 2017, 11:39:39 PM
    Author     : bruno nakamura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "m"%>

<!Doctype html> 
<html> 
<head>
 
    <!-- Basics -->
     
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     
    <title>MenuFuncionario</title>
 
    <!-- CSS -->
     
    <link rel="stylesheet" href="styles_TelaPosLoginFunc.css">
     
</head>
 
    <!-- Main HTML -->
     
    <body> 
    <section id="rectangle"><div class="css"> <img src="imagem/logo.png" >  </div></section>
    <!-- Begin Page Content -->
    

     
    <div id="container">
        
    <div id="BemVindo"> 
    
        <h2> Seja Bem Vindo Fucionario!!!</h2>
    
    </div>
        
        <center> 
                <input type="submit" onclick="window.location.href='CadastroCliente.jsp'" value="CADASTRO" id='funcionario'> 

            <form name ="forml" action="Servlet_Listar" method="post"> 
                <input type="submit" onclick="window.location.href='AlterarDadosGF.jsp'" value="CONSULTAR DADOS DO CLIENTE" id='funcionario'>  
            </form>
                
                <input type="submit" onclick="window.location.href = 'Login_index.jsp'" value="SAIR" name="SAIR">
        </center>

                        <label> ${mensagem} </label>
                        
            </div><!--/ container-->
            
            
    
            <!--JAVA SCRIPT-->
            <script> src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"</script>
            <script>
                $("#funcionario").click(function(){
                    document.location.href="CadastroCliente.jsp";
                })
            </script>
            
            
    <!-- End Page Content -->
    </body> 

 </html>
