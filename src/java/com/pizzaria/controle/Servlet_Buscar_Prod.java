/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Produto_DAO;
import com.pizzaria.modelo.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Buscar_Prod extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        PrintWriter out = response.getWriter();
        Produto_DAO dao = new Produto_DAO();
        Produto produto = new Produto();

    try {
        produto = dao.localizarPorCod(cod);
        
    } catch (SQLException | ClassNotFoundException ex) {
        Logger.getLogger(Servlet_Buscar_Prod.class.getName()).log(Level.SEVERE, null, ex);
    }
        request.setAttribute("produto", produto);
        request.getRequestDispatcher("Atualizar_Prod.jsp").forward(request, response);
    }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        PrintWriter out = response.getWriter();
        Produto_DAO dao = new Produto_DAO();
        Produto produto = new Produto();

    try {
        produto = dao.localizarPorCod(cod);
        
    } catch (SQLException | ClassNotFoundException ex) {
        Logger.getLogger(Servlet_Buscar_Prod.class.getName()).log(Level.SEVERE, null, ex);
    }
        request.setAttribute("produto", produto);
        request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
    }
}

