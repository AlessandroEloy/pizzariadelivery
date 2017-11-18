/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.pizzaria.DAO.Funcionario_DAO;
import com.pizzaria.modelo.Funcionario;
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
 * @author Alessandro
 */
public class Servlet_Atualizar_Func extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recupera os dados do formulario de atualizacao
        String id = request.getParameter("id");
        String funcao = request.getParameter("funcao");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        String telefone = request.getParameter("telefone");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");

        //seta os atributos de cliente
        Funcionario funcionario = new Funcionario();
        
        funcionario.setId(Integer.parseInt(id));
        funcionario.setFuncao(funcao);
        funcionario.setNome(nome);
        funcionario.setSexo(sexo);
        funcionario.setNascimento(nascimento);
        funcionario.setTelefone(telefone);
        funcionario.setRg(rg);
        funcionario.setCpf(cpf);

        //executa o metodo atualizar
        Funcionario_DAO funDAO = new Funcionario_DAO();
        try {
            //
            funDAO.atualizar(funcionario);
            funDAO.localizarPorId(id);
            String mensagem = "Os Dados do Funcionário Foram Atulizados com Sucesso!";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);

        } catch (SQLException ex) {
            System.out.println("erro: " + ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet_Atualizar_Func.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Envia mensagem de sucesso
        request.setAttribute("mensagem", "Os Dados do Funcionário Foram Atulizados com Sucesso!!");
    }//fim do if atualizar
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recupera os dados do formulario de atualizacao
        String id = request.getParameter("id");
        String funcao = request.getParameter("funcao");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        String telefone = request.getParameter("telefone");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");

        //seta os atributos de cliente
        Funcionario funcionario = new Funcionario();
        
        funcionario.setId(Integer.parseInt(id));
        funcionario.setFuncao(funcao);
        funcionario.setNome(nome);
        funcionario.setSexo(sexo);
        funcionario.setNascimento(nascimento);
        funcionario.setTelefone(telefone);
        funcionario.setRg(rg);
        funcionario.setCpf(cpf);

        //executa o metodo atualizar
        Funcionario_DAO funDAO = new Funcionario_DAO();
        try {
            //
            funDAO.atualizar(funcionario);
            funDAO.localizarPorId(id);
            String mensagem = "Os Dados do Funcionário Foram Atulizados com Sucesso!";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("Atualizar_Funcionario.jsp").forward(request, response);

        } catch (SQLException ex) {
            System.out.println("erro: " + ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet_Atualizar_Func.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Envia mensagem de sucesso
        request.setAttribute("mensagem", "Os Dados do Funcionário Foram Atulizados com Sucesso!!");
    }//fim do if atualizar
}