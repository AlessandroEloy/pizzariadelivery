/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Perfil;
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

    public Usuario logar(Usuario usuario) throws SQLException {
        Connection con = null;
        con = Conecta_Banco.getConexao();
        String sql = "SELECT u.*, p.id AS pid FROM usuario u , perfil p WHERE login = ? AND senha = ? AND u.perfil = p.id ";
        PreparedStatement stmt;

        stmt = con.prepareStatement(sql);
        stmt.setString(1, usuario.getLogin());
        stmt.setString(2, usuario.getSenha());

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            //existe = true;
            usuario.setId(rs.getInt("id"));
            Perfil perfil = new Perfil();
            perfil.setId(rs.getInt("pid"));
            usuario.setPerfil(perfil);
        }
        rs.close();
        stmt.close();
        con.close();

        return usuario;
    }

    public void cadastrarUsuario(Usuario usuario) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO Usuario (login, senha, perfil, disponivel) VALUES (?,?,?,?) returning id";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, usuario.getLogin());
        pstmt.setString(2, usuario.getSenha());
        pstmt.setInt(3, usuario.getPerfil().getId());
        pstmt.setBoolean(4, usuario.isDisponivel());
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
        String sql = "SELECT *FROM usuario WHERE login = ? ";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, usuarioLog.getLogin());
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            usuarioLog.setLogin(rs.getString("login"));
            usuarioLog.setSenha(rs.getNString("senha"));
            usuarioLog.setId(rs.getInt("id"));

            Perfil perfil = new Perfil();
            perfil.setId(rs.getInt("pid"));
            usuarioLog.setPerfil(perfil);
        }
        con.close();
        rs.close();
        stmt.close();

        System.out.println("Encontrado com sucesso!!");

        return usuarioLog;
    }

    public Usuario excluir(Usuario usuario) throws SQLException {

        Connection con = Conecta_Banco.getConexao();
        String sql = "UPDATE usuario SET disponivel = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setBoolean(1, usuario.isDisponivel());
        ps.setInt(2, usuario.getId());

        ps.execute();

        return usuario;
    }

    public String validar_login(String login) throws SQLException {

        Connection con = Conecta_Banco.getConexao();
        String sql = "SELECT login FROM usuario WHERE login = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, login);
        ResultSet rs = ps.executeQuery();
        String valor = null;

        if (rs.next()) {
            valor = rs.getString("login");
        }
        return valor;
    }

}
