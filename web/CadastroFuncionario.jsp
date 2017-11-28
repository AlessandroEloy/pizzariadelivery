<%-- 
    Document   : CadastroFuncionario
    Created on : May 22, 2017, 11:39:08 PM
    Author     : bruno nakamura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html>
    <head>

        <!-- Basics -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

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
                            <td>
                                <label for="funcao">Função:</label>
                            </td>
                            <td align="left">
                                <select name="funcao" class="select_box" > 
                                    <option value="balconista">Balconista</option> 
                                    <option value="pizzaiolo">Pizzaiolo</option> 
                                    <option value="gerente">Gerente</option> 
                                    <option value="auxiliar">Auxiliar Administrativo</option>

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
                <!-- ENDEREÇO -->
                <!--     <fieldset>
                         <legend>Dados de Endereço</legend>
                         <table cellspacing="10">
     
                             <tr>
                                 <td>
                                     <label for="rua">Rua:</label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="rua" id="rua" placeholder="rua" >
                                 </td>
                             <tr>
                                 <td>
                                     <label for="bairro">Bairro: </label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="bairro" id="bairro" placeholder="bairro">
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label for="numero">Número: </label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="numero" id="numero" placeholder="00">
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label for="estado">Estado:</label>
                                 </td>
                                 <td align="left">
                                     <select name="estado" class="select_box"> 
                                         <option value="ac">Acre</option> 
                                         <option value="al">Alagoas</option> 
                                         <option value="am">Amazonas</option> 
                                         <option value="ap">Amapá</option> 
                                         <option value="ba">Bahia</option> 
                                         <option value="ce">Ceará</option> 
                                         <option value="df">Distrito Federal</option> 
                                         <option value="es">Espírito Santo</option> 
                                         <option value="go">Goiás</option> 
                                         <option value="ma">Maranhão</option> 
                                         <option value="mt">Mato Grosso</option> 
                                         <option value="ms">Mato Grosso do Sul</option> 
                                         <option value="mg">Minas Gerais</option> 
                                         <option value="pa">Pará</option> 
                                         <option value="pb">Paraíba</option> 
                                         <option value="pr">Paraná</option> 
                                         <option value="pe">Pernambuco</option> 
                                         <option value="pi">Piauí</option> 
                                         <option value="rj">Rio de Janeiro</option> 
                                         <option value="rn">Rio Grande do Norte</option> 
                                         <option value="ro">Rondônia</option> 
                                         <option value="rs">Rio Grande do Sul</option> 
                                         <option value="rr">Roraima</option> 
                                         <option value="sc">Santa Catarina</option> 
                                         <option value="se">Sergipe</option> 
                                         <option value="sp">São Paulo</option> 
                                         <option value="to">Tocantins</option> 
                                     </select>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label for="cidade">Cidade: </label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="cidade" placeholder="cidade">
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label for="cep">CEP: </label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="cep" placeholder="cep">
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label for="referencia">Referencias: </label>
                                 </td>
                                 <td align="left">
                                     <input type="text" name="referencias" placeholder="referencias">
                                 </td>
                             </tr>
                         </table>
                     </fieldset>
                     <br />           -->

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
                    function checkForm(form)
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
