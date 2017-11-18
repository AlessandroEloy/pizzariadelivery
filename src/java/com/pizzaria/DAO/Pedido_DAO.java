/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alessandro
 */
public class Pedido_DAO {
    public void cadastrarPedido(Pedido pedido) throws SQLException {
        Connection con = null;
        //o ultimo parametro da variavel SQL (valortotal) = 0;
        String sql = "INSERT INTO pedido (cod, status, idFunc, observacao, desconto, entrega, "
                + "taxaEntrega, troco, endereco, idCli, valortotal) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);
        
        pstmt.setInt(1, pedido.getCod());
        pstmt.setBoolean(2, pedido.isStatus());
        pstmt.setInt(3, pedido.getFuncionario().getId());
        pstmt.setString(4, pedido.getObservacao());
        pstmt.setDouble(5, pedido.getDesconto());
        pstmt.setBoolean(6,pedido.isEntrega());
        pstmt.setDouble(7, pedido.getTaxaEntrega());
        pstmt.setDouble(8, pedido.getTroco());
        pstmt.setInt(9, pedido.getEndereco().getId());
        pstmt.setInt(10, pedido.getUsuario().getId());
        pstmt.setDouble(11,pedido.getValorTotal());
        pstmt.execute();
        
    }

    public boolean atualizar(Pedido pedido) throws SQLException {
        Connection con = null;

        String sql = "UPDATE pedido p SET p.cod = ?, p.status = ?, p.idFunc = ?, "
                + "p.observacao = ?, p.desconto = ?, p.entrega = ?, p.entrega = ?, p.taxaEntrega = ?, "
                + "p.troco = ?, p.endereco = ?, p.valortotal"
                + "INNER JOIN itempedido ip "
                + "ON p.cod = ip.idpedido "
                + "WHERE p.cod = ?";

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, pedido.getCod());
        pstmt.setBoolean(2, pedido.isStatus());
        pstmt.setInt(3, pedido.getFuncionario().getId());
        pstmt.setString(4, pedido.getObservacao());
        pstmt.setDouble(5, pedido.getDesconto());
        pstmt.setBoolean(6,pedido.isEntrega());
        pstmt.setDouble(7, pedido.getTaxaEntrega());
        pstmt.setDouble(8, pedido.getTroco());
        pstmt.setInt(9, pedido.getEndereco().getId());
        pstmt.setDouble(10, pedido.getValorTotal());
        pstmt.execute();

        return true;
    }

    public boolean excluir(String id) throws SQLException {
        Connection con = null;

        String sql = ("DELETE FROM pedido WHERE id = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.execute();

        return true;
    }

    public ArrayList<Pedido> listar() throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<Pedido> listaPedido = new ArrayList<>();
        //Conexao
        Connection con = Conecta_Banco.getConexao();
        //cria comando SQL
        String sql = "SELECT p.cod AS codigop, ip.cod AS codip "
                + "FROM pedido p inner join itempedido ip "
                + "ON ip.idpedido = p.cod where ip.idpedido = ?;";
        PreparedStatement pstmt = con.prepareStatement(sql);
            //executa
            ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
           Pedido pedidos = new Pedido();
           Funcionario funcionario = new Funcionario();
           Usuario usuario = new Usuario();
           ItemPedido itempedido = new ItemPedido();
           
            //seta os atributos do cliente com as informações do ResultSet
            itempedido.setCod(rs.getInt("cod"));
            itempedido.setQuantidade(rs.getInt("quantidade"));
            itempedido.setValorItem(rs.getDouble("valorItem"));
            
            funcionario.setNome(rs.getString("fnome"));
            
            usuario.setLogin(rs.getString("login"));
            
           
            pedidos.addItem(itempedido);
            pedidos.setFuncionario(funcionario);
            pedidos.setUsuario(usuario);
            pedidos.setDesconto(rs.getDouble("desconto"));
            pedidos.setTaxaEntrega(rs.getDouble("taxaEntrega"));
            pedidos.setTroco(rs.getDouble("troco"));
            pedidos.setValorTotal(rs.getDouble("valortotal"));      
           
            //add na lista
            listaPedido.add(pedidos);
        }
        return listaPedido;
    } 
}