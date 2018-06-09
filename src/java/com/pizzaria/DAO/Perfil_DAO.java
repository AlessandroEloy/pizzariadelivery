/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Perfil;
import com.pizzaria.modelo.Perfil.Nivel_Acesso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alessandro_Eloy
 */
public class Perfil_DAO {

    public void CadastrarPerfil(Perfil perfil) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO perfil (acesso) VALUES (?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, perfil.getAcesso());


        pstmt.execute();

    }

    public boolean Atualizar(Perfil perfil) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE perfil SET acesso = ? WHERE id = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, perfil.getAcesso());
        pstmt.setInt(2, perfil.getId());
        pstmt.execute();

        return true;
    }

    public ArrayList<Perfil> Listar() throws SQLException {

        //criar uma array de obj Cliente
        ArrayList<Perfil> listaPerfil = new ArrayList<Perfil>();
        //Conexao
        Connection con = null;
        con = Conecta_Banco.getConexao();
        //cria comando SQL
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM perfil");
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Perfil perfil = new Perfil();
            //seta os atributos do cliente com as informações do ResultSet
            perfil.setId(rs.getInt("id"));
            perfil.setAcesso(rs.getString("acesso"));
            perfil.setNivel_acesso(Nivel_Acesso.valueOf(rs.getString("nivel_acesso")));
            //add na lista
            listaPerfil.add(perfil);
        }
        return listaPerfil;

    }

    public Perfil LocalizarPorCod(int id) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection con = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM perfil id WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        Perfil perfil = new Perfil();

        while (rs.next()) {

            perfil.setId(rs.getInt("id"));
            perfil.setAcesso(rs.getString("acesso"));

        }
        return perfil;
    }
}
