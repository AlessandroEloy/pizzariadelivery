/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Listar_Pedidos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //cria lista
        Pedido_DAO pedDAO = new Pedido_DAO();
        //executa o método listar
        ArrayList<ItemPedido> pedidos = new ArrayList<>();
        PrintWriter out = response.getWriter();
        try {
            pedidos = pedDAO.listar();
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        //add a lista no objeto request
        request.setAttribute("listaPedidos", pedidos);
        //encaminha o request para o jsp
        request.getRequestDispatcher("listaPedidos.jsp").forward(request, response);
    }

}
