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
 * @author alessandro
 */
public class Servlet_Listar_Cat extends HttpServlet {


  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              
            //cria lista
                Categoria_DAO DAO = new Categoria_DAO();
                //executa o método listar
                ArrayList<Categoria> listaCat = null;
        try {
            listaCat = DAO.listar() ;
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Listar_Func.class.getName()).log(Level.SEVERE, null, ex);
        }
                //add a lista no objeto request
                request.setAttribute("listaCategoria", listaCat);
                //encaminha o request para o jsp
                RequestDispatcher rd = request.getRequestDispatcher("listaCategoria.jsp");
                rd.forward(request, response);
    }

}
