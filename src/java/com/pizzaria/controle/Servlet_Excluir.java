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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Cliente_DAO daoCliente = new Cliente_DAO();
        Usuario_DAO daoUsuario = new Usuario_DAO();

        try {
            Cliente cliente = new Cliente();
            Usuario usuario = new Usuario();

            cliente = daoCliente.localizarPorId(id); //localiza o cliente por id

            usuario = cliente.getUsuario(); //insere objeto usuario de cliente em usuario

            if (cliente.isDisponivel() == true) {
                cliente.setDisponivel(false);

            } else {
                cliente.setDisponivel(true);

            }

            cliente = daoCliente.excluir(cliente);

            if (cliente.isDisponivel()) {
                String mensagem = "Cliente Ativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            } else {
                String mensagem = "Cliente Desativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}
