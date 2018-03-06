/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class Servlet_Listar_Pedido extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        //cria lista
        Pedido_DAO pedDAO = new Pedido_DAO();
        
        //executa o método listar
        ArrayList<ItemPedido> pedidos = new ArrayList<>();
        PrintWriter out = response.getWriter();
        try {
            pedidos = pedDAO.listarPedido(id);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Listar_Pedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        //add a lista no objeto request
        request.setAttribute("listaPedido", pedidos);
        //encaminha o request para o jsp
        request.getRequestDispatcher("listaPedido.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        //cria lista
        Pedido_DAO pedDAO = new Pedido_DAO();
        //executa o método listar
        ArrayList<ItemPedido> pedidos = new ArrayList<>();
        PrintWriter out = response.getWriter();
        try {
            pedidos = pedDAO.listarPedido(id);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Listar_Pedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        //add a lista no objeto request
        request.setAttribute("listaPedido", pedidos);
        //encaminha o request para o jsp
        request.getRequestDispatcher("listaPedido.jsp").forward(request, response);
    }
}
