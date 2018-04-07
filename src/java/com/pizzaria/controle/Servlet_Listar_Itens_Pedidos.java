/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.ItemPedido_DAO;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Produto;
import java.io.IOException;
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
public class Servlet_Listar_Itens_Pedidos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ArrayList<ItemPedido> itens = new ArrayList<>();
        ItemPedido_DAO dao = new ItemPedido_DAO();
        try {
            itens = dao.listar(id);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Listar_Itens_Pedidos.class.getName()).log(Level.SEVERE, null, ex);
        }
        Gson gson = new Gson();
        String lista = gson.toJson(itens);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(lista);
    }
}
