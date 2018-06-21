/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alessandro
 */
public class Servlet_Listar_Pedidos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Usuario usuario = new Usuario();
        usuario = (Usuario) session.getAttribute("usuarioLog");

        PrintWriter out = response.getWriter();

        //cria lista
        Pedido_DAO pedDAO = new Pedido_DAO();
        //executa o método listar
        ArrayList<ItemPedido> pedidos = new ArrayList<>();
        try {
            if (usuario.getPerfil().getId() == 3) {
                pedidos = pedDAO.listarBalconista();
                //add a lista no objeto request
                request.setAttribute("listaPedidos", pedidos);
                //encaminha o request para o jsp
                request.getRequestDispatcher("ItemPedidosBalconista.jsp").forward(request, response);
            } else {
                pedidos = pedDAO.listar();
                //add a lista no objeto request
                request.setAttribute("listaPedidos", pedidos);
                //encaminha o request para o jsp
                request.getRequestDispatcher("ListaPedidoPizzaiolo.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
       
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Usuario usuario = new Usuario();
        usuario = (Usuario) session.getAttribute("usuarioLog");

        PrintWriter out = response.getWriter();

        //cria lista
        Pedido_DAO pedDAO = new Pedido_DAO();
        //executa o método listar
        ArrayList<ItemPedido> pedidos = new ArrayList<>();
        try {
            if (usuario.getPerfil().getId() == 3) {
                pedidos = pedDAO.listarBalconista();
                //add a lista no objeto request
                request.setAttribute("listaPedidos", pedidos);
                //encaminha o request para o jsp
                request.getRequestDispatcher("ItemPedidosBalconista.jsp").forward(request, response);
            } else {
                pedidos = pedDAO.listar();
                //add a lista no objeto request
                request.setAttribute("listaPedidos", pedidos);
                //encaminha o request para o jsp
                request.getRequestDispatcher("ListaPedidoPizzaiolo.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
       
    }
}
