/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Produto_DAO;
import com.pizzaria.modelo.Produto;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Excluir_Prod extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("cod"));

        Produto_DAO dao = new Produto_DAO();

        Produto produto = new Produto();
        try {
            produto = dao.localizarPorCod(cod); //localiza o Produto pelo COD

            if (produto.isDisponivel() == true) {
                
                produto.setDisponivel(false);

            } else {
                produto.setDisponivel(true);

            }
            produto = dao.excluir(produto);

            if (produto.isDisponivel()) {
                String mensagem = "Produto Ativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            } else {
                String mensagem = "Produto Desativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            response.getWriter().println(ex);
        }
    }
}
