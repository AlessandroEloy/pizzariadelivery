<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Pedidos Por Status</title>
    </head>
    <body>
        <div>
            <select name="status" id="status" onchange="buscar()">
                <option value="APROVADO">aprovado</option>
                <option value="CANCELADO">cancelado</option>
                <option value="PREPARANDO">preparando</option>
                <option value="ENVIADO">enviado</option>
                <option value="ENTREGUE">entregue</option>
            </select>
        </div>
        <div id="lista">
            
        </div>
    </body>
    <script>
        function buscar(){
            var status = document.getElementById("status");
            
            var url = "ServletListarPedidoStatus"
                    + "?status=" + status.value;
            
            var request = new XMLHttpRequest();
            
            request.open("GET", url, true);
            request.send();
            request.onreadystatechange = function(){
                console.log(request.response);
                if (request.status === 200){
                    if (request.readyState === 4){
                        if (request.response !== ""){
                            
                            var html = "<tr> <th>COD</th> <th>DESCONTO</th> </tr>";
                            
                            var objetos = JSON.parse(request.response);                          
                            for (i=0; i < objetos.length; i++){
                                html += "<tr>" + 
                                        "<td>" + objetos[i].cod + "</td>" +
                                        "<td>" + objetos[i].desconto + "</td>" +
                                        "</tr>";
                            }
                            
                            document.getElementById("tabelaPedidos").innerHTML = html;
                        }
                    }
                }
            }
            
        }
    </script>
    
    <table id="tabelaPedidos">
        
    </table>
    
</html>
