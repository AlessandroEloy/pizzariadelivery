package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.StatusPedido;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletListarPedidoStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");

        Pedido_DAO pedidoDAO = new Pedido_DAO();
        List<Pedido> pedidos = new ArrayList<>();
        
        try {
            if (status.equals(StatusPedido.APROVADO.toString())) {
                pedidos = pedidoDAO.listarPedidoPorStatus(status);
            } else if (status.equals(StatusPedido.CANCELADO.toString())) {
                pedidos = pedidoDAO.listarPedidoPorStatus(status);
            } else if (status.equals(StatusPedido.ENTREGUE.toString())) {
                pedidos = pedidoDAO.listarPedidoPorStatus(status);
            } else if (status.equals(StatusPedido.ENVIANDO.toString())) {
                pedidos = pedidoDAO.listarPedidoPorStatus(status);
            } else if (status.equals(StatusPedido.PREPARANDO.toString())) {
                pedidos = pedidoDAO.listarPedidoPorStatus(status);
            } else {
                throw new Exception("Valor informado não existe !");
            }
            

            response.getWriter().write(new Gson().toJson(pedidos));
            
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
