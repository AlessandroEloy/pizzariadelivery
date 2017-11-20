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
public class Servlet_Atualizar_Prod extends HttpServlet {

    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recupera os dados do formulario de atualizacao
              String cod = request.getParameter("cod");
              String nome = request.getParameter("nome");
              String ingredientes = request.getParameter("ingredientes");
              String valor = request.getParameter("valor");
             
              
              //seta os atributos de cliente
              Produto produtos = new Produto();
              produtos.setCod(Integer.parseInt(cod));
              produtos.setNome(nome);
              produtos.setIngredientes(ingredientes);
              produtos.setValor(Double.parseDouble(valor));
              
              //executa o metodo atualizar
             Produto_DAO proDAO = new Produto_DAO();
        try {
            //teste
            proDAO.atualizar(produtos);
            String mensagem = "Seus Produtos Foram Atulizados com Sucesso!";
            request.setAttribute("mensagem", mensagem);
            
            request.getRequestDispatcher("Servlet_Listar_Prod").forward(request, response);
            
        }catch (SQLException ex) {
            System.out.println("erro: "+ex);
        }
        //Envia mensagem de sucesso
        

              //Envia mensagem de sucesso
              
            }//fim do if atualizar
}
