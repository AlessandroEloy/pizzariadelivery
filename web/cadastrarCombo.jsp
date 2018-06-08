<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Combo</title>
    </head>
    <body>
        <div id="produtos">
            
        </div>
        <form action="" method="">
            <div id="campos">
                
            </div>
            <input type="submit" value="cadastrar"/>
        </form>    
    </body>
    <script>
        function listarProdutos(){
            var request = new XMLHttpRequest();
            
            request.onreadystatechange = function(){
                if(request.status === 200){
                    if(request.response !== ""){
                        var lista = JSON.parse(request.response);
                        
                        for(var i = 0; i < lista.length; i++){
                            
                        }
                    }
                }
            }
            
            request.open("GET", "Servlet_Listar_Produto", true);
            request.send();
        }
    </script>
</html>
