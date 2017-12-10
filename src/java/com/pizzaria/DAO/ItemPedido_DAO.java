/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.ItemPedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author alessandro
 */
public class ItemPedido_DAO {
    public void cadastrar(ItemPedido item) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO itempedido (cod, codproduto, quantidade, valoritem, idpedido) VALUES (?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, item.getCod());
        pstmt.setInt(2, item.getProduto().getCod());
        pstmt.setInt(3, item.getQuantidade());
        pstmt.setDouble(4, item.getValorItem());
        pstmt.setInt(5, item.getPedido().getCod());
        
        pstmt.execute();

    }
}
