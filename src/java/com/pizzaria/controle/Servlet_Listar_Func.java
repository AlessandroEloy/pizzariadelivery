/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.modelo.Funcionario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro
 */
public class Servlet_Listar_Func extends HttpServlet {

    /**
     * Returns a short description of the servlet.
     *
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //cria lista
        Funcionario_DAO DAO = new Funcionario_DAO();
        //executa o método listar
        ArrayList<Funcionario> funcionarios = null;
        try {
            funcionarios = DAO.listar();
            //add a lista no objeto request
            request.setAttribute("listaFuncionario", funcionarios);
            //encaminha o request para o jsp
            RequestDispatcher rd = request.getRequestDispatcher("listaFuncionario.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Listar_Func.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
