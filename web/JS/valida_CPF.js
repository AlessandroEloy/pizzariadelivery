$(function(){
$("#cpf").blur(function () {
    
      var cpf = $("#cpf").val();
      

    $.ajax({
        // url do recurso no servidor
        url: "Servlet_Valida_CPF",
        type: 'GET',
        // tipo de retorno
        dataType: "json",
      
        data:{
            paramcpf:cpf,
        },
        // função para tratar o retorno
        success: function (data) {

            console.log('valor: ' + data);
            if(data == null){
                alert("cpf valido!!")
            }else{
                 alert("Ops!, CPF Cadastrado!!");
            }

        },

        error: function (xhr, status, errorThrown) {
            alert("Erro ao buscar CPF!!");
            console.log("Error: " + errorThrown);
            console.log("Status: " + status);

        },
        complete: function (xhr, status) {
            console.log("The request is complete!");
        }



    });//termina o ajax

});


});