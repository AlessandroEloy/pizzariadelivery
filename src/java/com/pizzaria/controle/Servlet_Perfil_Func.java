/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Perfil_DAO;
import com.pizzaria.modelo.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro_Eloy
 */
public class Servlet_Perfil_Func extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acesso = request.getParameter("acesso");

        PrintWriter out = response.getWriter();

        Perfil perfil = new Perfil();
        Perfil_DAO dao = new Perfil_DAO();

        perfil.setAcesso(acesso);

        try {

            dao.CadastrarPerfil(perfil);
            String mensagem = "Cadastro Realizado Com Sucesso";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);

        } catch (SQLException ex) {
            String mensagem = "Categoria já cadastrada ou invalido";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("Cadastro_Categoria.jsp").forward(request, response);
        }
    }
}
