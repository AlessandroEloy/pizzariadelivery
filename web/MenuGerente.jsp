<%-- 
    Document   : MenuGerente
    Created on : May 26, 2017, 12:13:29 AM
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
     
    <title>MenuGerente</title>
 
    <!-- CSS -->
     
    <link rel="stylesheet" href="styles_Gerente.css">
    <link rel="stylesheet" href="DropD.css">
     
</head>
 
    <!-- Main HTML -->
     
    <body> 
    <section id="rectangle"><div class="css"> <img src="imagem/logo.png" >  </div></section>
    <!-- Begin Page Content -->
    

     
    <div id="container">
      
      <div id="BemVindo">
    <h2> Seja Bem Vindo Gerente!!!</h2>
    </div>
           
<nav class="vertical">
    <ul> 
        
                <li><a href="#"> <input type="submit" onclick="window.location.href='#'" value="CADASTRO" id='func'> </a> <br/> 
        <ul>
                <li><a href="#"> <input type="submit" onclick="window.location.href='CadastroFuncionario.jsp'" value="CADASTRO DE FUNCIONARIO" id='func'> </a> <br/> 
                <li><a href="#"> <input type="submit" onclick="window.location.href='CadastroCliente.jsp'" value="CADASTRO DE CLIENTE" id='func'> </a></li> <br/> 
                <li><a href="#"> <input type="submit" onclick="window.location.href='CadProdutos.jsp'" value="CADASTRO DE PRODUTOS" id='func'> </a></li> <br/> 
        
        
        </ul>
                    
                <li><a href="#"> <input type="submit" onclick="window.location.href='#'" value="CONSULTAR DADOS" id='func'> </a> <br/>
        <ul>       
            <form name ="forml" action="Servlet_Listar_Func" method="post"> 
                <li><a href="#"> <input type="submit" onclick="window.location.href='LISTAR'" value="CONSULTAR DADOS DO FUNCIONARIO" id='func'> </a> <br/>
            </form>
          
            <form name ="forml" action="Servlet_Listar_Produto" method="post"> 
                <li><a href="#"> <input type="submit" onclick="window.location.href='LISTAR'" value="CONSULTAR PRODUTOS" id='func'> </a> <br/>
            </form>
        
            <form name ="forml" action="Servlet_Listar" method="post"> 
                <li><a href="#"> <input type="submit" onclick="window.location.href='AlterarDadosGF.jsp'" value="CONSULTAR DADOS DO CLIENTE" id='func'> </a></li> <br/>
            </form>
        </ul>
                
                <li> <a href="#"> <input type="submit" onclick="window.location.href = 'Pedido.jsp'" value="PEDIDO" name="PEDIDO"> </a> </li> <br/>
                <li> <a href="#"> <input type="submit" onclick="window.location.href = 'Login_index.jsp'" value="SAIR" name="SAIR"> </a> </li> <br/>
                
    </ul>

</nav>
       
                        <label> ${mensagem} </label>
                        
            </div><!--/ container-->
            
            
    
            <!--JAVA SCRIPT-->
            <script> src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"</script>
            <script>
                $("#func").click(function(){
                    document.location.href="CadastroFuncionario.jsp";
                })
            </script>
            
            
    <!-- End Page Content -->
    </body> 

 </html>
