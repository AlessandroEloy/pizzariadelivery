/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Categoria_DAO;
import com.pizzaria.modelo.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Categoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoria = request.getParameter("categoria");
        

        PrintWriter out = response.getWriter();

        Categoria cat = new Categoria();
        Categoria_DAO dao = new Categoria_DAO();
        

        cat.setCategoria(categoria);


        try {

            dao.cadastrarCategoria(cat);
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
