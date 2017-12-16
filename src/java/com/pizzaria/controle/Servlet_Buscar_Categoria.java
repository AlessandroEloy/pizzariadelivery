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
public class Servlet_Buscar_Categoria extends HttpServlet {
    
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        PrintWriter out = response.getWriter();
        Categoria_DAO dao = new Categoria_DAO();
        Categoria cat = new Categoria();

    try {
        cat = dao.localizarPorCod(cod);
        
    } catch (SQLException | ClassNotFoundException ex) {
        Logger.getLogger(Servlet_Buscar_Prod.class.getName()).log(Level.SEVERE, null, ex);
    }
        request.setAttribute("categoria", cat);
        request.getRequestDispatcher("Atualizar_Cat.jsp").forward(request, response);
    }
    
 @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        PrintWriter out = response.getWriter();
        Categoria_DAO dao = new Categoria_DAO();
        Categoria cat = new Categoria();

    try {
        cat = dao.localizarPorCod(cod);
        
    } catch (SQLException | ClassNotFoundException ex) {
        ex.printStackTrace();
            request.setAttribute("erro", ex);
            request.getRequestDispatcher("Erro.jsp").forward(request, response);
    }
        request.setAttribute("categoria", cat);
        request.getRequestDispatcher("Atualizar_Cat.jsp").forward(request, response);
    }
}
