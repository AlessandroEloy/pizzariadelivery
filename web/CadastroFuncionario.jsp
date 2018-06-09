<%-- 
    Document   : CadastroFuncionario
    Created on : May 22, 2017, 11:39:08 PM
    Author     : bruno nakamura
--%>

<%@page import="com.pizzaria.modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="jquery-3.2.1.min.js"></script>   

        <title>Cadastro de Funcionário</title>

        <!-- CSS -->

        <link rel="stylesheet" href="styles_Funcionario.css">

    </head>

    <!-- Main HTML -->

    <body> 
        <section id="rectangle"><div class="css"> <img src="imagem/logo.png" class="imglogo" >  </div></section>
        <!-- Begin Page Content -->

        <div id="container">

            <form action="Servlet_Func" method="post" onsubmit="return checkForm(this);">
                <h3> CADASTRO DE FUNCIONÁRIO</h3>
                <fieldset>
                    <legend>Dados Pessoais</legend>
                    <table cellspacing="10">
                        <tr>
                        <tr>
                            <td>
                                <label for="funcao">Função:</label>
                            </td>
                            <td align="left">
                                <select name="funcao" id="funcao" class="select_box" > 
                                    <% //recupera o objeto resultado

                                        ArrayList<Perfil> listaPerfil = (ArrayList<Perfil>) request.getAttribute("listaPerfil");
                                        for (Perfil perfil : listaPerfil) {
                                    %>  
                                    <option value=<%=perfil.getNivel_acesso().name() %>></option>
                                    <%}%>       
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nome">Nome: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="nome" id="nome" placeholder="nome" required>
                            </td>

                        <tr>
                            <td>
                                <label>Sexo: </label>
                            </td>
                            <td align="left">
                                <input type="radio" name="sexo"  value="M" > Masculino
                                <input type="radio" name="sexo"  value="F" > Feminino
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label>Nascimento: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="nascimento"  id="nascimento"  placeholder="00/00/0000" required> 

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="telefone">Telefone: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="telefone" id="telefone" placeholder="0000-0000" required> 
                            </td>
                        </tr>

                        <td>
                            <label>RG:</label>
                        </td>
                        <td align="left">
                            <input type="text" name="rg" id="rg" placeholder="0000000-00" required> 
                        </td>

                        <tr>
                            <td>
                                <label>CPF:</label>
                            </td>
                            <td align="left">
                                <input type="text" name="cpf" id="cpf" placeholder="000.000.000-00" required>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <br />

                <!-- DADOS DE LOGIN -->
                <fieldset>
                    <legend>Dados de Login</legend>
                    <table cellspacing="10">

                        <tr>
                            <td>
                                <label for="login">Login de usuário: </label>
                            </td>
                            <td align="left">
                                <input type="text" name="login" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="senha">Senha: </label>
                            </td>
                            <td align="left">
                                <input type="password" name="senha" required>
                            </td>
                        </tr>

                        <tr>
                            <td align="left">
                                <input type="hidden" name="perfil" value="2">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label for="passconfirm">Confirme a senha: </label>
                            </td>
                            <td align="left">
                                <input type="password" name="passconfirm" required>
                            </td>
                        </tr> 

                    </table> <input type="submit" value="CADASTRAR">
                    <a href="#"> <input type="submit" onclick="window.location.href = 'MenuGerente.jsp'" value="VOLTAR" name="VOLTAR"> </a> <br/>
                </fieldset> 

                <br />

                <!--JAVA SCRIPT -->
                <script>
//                    $(document).ready(function () {
//                $.get("Servlet_Func", function (responsejson) {
//                    console.log(responsejson);
//                    var $select = $("#funcao");
//                    $select.find("option").remove();
//                    $.each(responsejson, function (index, value) {
//                        $("<option value='" + value.id + "'>").appendTo($("#funcao"))
//                                .text(value.nivel_acesso);
//                    });
//                });
//            });
//                    function checkForm(form)
                    {
                    if (form.login.value == "") {
                    alert("Erro: O nome do usuario deve ser preenchido!");
                    form.login.focus();
                    return false;
                    }

                    if (form.senha.value != "" && form.senha.value == form.passconfirm.value) {
                    if (form.senha.value.length < 8) {
                    alert("Erro: Sua Senha Deve ser maior que 8 caracteres!");
                    form.senha.focus();
                    return false;
                    }
                    if (form.senha.value == form.login.value) {
                    alert("Erro: Sua senha deve ser diferente que o login!");
                    form.senha.focus();
                    return false;
                    }

                    re = /[^\+&¨%$#@!*?]/;
                    if (!re.test(form.senha.value)) {
                    alert("Erro: Sua senha deve conter caracteres especiais (^\+&¨%$#@!*?)!");
                    form.senha.focus();
                    return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(form.senha.value)) {
                    alert("Erro: Sua senha deve conter numeros (0-9)!");
                    form.senha.focus();
                    return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(form.senha.value)) {
                    alert("Erro: Sua senha deve conter letras minusculas (a-z)!");
                    form.senha.focus();
                    return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(form.senha.value)) {
                    alert("Erro: sua senha deve conter letras maisculas (A-Z)!");
                    form.senha.focus();
                    return false;
                    }
                    } else {
                    alert("Erro: Por Favor digite sua senha de novo no confirme a senha!");
                    form.senha.focus();
                    return false;
                    }
                    }
                </script>

            </form>

        </div><!--/ container-->

    </body>
    <!-- End Page Content -->
</html>
