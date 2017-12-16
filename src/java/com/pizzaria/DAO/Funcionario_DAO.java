package com.pizzaria.DAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.pizzaria.modelo.Funcionario;
import com.pizzaria.modelo.Usuario;
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

        String sql = "INSERT INTO funcionario (funcao, nome, sexo, nascimento, telefone, rg, cpf, id_user) VALUES (?,?,?,?,?,?,?,?)";
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
        pstmt.setInt(8, funcionario.getUsuario().getId());
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

    public Funcionario excluir(Funcionario funcionario) throws SQLException {
        Connection con = Conecta_Banco.getConexao();
        String sql = ("UPDATE funcionario SET disponivel = ? WHERE id = ?");
        PreparedStatement pstmt = con.prepareStatement(sql);

        pstmt.setBoolean(1, funcionario.isDisponivel());
        pstmt.setInt(2, funcionario.getId());
        pstmt.execute();

        return funcionario;
    }

    public ArrayList<Funcionario> listar() throws SQLException {

        ArrayList<Funcionario> listaFuncionario = new ArrayList<Funcionario>();

        Connection con = null;
        con = Conecta_Banco.getConexao();

        PreparedStatement pstmt = con.prepareStatement("SELECT id, funcao, nome, sexo, nascimento, telefone, rg, cpf, disponivel from funcionario");

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
            funcionarios.setDisponivel(rs.getBoolean("disponivel"));

            listaFuncionario.add(funcionarios);
        }
        return listaFuncionario;
    }

    public Funcionario localizarPorId(int id) throws SQLException, ClassNotFoundException {
        //Cria conexao com DB
        Connection conexao = Conecta_Banco.getConexao();
        String sql = "select * from funcionario id where id = ?";
        PreparedStatement pstmt = conexao.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet resultado = pstmt.executeQuery();
        Funcionario funcionario = new Funcionario();
        Usuario usuario = new Usuario();

        while (resultado.next()) {
            funcionario.setId(resultado.getInt("id"));
            funcionario.setFuncao(resultado.getString("funcao"));
            funcionario.setNome(resultado.getString("nome"));
            funcionario.setSexo(resultado.getString("sexo"));
            funcionario.setNascimento(resultado.getString("nascimento"));
            funcionario.setTelefone(resultado.getString("telefone"));
            funcionario.setRg(resultado.getString("rg"));
            funcionario.setCpf(resultado.getString("cpf"));
            funcionario.setDisponivel(resultado.getBoolean("disponivel"));

            //usuario.setId(resultado.getInt("uid"));
            //usuario.setDisponivel(resultado.getBoolean("udisponivel"));
        }

        return funcionario;
    }
}
