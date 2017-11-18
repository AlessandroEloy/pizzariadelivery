/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro
 */
public class Servlet_Excluir extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        
        Cliente_DAO dao = new Cliente_DAO();
        
        
        try {
            dao.excluir(id);
            String mensagem = "Cliente Excluido com Sucesso";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("AlterarDadosGF.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            System.out.println("erro"+ex);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String id = request.getParameter("id");
        
        Cliente_DAO dao = new Cliente_DAO();
        
        
        try {
            dao.excluir(id);
            String mensagem = "Cliente Excluido com Sucesso";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("AlterarDadosGF.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            System.out.println("erro"+ex);
        }
    }
}

