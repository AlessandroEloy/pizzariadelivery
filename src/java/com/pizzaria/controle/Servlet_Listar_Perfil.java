/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import com.google.gson.Gson;
import com.pizzaria.DAO.Perfil_DAO;
import com.pizzaria.modelo.Perfil;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alessandro_Eloy
 */
public class Servlet_Listar_Perfil extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Perfil> listaPerfil = new ArrayList<>();
        Perfil_DAO dao = new Perfil_DAO();
        try {
            listaPerfil = dao.Listar();
            Gson gson = new Gson();
            String lista = gson.toJson(listaPerfil);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(lista);
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
        
    }
}
