/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.pizzaria.modelo.Cliente;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author bruno nakamura
 */
public class Cliente_DAO {

    public void cadastrarCliente(Cliente cliente) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO cliente (nome, sexo, nascimento, telefone, rg, cpf, id_user) VALUES (?,?,?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, cliente.getNome());
        pstmt.setString(2, cliente.getSexo());
        pstmt.setString(3, cliente.getNascimento());
        pstmt.setString(4, cliente.getTelefone());
        pstmt.setString(5, cliente.getRg());
        pstmt.setString(6, cliente.getCpf());
        pstmt.setInt(7, cliente.getUsuario().getId());
        pstmt.execute();

    }

    public boolean atualizar(Cliente cliente) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE cliente SET nome = ?, sexo = ?, nascimento = ?, telefone = ?, rg = ?, cpf = ? WHERE id_user =?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, cliente.getNome());
        pstmt.setString(2, cliente.getSexo());
        pstmt.setString(3, cliente.getNascimento());
        pstmt.setString(4, cliente.getTelefone());
        pstmt.setString(5, cliente.getRg());
        pstmt.setString(6, cliente.getCpf());
        pstmt.setInt(7, cliente.getId());
        pstmt.execute();

        return true;
    }

    public boolean excluir(String id) throws SQLException {
        Connection con = null;

        String sql = ("DELETE FROM cliente WHERE id = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.execute();

        return true;
    }

    public ArrayList<Cliente> listar() throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<Cliente> listaCliente = new ArrayList<Cliente>();
        //Conexao
        Connection con = null;
        con = Conecta_Banco.getConexao();
        //cria comando SQL
        PreparedStatement pstmt = con.prepareStatement("SELECT c.id, c.nome, c.sexo, c.nascimento, c.telefone, c.rg, c.cpf FROM cliente c, usuario u WHERE c.id_user = u.id");
            //executa
            ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Cliente clientes = new Cliente();
            //seta os atributos do cliente com as informações do ResultSet
            clientes.setId(rs.getInt("id"));
            clientes.setNome(rs.getString("nome"));
            clientes.setSexo(rs.getString("sexo"));
            clientes.setNascimento(rs.getString("nascimento"));
            clientes.setTelefone(rs.getString("telefone"));
            clientes.setRg(rs.getString("rg"));
            clientes.setCpf(rs.getString("cpf"));
            //add na lista
            listaCliente.add(clientes);
        }
        return listaCliente;
    }
    public Cliente localizarPorId(int id) throws SQLException, ClassNotFoundException{
        //Cria conexao com DB
        Connection conexao = Conecta_Banco.getConexao();
        String sql = "SELECT * FROM cliente where id_user = ?";
        PreparedStatement pstmt = conexao.prepareStatement(sql);
        pstmt.setInt(1,id);
        ResultSet resultado = pstmt.executeQuery();
        Cliente cliente = new Cliente();
        while(resultado.next()){
            cliente.setId(resultado.getInt("id"));
            cliente.setNome(resultado.getString("nome"));
            cliente.setSexo(resultado.getString("sexo"));
            cliente.setNascimento(resultado.getString("nascimento"));
            cliente.setTelefone(resultado.getString("telefone"));
            cliente.setRg(resultado.getString("rg"));
            cliente.setCpf(resultado.getString("cpf"));
        }
        return cliente;
    }
}
