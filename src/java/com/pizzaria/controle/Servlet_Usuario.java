/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Cliente;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro
 */
public class Servlet_Usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
            

        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        
        PrintWriter out = response.getWriter();
        
        Usuario usuario = new Usuario();
        Usuario_DAO dao = new Usuario_DAO();
 
        

        usuario.setLogin(login);
        usuario.setSenha(senha);
        usuario.setPerfil(1); // Usuario Cliente sempre recebe 1 no perfil
 
        try {
            
                dao.cadastrarUsuario(usuario);
                String mensagem = "Cadastro Realizado Com Sucesso";
                request.setAttribute("mensagem",mensagem);
                request.getRequestDispatcher("Login_index.jsp").forward(request, response);
 
        } catch (SQLException ex) {
            out.println("Erro: "+ex);
        
        }   

        
    }
}
