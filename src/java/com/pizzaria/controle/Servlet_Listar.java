/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Cliente;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro.eloy
 */
public class Servlet_Listar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        Usuario usuario = new Usuario();
        usuario.setLogin(request.getSession().getAttribute("usuarioLog").toString());
        Usuario_DAO dao = new Usuario_DAO();
        PrintWriter out = response.getWriter();

        try {
            usuario = dao.buscar_perfil(usuario);
            if (usuario.equals(1)) {
                //add a lista no objeto request
                request.setAttribute("usuario", usuario);
                //encaminha o request para o jsp
                RequestDispatcher rd = request.getRequestDispatcher("Servlet_Atualizar");
                rd.forward(request, response);
            } else {
                //cria lista
                Cliente_DAO cDAO = new Cliente_DAO();
                //executa o método listar
                ArrayList<Cliente> clientes = null;
                clientes = cDAO.listar();
                //add a lista no objeto request
                request.setAttribute("listaCliente", clientes);
                //encaminha o request para o jsp
                RequestDispatcher rd = request.getRequestDispatcher("listaCliente.jsp");
                rd.forward(request, response);
            }

        } catch (SQLException ex) {
            out.println(ex);
        }

    }// </editor-fold>
}
