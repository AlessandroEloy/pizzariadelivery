/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author alessandro
 */
public class ItemPedido_DAO {

    public void cadastrar(ItemPedido item) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO itempedido ( codproduto, quantidade, valoritem, idpedido) VALUES (?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, item.getProduto().getCod());
        pstmt.setInt(2, item.getQuantidade());
        pstmt.setDouble(3, item.getValorItem());
        pstmt.setInt(4, item.getPedido().getCod());

        pstmt.execute();

    }

    public ArrayList<ItemPedido> listar(int id) throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<ItemPedido> listaPedidos = new ArrayList<>();
        //Conexao
        Connection con = Conecta_Banco.getConexao();
        //cria comando SQL
        String sql = "SELECT i.* FROM itempedido i, pedido p WHERE i.idpedido = p.cod AND p.cod = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            ItemPedido itempedidos = new ItemPedido();
            Pedido_DAO pdao = new Pedido_DAO();
            Produto_DAO prdao = new Produto_DAO();
            Produto produto = prdao.buscar(rs.getInt("codproduto"));
            
            //seta os atributos do cliente com as informações do ResultSet
            itempedidos.setCod(rs.getInt("cod"));
            itempedidos.setQuantidade(rs.getInt("quantidade"));
            itempedidos.setValorItem(rs.getDouble("valoritem"));
            itempedidos.setPedido(pdao.buscar(id));
            itempedidos.setProduto(produto);

            listaPedidos.add(itempedidos);
        }
        return listaPedidos;
    }

}
