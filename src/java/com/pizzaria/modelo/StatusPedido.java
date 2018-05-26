/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.modelo;

/**
 *
 * @author alessandro
 */
public enum StatusPedido {
    APROVADO {
        public String toString(){
          return "APROVADO";  
        }
    },
    PREPARANDO {
        public String toString(){
          return "preparando";  
        }
    },
    ENVIANDO {
        public String toString(){
          return "enviando";  
        }
    },
    CANCELADO {
        public String toString(){
          return "CANCELADO";  
        }
    },
    ENTREGUE {
        public String toString(){
          return "entregue";  
        }
    };
}
