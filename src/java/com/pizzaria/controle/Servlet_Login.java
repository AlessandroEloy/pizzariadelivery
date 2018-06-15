
package com.pizzaria.controle;

import com.pizzaria.DAO.Usuario_DAO;
import com.pizzaria.modelo.Usuario;
import com.pizzaria.modelo.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
          if (usuario.getPerfil().getId() == 1)  {
              HttpSession session = request.getSession();
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("Pedido.jsp");
          }
          else if (usuario.getPerfil().getId() ==2 ) {
              HttpSession session = request.getSession();
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuGerente.jsp");
          }
          else if (usuario.getPerfil().getId() ==3) {
              HttpSession session = request.getSession();
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuFuncionario.jsp");              
          }
          else if (usuario.getPerfil().getId() ==4){
              HttpSession session = request.getSession();
              request.getSession().setAttribute("usuarioLog", usuario);
              response.sendRedirect("MenuFuncionario.jsp");
          }
           else   {
                String mensagem = "Usuário ou Senha incorretos, Tente Novamente...";
                request.setAttribute("mensagem",mensagem);
                request.getRequestDispatcher("Login_index.jsp").forward(request, response);
          }
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Login.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }


}
