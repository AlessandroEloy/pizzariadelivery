<%-- 
    Document   : Cadastro_Categoria.jsp
    Created on : 15/12/2017, 19:32:10
    Author     : alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="jquery-3.2.1.min.js"></script>        
        <title>Cadastro de Produtos</title>

        <link rel="stylesheet" href="styles_Produto.css">

    </head>

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form action="Servlet_Categoria" method="post" onsubmit="return checkForm(this);"> 
                <h3> CADASTRO DE CATEGORIA</h3>
                <fieldset>
                    <legend>Dados das Categorias</legend>
                    <table cellspacing="10">
                        <tr>
                            <td>
                                <label for="categoria">Categoria:</label>
                            </td>
                            <td align="left">
                                <input type="text" name="categoria" id="categoria" placeholder="Categoria" required>
                            </td>

                    </table>
                    <div style="color:red; font-size: x-large"><p>${mensagem}</p></div>

                    <input type="submit" value="CADASTRAR"> 
                    <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR">
                </fieldset>
            </form>
        </div><!--/ container-->            

    </body>
</html>
