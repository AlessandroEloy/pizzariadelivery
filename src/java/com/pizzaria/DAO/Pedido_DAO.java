/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Cliente;
import com.pizzaria.modelo.Endereco;
import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.ItemPedido;
import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.Produto;
import com.pizzaria.modelo.StatusPedido;
import com.pizzaria.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Alessandro
 */
public class Pedido_DAO {

    public Pedido cadastrarPedido(Pedido pedido) throws SQLException {
        Connection con = null;
        //o ultimo parametro da variavel SQL (valortotal) = 0;
        String sql = "INSERT INTO pedido (observacao, idCli, valortotal, data, status) VALUES (?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

        pstmt.setString(1, pedido.getObservacao());
        pstmt.setInt(2, pedido.getCliente().getId());
        pstmt.setDouble(3, pedido.getValorTotal());
        pstmt.setDate(4, new java.sql.Date(new Date().getTime()));
        pstmt.setString(5, pedido.getStatus().toString());
        pstmt.execute();

        ResultSet rsCodPedido = pstmt.getGeneratedKeys();
        if (rsCodPedido.next()) {

            pedido.setCod(rsCodPedido.getInt("cod"));// seta no pedido o id que foi gerado no banco

        }

        return pedido;

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
        pstmt.setString(2,pedido.getStatus().toString()); ;
        pstmt.setInt(3, pedido.getFuncionario().getId());
        pstmt.setString(4, pedido.getObservacao());
        pstmt.setDouble(5, pedido.getDesconto());
        pstmt.setBoolean(6, pedido.isEntrega());
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

    public ArrayList<ItemPedido> listar() throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<ItemPedido> listaPedidos = new ArrayList<>();
        //Conexao
        Connection con = Conecta_Banco.getConexao();
        //cria comando SQL
        String sql = "SELECT p.cod AS pcod, ip.cod AS ipcod, pr.cod AS prcod, ip.quantidade, ip.valoritem, "
                + "c.nome AS cnome , pr.nome AS prnome, "
                + "pr.valor, p.observacao, p.valortotal, p.* FROM pedido p INNER JOIN itempedido ip ON p.cod = ip.idpedido "
                + "INNER JOIN produto pr ON pr.cod = ip.codproduto INNER JOIN cliente c ON p.idcli = c.id";
        PreparedStatement pstmt = con.prepareStatement(sql);
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Pedido pedidos = new Pedido();
            Cliente cliente = new Cliente();
            ItemPedido itempedidos = new ItemPedido();
            Produto produto = new Produto();

            //seta os atributos do cliente com as informações do ResultSet
            itempedidos.setCod(rs.getInt("ipcod"));
            itempedidos.setQuantidade(rs.getInt("quantidade"));
            itempedidos.setValorItem(rs.getDouble("valoritem"));
            itempedidos.setPedido(pedidos);
            itempedidos.setProduto(produto);
            itempedidos.getPedido().setCliente(cliente);

            cliente.setNome(rs.getString("cnome"));

            produto.setCod(rs.getInt("prcod"));
            produto.setNome(rs.getString("prnome"));
            produto.setValor(rs.getDouble("valor"));

            pedidos.setCod(rs.getInt("pcod"));
            pedidos.setObservacao(rs.getString("observacao"));
            //pedidos.setDesconto(rs.getDouble("desconto"));
            //pedidos.setTaxaEntrega(rs.getDouble("taxaEntrega"));
            //pedidos.setTroco(rs.getDouble("troco"));
            pedidos.setValorTotal(rs.getDouble("valortotal"));
            pedidos.setData(rs.getDate("data"));
            pedidos.setStatus(StatusPedido.valueOf(rs.getString("status")));
                    
            listaPedidos.add(itempedidos);
        }
        return listaPedidos;
    }

    public Pedido buscar(int id) throws SQLException {
        Pedido pedido = new Pedido();

        try (Connection con = Conecta_Banco.getConexao()) {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM pedido p WHERE p.cod = ?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                //sets do pedido
                pedido.setCod(id);
                pedido.setData(rs.getDate("data"));
                pedido.setObservacao(rs.getString("observacao"));
                //pedido.setDesconto(rs.getDouble("desconto"));
                //pedido.setTaxaEntrega(rs.getDouble("taxaEntrega"));
                //pedido.setTroco(rs.getDouble("troco"));
                pedido.setValorTotal(rs.getDouble("valortotal"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pedido;
    }

    public ArrayList<Pedido> listarPedidoPorIdCliente(int id) throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<Pedido> listaPedido = new ArrayList<>();
        //Conexao
        Connection con = Conecta_Banco.getConexao();
        //cria comando SQL
        String sql = "SELECT p.* ,c.nome AS cnome FROM pedido p, cliente c WHERE c.id = p.idcli and c.id_user = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Pedido pedidos = new Pedido();
            Cliente cliente = new Cliente();

            cliente.setNome(rs.getString("cnome"));

            pedidos.setCod(rs.getInt("cod"));
            pedidos.setObservacao(rs.getString("observacao"));
            //pedidos.setDesconto(rs.getDouble("desconto"));
            //pedidos.setTaxaEntrega(rs.getDouble("taxaEntrega"));
            //pedidos.setTroco(rs.getDouble("troco"));
            pedidos.setValorTotal(rs.getDouble("valortotal"));
            pedidos.setData(rs.getDate("data"));
            pedidos.setCliente(cliente);
            pedidos.setStatus(StatusPedido.valueOf(rs.getString("status").trim()));
            listaPedido.add(pedidos);
        }
        return listaPedido;
    }
    
    public List<Pedido> listarPedidoPorStatus(String status) throws Exception{
        String sql = "SELECT * FROM pedido WHERE status = ?";
        
        Connection con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = con.prepareStatement(sql);
        
        pstmt.setString(1, status);
        
        ResultSet rs = pstmt.executeQuery();
        
        List<Pedido> pedidos = new ArrayList<>();
        
        while(rs.next()){
            Pedido pedido = new Pedido();
            
            pedido.setCod(rs.getInt("cod"));
            
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("idcli"));
            
            pedido.setCliente(cliente);
            
            Endereco endereco = new Endereco();
            endereco.setId(rs.getInt("endereco"));
            
            pedido.setEndereco(endereco);
            
            pedido.setData(rs.getDate("data"));
            
            pedidos.add(pedido);
        }
        
        return pedidos;
    }
}
