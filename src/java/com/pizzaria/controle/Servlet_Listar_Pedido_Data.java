/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.Pedido;
import com.sun.tools.ws.wsdl.document.jaxws.Exception;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro Eloy
 */
public class Servlet_Listar_Pedido_Data extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            SimpleDateFormat formataData = new SimpleDateFormat("yyyy-MM-dd");
            Date data_inicial = (Date) formataData.parse(request.getParameter("data_inicio"));
            Date data_final = (Date) formataData.parse(request.getParameter("data_final"));

            Pedido_DAO dao = new Pedido_DAO();
            ArrayList<Pedido> pedidos = new ArrayList<>();
            PrintWriter out = response.getWriter();

            try {
                pedidos = dao.listarPorData(data_inicial, data_final);
            } catch (java.lang.Exception ex) {
                ex.getMessage();
            }

            request.setAttribute("pedidosData", pedidos);
            request.getRequestDispatcher("ListaPedidoPorDatas.jsp").forward(request, response);

        } catch (ParseException ex) {
            ex.getMessage();
        }
    }
}
