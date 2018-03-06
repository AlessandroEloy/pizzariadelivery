
package com.pizzaria.controle;

import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno nakamura
 */
public class Servlet_Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String login = request.getParameter("Login");
        String senha = request.getParameter("Senha");
        
        Usuario_DAO dao = new Usuario_DAO();
        
        Usuario usuario = new Usuario();
        usuario.setLogin(login);
        usuario.setSenha(senha);
        try {
            usuario = dao.logar(usuario);
          if (usuario.getPerfil() ==1)  {
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuCliente.jsp");
          }
          else if (usuario.getPerfil() ==2) {
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuFuncionario.jsp");
          }
          else if (usuario.getPerfil() ==3) {
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuGerente.jsp");              
          }
          else {
                String mensagem = "Usuário ou Senha incorretos, Tente Novamente...";
                request.setAttribute("mensagem",mensagem);
                request.getRequestDispatcher("Login_index.jsp").forward(request, response);
          }
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Login.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }


}
