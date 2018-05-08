/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Cliente_DAO;
import com.pizzaria.DAO.Endereco_DAO;
import com.pizzaria.modelo.Cliente;
import com.pizzaria.modelo.Endereco;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "Servlet_Cliete", urlPatterns = {"/Servlet_Cliete"})
public class Servlet_Cliente extends HttpServlet {

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

        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        String telefone = request.getParameter("telefone");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        PrintWriter out = response.getWriter();

        Cliente cliente = new Cliente();
        Cliente_DAO dao = new Cliente_DAO();
        Endereco_DAO endao = new Endereco_DAO();
        HttpSession sessao = request.getSession();

        cliente.setNome(nome);
        cliente.setSexo(sexo);
        cliente.setNascimento(nascimento);
        cliente.setTelefone(telefone);
        cliente.setRg(rg);
        cliente.setCpf(cpf);
        cliente.setUsuario((Usuario) sessao.getAttribute("usuarioLog"));
        Endereco endereco = new Endereco();
        endereco.setId(Integer.parseInt(request.getParameter("idendereco")));
        cliente.setEndereco(endereco);

        try {

            dao.cadastrarCliente(cliente);
            

            request.getRequestDispatcher("Servlet_Carrinho&acao=finalizar").forward(request, response);

        } catch (SQLException ex) {
            out.println("Erro: " + ex);

        }
    }
}
