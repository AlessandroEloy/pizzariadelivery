/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro
 */
public class Servlet_Buscar extends HttpServlet {

    /**
     * Método responsável pela busca de clientes para atualização.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        PrintWriter out = response.getWriter();
        Cliente_DAO dao = new Cliente_DAO();
        Cliente cliente = new Cliente();

        try {
            cliente = dao.localizarPorId(id);
            request.setAttribute("cliente", cliente);
            request.getRequestDispatcher("Atualizar_Cliente.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro:" + ex);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        PrintWriter out = response.getWriter();
        Cliente_DAO dao = new Cliente_DAO();
        Cliente cliente = new Cliente();

        try {
            cliente = dao.localizarPorId(id);
            request.setAttribute("cliente", cliente);
            request.getRequestDispatcher("Atualizar_Cliente.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro:" + ex);
        }
    }
}
