/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Endereco;
import com.pizzaria.modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alessandro
 */
public class Endereco_DAO {
    public void cadastrarEndereco(Endereco endereco) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO Endereco (rua, cep, numero, bairro, cidade, estado, referencias ) VALUES (?,?,?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

        
        pstmt.setString(1, endereco.getRua());
        pstmt.setString(2, endereco.getCep());
        pstmt.setInt(3, endereco.getNumero());
        pstmt.setString(4, endereco.getBairro());
        pstmt.setString(5, endereco.getCidade());
        pstmt.setString(6, endereco.getEstado());
        pstmt.setString(7, endereco.getReferencias());
        pstmt.execute();
        ResultSet rsCodEndereco = pstmt.getGeneratedKeys();
        if (rsCodEndereco.next()) {
           endereco.setId(rsCodEndereco.getInt("id"));

        }
    }
}
