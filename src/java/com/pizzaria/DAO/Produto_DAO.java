/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Categoria;
import com.pizzaria.modelo.Usuario;
import com.pizzaria.modelo.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author bruno nakamura
 */
public class Produto_DAO {

    public void cadastrarProduto(Produto produto) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO produto (codcat, nome, ingredientes, valor, id_user) VALUES (?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, produto.getCategoria().getCod());
        pstmt.setString(2, produto.getNome());
        pstmt.setString(3, produto.getIngredientes());
        pstmt.setDouble(4, produto.getValor());
        pstmt.setInt(5, produto.getUsuario().getId());
        
        pstmt.execute();

    }

    public boolean atualizar(Produto produto) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE produto SET nome = ?, ingredientes = ?, valor = ? WHERE cod = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

       // pstmt.setInt(1, produto.getCategoria().getCod());
        pstmt.setString(1, produto.getNome());
        pstmt.setString(2, produto.getIngredientes());
        pstmt.setDouble(3, produto.getValor());
        pstmt.setInt(4, produto.getCod());
        pstmt.execute();

        return true;
    }

    public boolean excluir(String id) throws SQLException {
        Connection con = null;

        String sql = ("DELETE FROM produto WHERE cod = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.execute();

        return true;
    }

    public ArrayList<Produto> listar() throws SQLException {
        //criar uma array de obj Cliente
        ArrayList<Produto> listaProdutos = new ArrayList<>();
        //Conexao
        Connection con = Conecta_Banco.getConexao();
        //cria comando SQL
        String sql = "SELECT p.cod AS pcod,p.codcat, p.nome AS pnome,p.ingredientes,p.valor,"
                + "u.login AS ulogin,"
                + "c.categoria "
                + "from produto p "
                + "INNER JOIN usuario u "
                + "ON u.id = p.id_user "
                + "INNER JOIN categoria c "
                + "ON p.codcat = c.cod";
        PreparedStatement pstmt = con.prepareStatement(sql);
        //executa
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            //a cada loop
            Produto produtos = new Produto();
            Categoria categoria = new Categoria();
            Usuario user = new Usuario();

            //seta os atributos do cliente com as informações do ResultSet
            categoria.setCod(rs.getInt("codcat"));
            categoria.setCategoria(rs.getString("categoria"));

            user.setLogin(rs.getString("ulogin"));

            produtos.setCod(rs.getInt("pcod"));
            produtos.setCategoria(categoria);
            produtos.setUsuario(user);
            produtos.setNome(rs.getString("pnome"));
            produtos.setIngredientes(rs.getString("ingredientes"));
            produtos.setValor(rs.getDouble("valor"));

            //add na lista
            listaProdutos.add(produtos);
        }
        return listaProdutos;
    }

    public Produto localizarPorCod(int cod) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection conexao = Conecta_Banco.getConexao();
        String sql = "SELECT p.cod AS pcod, c.cod AS ccod, u.login AS ulogin, p.nome AS pnome, * FROM produto p "
                + "INNER JOIN categoria c "
                + "ON c.cod = p.codcat "
                + "INNER JOIN usuario u "
                + "ON f.id = p.id_user "
                + "WHERE p.cod = ?";
        PreparedStatement pstmt = conexao.prepareStatement(sql);
        pstmt.setInt(1, cod);
        ResultSet rs = pstmt.executeQuery();
        Produto p = new Produto();
        Categoria c = new Categoria();
        Usuario u = new Usuario();
        while (rs.next()) {
            
            c.setCod(rs.getInt("ccod"));
            c.setCategoria(rs.getString("categoria"));
            p.setCategoria(c);
            
            u.setId(rs.getInt("id"));
            u.setLogin(rs.getString("ulogin"));
            p.setUsuario(u);
            
            p.setCod(rs.getInt("pcod"));
            p.setNome(rs.getString("pnome"));
            p.setIngredientes(rs.getString("ingredientes"));
            p.setValor(rs.getDouble("valor"));

        }
        return p;
    }
}