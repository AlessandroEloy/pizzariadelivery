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
            
            request.open("GET", url, false);
            request.send();
            
            alert(request.response);
            document.getElementById("tabelaPedidos").innerHTML = request.response;
        }
    </script>
    <div id="tabelaPedidos"></div>
</html>
