/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno nakamura
 */
public class Servlet_Func extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String funcao = request.getParameter("funcao");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        String telefone = request.getParameter("telefone");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        PrintWriter out = response.getWriter();

        Usuario usu = new Usuario();
        Usuario_DAO usudao = new Usuario_DAO();
        Funcionario funcionario = new Funcionario();
        Funcionario_DAO dao = new Funcionario_DAO();

        funcionario.setFuncao(funcao);
        funcionario.setNome(nome);
        funcionario.setSexo(sexo);
        funcionario.setNascimento(nascimento);
        funcionario.setTelefone(telefone);
        funcionario.setRg(rg);
        funcionario.setCpf(cpf);
        usu.setLogin(login);
        usu.setSenha(senha);
        funcionario.setUsuario(usu);

        if (funcionario.getFuncao().equals("gerente")) {
            
            usu.setPerfil(3);

        } else {
            
            usu.setPerfil(2);
        }
        try {
            usudao.cadastrarUsuario(usu);
            dao.cadastrarFunc(funcionario);
            String mensagem = "Cadastro Realizado Com Sucesso";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex);
        }

//        out.println(login);
//        out.println(senha);
//        out.println(nome);
//        out.println(cpf);
//        out.println(sexo);
//        out.println(telefone);
//        out.println(funcao);
    }
}
