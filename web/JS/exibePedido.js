/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {


    $(".detalhes").click(function () {

        var codigo = $(this).data("cod");

       // alert(codigo);
       exibePedido(codigo);

    });




    function exibePedido(id) {

        $.get("\Servlet_Listar_Itens_Pedidos?id="+id, function (responseJson) {
            console.log(responseJson);
            $("#ValorTotal").html(responseJson[0].pedido.valorTotal);
            $("#nome").html(responseJson[1].produto.nome);
            $("#qtd").html(responseJson[0].quantidade);
            $("#valor").html(responseJson[0].valorItem);
            $("#ingredientes").html(responseJson[1].produto.ingredientes);

            console.log(responseJson);
        });
    }
});

