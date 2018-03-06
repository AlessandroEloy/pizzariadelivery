/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.modelo.Funcionario;
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
 * @author Alessandro
 */
public class Servlet_Buscar_Func extends HttpServlet {

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
        Funcionario_DAO dao = new Funcionario_DAO();
        Funcionario funcionario = new Funcionario();

        try {
            funcionario = dao.localizarPorId(id);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Buscar_Func.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet_Buscar_Func.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("funcionario", funcionario);
        request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));

        PrintWriter out = response.getWriter();
        Funcionario_DAO dao = new Funcionario_DAO();
        Funcionario funcionario = new Funcionario();

        try {
            funcionario = dao.localizarPorId(id);
        } catch (SQLException | ClassNotFoundException ex) {
             ex.printStackTrace();
        }
        request.setAttribute("funcionario", funcionario);
        request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);

    }
}
