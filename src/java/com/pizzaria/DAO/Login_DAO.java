/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

/**
 *
 * @author Bruno nakamura
 */

public class Login_DAO {
         
    public boolean logCliente(String login, String senha) throws SQLException{
        boolean existe = false;
        Connection con = null;
        con = Conecta_Banco.getConexao();
        String sql = "SELECT (login, senha) FROM cliente WHERE login = ? AND senha = ? AND disponivel = 'TRUE' ";
        PreparedStatement stmt;
        
        stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, senha);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            existe = true;
    }
        rs.close();
        stmt.close();
        con.close();
        
        return existe;
        
    }     
    
    public boolean logFuncionario(String login, String senha) throws SQLException{
        boolean existe = false;
        Connection con = null;
        con = Conecta_Banco.getConexao();
        String sql = "SELECT (login, senha) FROM funcionario WHERE login = ? AND senha = ? AND funcao = 'balconista' AND disponivel = 'TRUE'";
        PreparedStatement stmt;
        
        stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, senha);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            existe = true;
    }
        rs.close();
        stmt.close();
        con.close();
        
        return existe;
        
    }      
    
    public boolean logGerente(String login, String senha) throws SQLException{
        boolean existe = false;
        Connection con = null;
        con = Conecta_Banco.getConexao();
        String sql = "SELECT (login, senha) FROM funcionario WHERE login = ? AND senha = ? AND funcao = 'gerente' AND disponivel = 'TRUE'";
        PreparedStatement stmt;
        
        stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, senha);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            existe = true;
    }
        rs.close();
        stmt.close();
        con.close();
        
        return existe;
        
    }   
     
}
