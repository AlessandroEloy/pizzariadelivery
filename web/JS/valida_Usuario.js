$(function () {
    $("#login").blur(function () {
        var login = $("#login").val();
        
        $.ajax({
           //url do recurso do servidor
           url:"Servlet_Valida_Login",
           type: 'GET',
           // tipo de retorno
           dataType:"json",
           
           data:{
               paramlogin: login,
           },
           // função para tratar o retorno
           success: function(data){
               
               console.log('valor '+ data);
               if(data == null){
                   alert("login valido!!");
               }else{
                   alert("login já cadastrado!");
               }
           },
           
           erro: function(xhr, status, errorThrown) {
             alert("Erro ao buscar Login!!");
            console.log("Error: " + errorThrown);
            console.log("Status: " + status);  
           },
           
           complete: function (xhr, status) {
            console.log("The request is complete!");
        }
            
        });
    });
});
