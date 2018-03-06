/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.controle;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alessandro.eloy
 */
@WebFilter("/ServLet_login")
public class Filtro_Paginas implements Filter {

    /**
     *
     */
    public Filtro_Paginas() {
    }

   
    @Override
	public void destroy() {
	}
        
   
    @Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//HttpSession sessao = request.getSession();
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		
		String url = httpServletRequest .getRequestURI();
		
		HttpSession sessao = httpServletRequest .getSession();
		
		if (sessao.getAttribute("usuarioLog")!=null || url.lastIndexOf("Login_index.jsp")>-1 ||
		url.lastIndexOf("Servlet_Login") >-1 ){
		chain.doFilter(request, response); 
		}else{
		((HttpServletResponse) response).sendRedirect("Login_index.jsp");
		}
	}

    

}