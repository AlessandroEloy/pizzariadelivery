/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.modelo.Cliente;
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
 * @author alessandro.eloy
 */
public class Servlet_Atualizar extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
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
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        String telefone = request.getParameter("telefone");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");

        //seta os atributos de cliente
        Cliente cliente = new Cliente();
        cliente.setId(Integer.parseInt(id));
        cliente.setNome(nome);
        cliente.setSexo(sexo);
        cliente.setNascimento(nascimento);
        cliente.setTelefone(telefone);
        cliente.setRg(rg);
        cliente.setCpf(cpf);

        //executa o metodo atualizar
        Cliente_DAO cliDAO = new Cliente_DAO();
        try {
            //
            cliDAO.atualizar(cliente);
            String mensagem = "Seus Dados Foram Atulizados com Sucesso!";
            request.setAttribute("mensagem", mensagem);

            request.getRequestDispatcher("MenuCliente.jsp").forward(request, response);

        } catch (SQLException ex) {
            System.out.println("erro: " + ex);
        }

        //Envia mensagem de sucesso
    }//fim do if atualizar
}