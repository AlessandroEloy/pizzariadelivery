package com.pizzaria.DAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.pizzaria.modelo.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Bruno nakamura
 */
public class Funcionario_DAO {

    public void cadastrarFunc(Funcionario funcionario) throws SQLException {
        Connection con = null;

        String sql = "INSERT INTO funcionario (funcao, nome, sexo, nascimento, telefone, rg, cpf, login, senha) VALUES (?,?,?,?,?,?,?,?,?)";
        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, funcionario.getFuncao());
        pstmt.setString(2, funcionario.getNome());
        pstmt.setString(3, funcionario.getSexo());
        pstmt.setString(4, funcionario.getNascimento());
        pstmt.setString(5, funcionario.getTelefone());
        pstmt.setString(6, funcionario.getRg());
        pstmt.setString(7, funcionario.getCpf());
        pstmt.setString(8, funcionario.getLogin());
        pstmt.setString(9, funcionario.getSenha());
        pstmt.execute();
    }

    public boolean atualizar(Funcionario funcionario) throws SQLException {
        Connection con = null;

        String sql = ("UPDATE funcionario SET funcao = ?, nome = ?, sexo = ?, nascimento = ?, telefone = ?, rg = ?, cpf = ? WHERE id =?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, funcionario.getFuncao());
        pstmt.setString(2, funcionario.getNome());
        pstmt.setString(3, funcionario.getSexo());
        pstmt.setString(4, funcionario.getNascimento());
        pstmt.setString(5, funcionario.getTelefone());
        pstmt.setString(6, funcionario.getRg());
        pstmt.setString(7, funcionario.getCpf());
        pstmt.setInt(8, funcionario.getId());
        pstmt.execute();

        return true;
    }

    public boolean excluir(String id) throws SQLException {
        Connection con = null;

        String sql = ("DELETE FROM funcionario WHERE id = ?");

        con = Conecta_Banco.getConexao();
        PreparedStatement pstmt = null;
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.execute();

        return true;
    }

    public ArrayList<Funcionario> listar() throws SQLException {

        ArrayList<Funcionario> listaFuncionario = new ArrayList<Funcionario>();

        Connection con = null;
        con = Conecta_Banco.getConexao();

        PreparedStatement pstmt = con.prepareStatement("SELECT id, funcao, nome, sexo, nascimento, telefone, rg, cpf from funcionario");

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {

            Funcionario funcionarios = new Funcionario();

            funcionarios.setId(rs.getInt("id"));
            funcionarios.setFuncao(rs.getString("funcao"));
            funcionarios.setNome(rs.getString("nome"));
            funcionarios.setSexo(rs.getString("sexo"));
            funcionarios.setNascimento(rs.getString("nascimento"));
            funcionarios.setTelefone(rs.getString("telefone"));
            funcionarios.setRg(rs.getString("rg"));
            funcionarios.setCpf(rs.getString("cpf"));

            listaFuncionario.add(funcionarios);
        }
        return listaFuncionario;
    }

    public Funcionario localizarPorId(String id) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection conexao = Conecta_Banco.getConexao();
        String sql = "select * from funcionario where id = ?";
        PreparedStatement pstmt = conexao.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(id));
        ResultSet resultado = pstmt.executeQuery();
        Funcionario funcionario = new Funcionario();
        while (resultado.next()) {
            funcionario.setId(resultado.getInt("id"));
            funcionario.setFuncao(resultado.getString("funcao"));
            funcionario.setNome(resultado.getString("nome"));
            funcionario.setSexo(resultado.getString("sexo"));
            funcionario.setNascimento(resultado.getString("nascimento"));
            funcionario.setTelefone(resultado.getString("telefone"));
            funcionario.setRg(resultado.getString("rg"));
            funcionario.setCpf(resultado.getString("cpf"));
        }
        return funcionario;
    }
}
