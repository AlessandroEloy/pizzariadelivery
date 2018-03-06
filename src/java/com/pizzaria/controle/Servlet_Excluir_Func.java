/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro
 */
public class Servlet_Excluir_Func extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Funcionario_DAO dao = new Funcionario_DAO();
        Usuario_DAO daoUsuario = new Usuario_DAO();

        try {
            Funcionario funcionario = new Funcionario();
            Usuario usuario = new Usuario();

            funcionario = dao.localizarPorId(id);//localiza o cliente por id

            usuario = funcionario.getUsuario(); //insere objeto usuario de funcionario em usuario

            if (funcionario.isDisponivel() == true) {
                funcionario.setDisponivel(false);
//                usuario.setDisponivel(false);
            } else {
                funcionario.setDisponivel(true);
//                usuario.setDisponivel(true);
            }

 //           daoUsuario.excluir(usuario);
            dao.excluir(funcionario);

            if (funcionario.isDisponivel()) {
                String mensagem = "Cliente Ativado com Sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("MenuGerente.jsp").forward(request, response);
            } else {
                String mensagem = "Cliente Desativado com Sucesso";
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
