<%-- 
    Document   : CadEndereco.jsp
    Created on : 05/03/2018, 19:25:55
    Author     : alessandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Endereço</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Adicionando JQuery -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>

        <!-- CSS -->

        <link rel="stylesheet" href="pedido_tab.css">

        <!-- Adicionando Javascript -->
        <script type="text/javascript" >

            $(document).ready(function () {

                function limpa_formulário_cep() {
                    // Limpa valores do formulário de cep.
                    $("#rua").val("");
                    $("#bairro").val("");
                    $("#cidade").val("");
                    $("#uf").val("");
                }

                //Quando o campo cep perde o foco.
                $("#cep").blur(function () {

                    //Nova variável "cep" somente com dígitos.
                    var cep = $(this).val().replace(/\D/g, '');

                    //Verifica se campo cep possui valor informado.
                    if (cep != "") {

                        //Expressão regular para validar o CEP.
                        var validacep = /^[0-9]{8}$/;

                        //Valida o formato do CEP.
                        if (validacep.test(cep)) {

                            //Preenche os campos com "..." enquanto consulta webservice.
                            $("#rua").val("...");
                            $("#bairro").val("...");
                            $("#cidade").val("...");
                            $("#uf").val("...");

                            //Consulta o webservice viacep.com.br/
                            $.getJSON("https://viacep.com.br/ws/" + cep + "/json", function (dados) {

                                if (!("erro" in dados)) {
                                    //Atualiza os campos com os valores da consulta.
                                    $("#rua").val(dados.logradouro);
                                    $("#bairro").val(dados.bairro);
                                    $("#cidade").val(dados.localidade);
                                    $("#uf").val(dados.uf);
                                } //end if.
                                else {
                                    //CEP pesquisado não foi encontrado.
                                    limpa_formulário_cep();
                                    alert("CEP não encontrado.");
                                }
                            });
                        } //end if.
                        else {
                            //cep é inválido.
                            limpa_formulário_cep();
                            alert("Formato de CEP inválido.");
                        }
                    } //end if.
                    else {
                        //cep sem valor, limpa formulário.
                        limpa_formulário_cep();
                    }
                });
            });

        </script>
    </head>

    <body>
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>

        <div id="container">

            <!-- Inicio do formulario -->
            <form action="Servlet_Endereco" method="post">
                <label>Cep:
                    <input name="cep" type="text" id="cep" value="" size="10" maxlength="9" /></label><br />
                <label>Rua:
                    <input name="rua" type="text" id="rua" size="60" /></label><br />
                <label>Referência:
                    <input name="referencia" type="text" id="referencia" size="60" /></label><br />
                <label>Bairro:
                    <input name="bairro" type="text" id="bairro" size="40" /></label><br />
                <label>Numero:
                    <input name="numero" type="text" id="numero" size="4" /></label><br />
                <label>Cidade:
                    <input name="cidade" type="text" id="cidade" size="40" /></label><br />
                <label>Estado:
                    <input name="uf" type="text" id="uf" size="2" /></label><br />


                <center>
                    <input class="finalizar" type="submit" value="CADASTRAR">
                </center>
            </form>

        </div>
    </body>

</html>