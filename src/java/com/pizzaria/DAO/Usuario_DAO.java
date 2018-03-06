/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Bruno nakamura
 */

public class Usuario_DAO {
         
    public Usuario logar(Usuario usuario) throws SQLException{
        Connection con = null;
        con = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM usuario WHERE login = ? AND senha = ? ";
        PreparedStatement stmt;
        
        stmt = con.prepareStatement(sql);
        stmt.setString(1, usuario.getLogin());
        stmt.setString(2, usuario.getSenha());
        
                
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            //existe = true;
            usuario.setId(rs.getInt("id"));
            usuario.setPerfil(rs.getInt("perfil"));
    }
        rs.close();
        stmt.close();
        con.close();
        
        return usuario;        
    }     
    public void cadastrarUsuario(Usuario usuario) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO Usuario (login, senha, perfil) VALUES (?,?,?) returning id";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);


        pstmt.setString(1, usuario.getLogin());
        pstmt.setString(2, usuario.getSenha());
        pstmt.setInt(3, usuario.getPerfil());
        ResultSet rs = pstmt.executeQuery();
        
         if (rs.next()) {
            usuario.setId(rs.getInt("id"));
        }
         
        pstmt.close();
        con.close();
    }
    public Usuario buscar_perfil(Usuario usuarioLog) throws SQLException {
        Connection con = null;
        
        con = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM usuario WHERE login = ? ";
        
         PreparedStatement stmt;
            stmt = con.prepareStatement(sql);          
            stmt.setString(1, usuarioLog.getLogin());
                
            ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            usuarioLog.setId(rs.getInt("id"));
            usuarioLog.setLogin(rs.getString("login"));
            usuarioLog.setSenha(rs.getNString("senha"));
            usuarioLog.setPerfil(rs.getInt("perfil"));            
        }
        con.close();
        rs.close();
        stmt.close();
        
        System.out.println("Encontrado com sucesso!!");
    
        return usuarioLog;
    }
    
    public Usuario excluir(Usuario usuario) throws SQLException{
        
        Connection con = Conecta_Banco.getConexao();
        String sql = "UPDATE usuario SET disponivel = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setBoolean(1, usuario.isDisponivel());
        ps.setInt(2, usuario.getId());
        
        ps.execute();
        
               
        return usuario;
    }
}

