/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Categoria_DAO;
import com.pizzaria.modelo.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alessandro
 */
public class Servlet_Atualizar_Categoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //recupera os dados do formulario de atualizacao
        String cod = request.getParameter("cod");
        String categoria = request.getParameter("categoria");

        //seta os atributos de cliente
        Categoria cat = new Categoria();

        cat.setCod(Integer.parseInt(cod));
        cat.setCategoria(categoria);

        //executa o metodo atualizar
        Categoria_DAO catDAO = new Categoria_DAO();
        try {
            //          
            catDAO.atualizar(cat);
            String mensagem = "Os Dados da Categoria Foram Atulizados com Sucesso!";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("Servlet_Listar_Cat").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        //Envia mensagem de sucesso
        request.setAttribute("mensagem", "Os Dados da Categotia Foram Atulizados com Sucesso!!");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
