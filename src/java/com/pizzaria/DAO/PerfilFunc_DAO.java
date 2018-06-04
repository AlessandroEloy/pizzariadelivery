/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.PerfilFunc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alessandro_Eloy
 */
public class PerfilFunc_DAO {

    public void CadastrarPerfilFunc(PerfilFunc perfil) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO perfilFunc (nivel_acesso, perfil) VALUES (?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, perfil.getAcesso());
        pstmt.setInt(2, perfil.getPerfil());

        pstmt.execute();

    }

    public boolean Atualizar(PerfilFunc perfil) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE categoria SET acesso = ? WHERE id = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, perfil.getAcesso());
        pstmt.setInt(2, perfil.getId());
        pstmt.execute();

        return true;
    }

    public ArrayList<PerfilFunc> Listar() throws SQLException {

        //criar uma array de obj Cliente
        ArrayList<PerfilFunc> listaPerfil = new ArrayList<PerfilFunc>();
        //Conexao
        Connection con = null;
        con = Conecta_Banco.getConexao();
        //cria comando SQL
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM categoria");
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            PerfilFunc perfil = new PerfilFunc();
            //seta os atributos do cliente com as informações do ResultSet
            perfil.setId(rs.getInt("id"));
            perfil.setAcesso(rs.getString("nivel_acesso"));
            perfil.setPerfil(rs.getInt("perfil"));
            //add na lista
            listaPerfil.add(perfil);
        }
        return listaPerfil;

    }

    public PerfilFunc LocalizarPorCod(int id) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection con = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM perfilFunc id WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        PerfilFunc perfil = new PerfilFunc();

        while (rs.next()) {

            perfil.setId(rs.getInt("id"));
            perfil.setAcesso(rs.getString("nivel_acesso"));
            perfil.setPerfil(rs.getInt("perfil"));

        }
        return perfil;
    }
}
