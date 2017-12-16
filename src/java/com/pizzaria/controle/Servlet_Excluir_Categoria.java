/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Categoria_DAO;
import com.pizzaria.modelo.Categoria;
import java.io.IOException;
import java.sql.SQLException;
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
public class Servlet_Excluir_Categoria extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = Integer.parseInt(request.getParameter("cod"));

        Categoria_DAO daoCat = new Categoria_DAO();
        

        try {
            Categoria cat = new Categoria();
            

            cat = daoCat.localizarPorCod(cod); //localiza o cliente por id

            if (cat.isDisponivel() == true) {
                cat.setDisponivel(false);

            } else {
                cat.setDisponivel(true);

            }

            cat = daoCat.excluir(cat);

            if (cat.isDisponivel()) {
                String mensagem = "Categoria Ativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            } else {
                String mensagem = "Categoria Desativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}



