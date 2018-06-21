/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Pedido_DAO;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.StatusPedido;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alessandro Eloy
 */
public class Servlet_Atualizar_Status extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        Pedido_DAO dao = new Pedido_DAO();
        Pedido pedidos = new Pedido();
        HttpSession session = request.getSession();

        Usuario usuario = new Usuario();
        usuario = (Usuario) session.getAttribute("usuarioLog");

        PrintWriter out = response.getWriter();
        try {
            pedidos = dao.buscar(cod);

            if (usuario.getPerfil().getId() == 1 && pedidos.getCliente().getUsuario().getId() == usuario.getId()) {
                if (pedidos.getStatus().equals(StatusPedido.APROVADO)) {
                    pedidos.setStatus(StatusPedido.CANCELADO);
                    dao.atualizarStatus(pedidos);
                    request.getRequestDispatcher("Pedido.jsp").forward(request, response);
                }
            } else if (usuario.getPerfil().getId() == 4) {
                if (pedidos.getStatus().equals(StatusPedido.APROVADO)) {
                    pedidos.setStatus(StatusPedido.PREPARANDO);
                    dao.atualizarStatus(pedidos);
                    request.getRequestDispatcher("Servlet_Listar_Pedidos").forward(request, response);
                }
            } else if (usuario.getPerfil().getId() == 3) {
                if (pedidos.getStatus().equals(StatusPedido.APROVADO)) {
                    pedidos.setStatus(StatusPedido.PREPARANDO);
                    dao.atualizarStatus(pedidos);
                    request.getRequestDispatcher("Servlet_Listar_Pedidos").forward(request, response);
                } else if (pedidos.getStatus().equals(StatusPedido.PREPARANDO)) {
                    pedidos.setStatus(StatusPedido.ENVIANDO);
                    dao.atualizarStatus(pedidos);
                    request.getRequestDispatcher("Servlet_Listar_Pedidos").forward(request, response);
                } else if (pedidos.getStatus().equals(StatusPedido.ENVIANDO)) {
                    pedidos.setStatus(StatusPedido.ENTREGUE);
                    dao.atualizarStatus(pedidos);
                    request.getRequestDispatcher("Servlet_Listar_Pedidos").forward(request, response);
                } else if (pedidos.getStatus().equals(StatusPedido.ENTREGUE)) {
                    String mensagem = "Pedido Já Entregue";
                    request.setAttribute("mensagem", mensagem);
                    request.getRequestDispatcher("Servlet_Listar_Pedidos").forward(request, response);

                }
            } else {
                throw new Exception("Valor informado não existe !");

            }
            response.getWriter().write(new Gson().toJson(pedidos));
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
