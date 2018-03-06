/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Categoria_DAO;
import com.pizzaria.DAO.Produto_DAO;
import com.pizzaria.modelo.Categoria;
import com.pizzaria.modelo.Produto;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bruno nakamura
 */
//@WebServlet(name = "Servlet_Produtos", urlPatterns = {"/Servlet_Produtos"})
public class Servlet_Produtos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Categoria> listaCategoria = new ArrayList<>();
        Categoria_DAO dao = new Categoria_DAO();
        try {
            listaCategoria = dao.listar();
            Gson gson = new Gson();
            String lista = gson.toJson(listaCategoria);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(lista);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Produtos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             response.setContentType("text/html;charset=UTF-8");
             
        String codcat = request.getParameter("categoria");
        String nome = request.getParameter("nome");
        String ingredientes = request.getParameter("ingredientes");
        double valor = (Double.parseDouble(request.getParameter("valor")));
        String user = request.getParameter("id");

        PrintWriter out = response.getWriter();

        Produto produto = new Produto();
        Produto_DAO dao = new Produto_DAO();
        HttpSession sessao = request.getSession();

        Categoria categoria = new Categoria();
        int codCat = Integer.parseInt(codcat);
        categoria.setCod(codCat);
        produto.setCategoria(categoria);
        produto.setNome(nome);
        produto.setIngredientes(ingredientes);
        produto.setValor(valor);
        Usuario usuario = new Usuario();
        int id_user = Integer.parseInt(user);
        usuario.setId(id_user);
        produto.setUsuario(usuario);

        try {

            dao.cadastrarProduto(produto);
            String mensagem = "Cadastro Realizado Com Sucesso";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);

        } catch (SQLException ex) {
            String mensagem = "Produto ja cadastrado ou invalido";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("CadProdutos.jsp").forward(request, response);
        }
    }
}
