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
        String sql = "INSERT INTO pedido (observacao, idCli, endereco, valortotal, data, status) VALUES (?,?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

        pstmt.setString(1, pedido.getObservacao());
        pstmt.setInt(2, pedido.getCliente().getId());
        pstmt.setInt(3, pedido.getCliente().getEndereco().getId());
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

    public boolean atualizarStatus(Pedido pedido) throws SQLException {
        Connection con = null;

        String sql = "UPDATE pedido SET status = ? WHERE COD = ? ";

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        
        pstmt.setString(1, pedido.getStatus().toString());
        pstmt.setInt(2, pedido.getCod());
        
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

    public Pedido buscar(int cod) throws SQLException {
        Pedido pedido = new Pedido();

        try (Connection con = Conecta_Banco.getConexao()) {
            PreparedStatement pstmt = con.prepareStatement("SELECT p.*, c.*, f.*, u.* FROM pedido p, cliente c, funcionario f, usuario u WHERE p.idcli = c.id AND c.id_user = u.id AND p.cod = ?");
            pstmt.setInt(1, cod);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                //sets do pedido
                pedido.setCod(cod);
                pedido.setData(rs.getDate("data"));
                pedido.setObservacao(rs.getString("observacao"));
                pedido.setDesconto(rs.getDouble("desconto"));
                pedido.setTaxaEntrega(rs.getDouble("taxaEntrega"));
                pedido.setTroco(rs.getDouble("troco"));
                pedido.setValorTotal(rs.getDouble("valortotal"));
                
                Cliente cliente = new Cliente();
                Usuario usuario = new Usuario();
                cliente.setUsuario(usuario);
                cliente.getUsuario().setId(rs.getInt("id_user"));
                pedido.setCliente(cliente);
                
                pedido.setStatus(StatusPedido.valueOf(rs.getString("status").trim()));
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

    public List<Pedido> listarPedidoPorStatus(String status) throws Exception {
        String sql = "SELECT p.*, c.*, e.* FROM pedido p, cliente c, endereco e WHERE p.idcli = c.id AND p.endereco = e.id AND status = ?";

        Connection con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = con.prepareStatement(sql);

        pstmt.setString(1, status);

        ResultSet rs = pstmt.executeQuery();

        List<Pedido> pedidos = new ArrayList<>();

        while (rs.next()) {
            Pedido pedido = new Pedido();

            pedido.setCod(rs.getInt("cod"));

            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("idcli"));
            cliente.setNome(rs.getString("nome"));
            pedido.setCliente(cliente);

            Endereco endereco = new Endereco();
            endereco.setId(rs.getInt("endereco"));
            pedido.setEndereco(endereco);

            pedido.setData(rs.getDate("data"));
            pedido.setValorTotal(rs.getDouble("valorTotal"));
            pedido.setDesconto(rs.getDouble("desconto"));

            pedidos.add(pedido);
        }

        return pedidos;
    }
    
    public ArrayList<Pedido> listarPorData(Date data_inicio, Date data_fim) throws Exception {
        Connection con = Conecta_Banco.getConexao();
        String sql = "SELECT p.*, c.*, e.* FROM pedido p, cliente c, endereco e WHERE p.idcli = c.id AND p.endereco = e.id AND ( p.data BETWEEN ? AND ?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        
        java.sql.Date data_inicial = new java.sql.Date(data_inicio.getTime());
        java.sql.Date data_final = new java.sql.Date(data_fim.getTime());
        pstmt.setDate(1, data_inicial);
        pstmt.setDate(2, data_final);

        ResultSet rs = pstmt.executeQuery();

        ArrayList<Pedido> pedidosData = new ArrayList<>();

        while (rs.next()) {
            Pedido pedido = new Pedido();

            pedido.setCod(rs.getInt("cod"));

            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("idcli"));
            cliente.setNome(rs.getString("nome"));
            pedido.setCliente(cliente);

            Endereco endereco = new Endereco();
            endereco.setId(rs.getInt("endereco"));
            pedido.setEndereco(endereco);

            pedido.setData(rs.getDate("data"));
            pedido.setValorTotal(rs.getDouble("valorTotal"));
            pedido.setDesconto(rs.getDouble("desconto"));
            
            pedido.setStatus(StatusPedido.valueOf(rs.getString("status").trim()));

            pedidosData.add(pedido);
        }

        return pedidosData;
    }
}
