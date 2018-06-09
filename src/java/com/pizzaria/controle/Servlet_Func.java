/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.DAO.Perfil_DAO;
import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.Perfil;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno nakamura
 */
public class Servlet_Func extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Perfil> listaPerfil = new ArrayList<>();
        Perfil_DAO dao = new Perfil_DAO();
        try {
            listaPerfil = dao.Listar();
            Gson gson = new Gson();
            String lista = gson.toJson(listaPerfil);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(lista);
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
         request.setAttribute("listaPerfil",listaPerfil );  
         
         request.getRequestDispatcher("CadastroFuncionario.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String perfil = request.getParameter("perfil");
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
        Perfil_DAO perdao = new Perfil_DAO();

        funcionario.setNome(nome);
        funcionario.setSexo(sexo);
        funcionario.setNascimento(nascimento);
        funcionario.setTelefone(telefone);
        funcionario.setRg(rg);
        funcionario.setCpf(cpf);
        usu.setLogin(login);
        usu.setSenha(senha);
        funcionario.setUsuario(usu);
        Perfil perfilFunc = new Perfil();
        int id = Integer.parseInt(perfil);
        perfilFunc.setId(id);
        funcionario.setPerfil(perfilFunc);

        if (funcionario.getPerfil().equals(1)) {
            try {
                perdao.LocalizarPorCod(funcionario.getId());
                funcionario.setFuncao(perfilFunc.getAcesso());
                usu.setPerfil(2);
            } catch (SQLException ex) {
                Logger.getLogger(Servlet_Func.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Servlet_Func.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (funcionario.getPerfil().equals(2)) {
            funcionario.setFuncao(perfilFunc.getAcesso());
            usu.setPerfil(2);
        } else {
            funcionario.setFuncao(perfilFunc.getAcesso());
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

    }
}
