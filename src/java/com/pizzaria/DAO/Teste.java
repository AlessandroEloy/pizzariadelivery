/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.DAO;

import com.pizzaria.modelo.Pedido;
import com.pizzaria.modelo.StatusPedido;
import java.util.List;

/**
 *
 * @author alessandro
 */
public class Teste {
   
    public static void main(String[] args) {
        
        Pedido_DAO dao = new Pedido_DAO();
        
        try{
        List<Pedido> lista = dao.listarPedidoPorStatus(StatusPedido.CANCELADO.toString());
        
        System.out.println(lista.size());
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
//            System.out.println(p.);
//        });
//        lista.forEach((p) -> {
//            System.out.println(p.);
//        });
    }
}
