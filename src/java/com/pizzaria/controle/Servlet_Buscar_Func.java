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
        
        String id = request.getParameter("id");

        PrintWriter out = response.getWriter();
        Funcionario_DAO dao = new Funcionario_DAO();
        Funcionario funcionario = new Funcionario();

        try {
            funcionario = dao.localizarPorId(id);
            request.setAttribute("funcionario", funcionario);
            request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro:" + ex);
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");

        PrintWriter out = response.getWriter();
        Funcionario_DAO dao = new Funcionario_DAO();
        Funcionario funcionario = new Funcionario();

        try {
            funcionario = dao.localizarPorId(id);
            request.setAttribute("funcionario", funcionario);
            request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro:" + ex);
        }

    }
}
