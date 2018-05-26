/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Valida_CPF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Cliente_DAO dao = new Cliente_DAO();
        try {

            String cpf = request.getParameter("paramcpf");
            String CpfCliente = null;

            CpfCliente = dao.localizarClientePorCPF(cpf);
            if (CpfCliente == null) {
                cpf = null;
            }
            
            Gson gson = new Gson();
            String CPF = gson.toJson(cpf);

            response.setContentType("application/json");
            response.getWriter().write(CPF);

        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }
}
