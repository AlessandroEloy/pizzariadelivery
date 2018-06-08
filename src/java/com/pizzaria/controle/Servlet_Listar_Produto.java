/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Produto_DAO;
import com.pizzaria.modelo.Produto;
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

/**
 *
 * @author Alessandro
 */
public class Servlet_Listar_Produto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Produto_DAO daoProduto = new Produto_DAO();
        List<Produto> produtos = new ArrayList<>();
        try {
            produtos = daoProduto.listarProdutosDisponiveis();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        response.getWriter().write(new Gson().toJson(produtos));
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //cria lista
        Produto_DAO DAO = new Produto_DAO();
        //executa o método listar
        ArrayList<Produto> produtos = new ArrayList<>();
        PrintWriter out = response.getWriter();
        try {
            produtos = DAO.listarTodosProdutos();
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        //add a lista no objeto request
        request.setAttribute("listaProdutos", produtos);
        //encaminha o request para o jsp
        request.getRequestDispatcher("listaProdutos.jsp").forward(request, response);
    }
}
