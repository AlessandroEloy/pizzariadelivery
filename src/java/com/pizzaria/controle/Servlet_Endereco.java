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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alessandro
 */
public class Servlet_Endereco extends HttpServlet {

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

        String rua = request.getParameter("rua");
        String referencia = request.getParameter("referencia");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("uf");
        String cep = request.getParameter("cep");

        PrintWriter out = response.getWriter();

        Endereco end = new Endereco();
        Endereco_DAO dao = new Endereco_DAO();
        HttpSession sessao = request.getSession();

        end.setRua(rua);
        end.setReferencias(referencia);
        end.setNumero(numero);
        end.setBairro(bairro);
        end.setCidade(cidade);
        end.setEstado(estado);
        end.setCep(cep);
        

        try {
            dao.cadastrarEndereco(end);
            request.setAttribute("endereco", end);
            Usuario usuario = (Usuario) sessao.getAttribute("usuarioLog");
            Cliente_DAO clidao = new Cliente_DAO();
            Cliente cliente = clidao.localizarPorId(usuario.getId());
            if (cliente.getEndereco() == null) {
                request.getRequestDispatcher("CadastroCliente.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            out.println("Erro: " + ex);

        } catch (ClassNotFoundException ex) {
            out.println("Erro: " + ex);
        }

    }
}
