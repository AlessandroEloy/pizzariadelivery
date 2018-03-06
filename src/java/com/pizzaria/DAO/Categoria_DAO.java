/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Alessandro
 */
public class Categoria_DAO extends HttpServlet {

    public void cadastrarCategoria(Categoria categoria) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO categoria (categoria) VALUES (?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, categoria.getCategoria());

        pstmt.execute();

    }

    public boolean atualizar(Categoria categoria) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE categoria SET categoria = ? WHERE cod = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, categoria.getCategoria());
        pstmt.setInt(2, categoria.getCod());
        pstmt.execute();

        return true;
    }

    public Categoria excluir(Categoria categoria) throws SQLException {
        Connection con = Conecta_Banco.getConexao();
        String sql = ("UPDATE categoria SET disponivel = ? WHERE cod = ?");
        PreparedStatement pstmt = con.prepareStatement(sql);

        pstmt.setBoolean(1, categoria.isDisponivel());
        pstmt.setInt(2, categoria.getCod());
        pstmt.execute();

        return categoria;
    }

    public ArrayList<Categoria> listar() throws SQLException {

        //criar uma array de obj Cliente
        ArrayList<Categoria> listaCategoria = new ArrayList<Categoria>();
        //Conexao
        Connection con = null;
        con = Conecta_Banco.getConexao();
        //cria comando SQL
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM categoria");
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Categoria categoria = new Categoria();
            //seta os atributos do cliente com as informações do ResultSet
            categoria.setCod(rs.getInt("cod"));
            categoria.setCategoria(rs.getString("categoria"));
            categoria.setDisponivel(rs.getBoolean("disponivel"));
            //add na lista
            listaCategoria.add(categoria);
        }
        return listaCategoria;

    }

    public Categoria localizarPorCod(int cod) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection con = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM categoria cod WHERE cod = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, cod);
        ResultSet rs = pstmt.executeQuery();
        Categoria cat = new Categoria();

        while (rs.next()) {

            cat.setCod(rs.getInt("cod"));
            cat.setCategoria(rs.getString("categoria"));
            cat.setDisponivel(rs.getBoolean("disponivel"));

        }
        return cat;
    }
}
