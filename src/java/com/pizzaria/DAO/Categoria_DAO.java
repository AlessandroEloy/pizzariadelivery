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
            //add na lista
            listaCategoria.add(categoria);
        }
        return listaCategoria;
    
    }  
}
