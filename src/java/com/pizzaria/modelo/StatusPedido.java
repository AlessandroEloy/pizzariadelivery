package com.pizzaria.modelo;

public enum StatusPedido {    
    APROVADO {
        @Override
        public String toString(){
          return "APROVADO";  
        }
    },
    PREPARANDO {
        @Override
        public String toString(){
          return "PREPARANDO";  
        }
    },
    ENVIANDO {
        @Override
        public String toString(){
          return "ENVIANDO";  
        }
    },
    CANCELADO {
        @Override
        public String toString(){
          return "CANCELADO";  
        }
    },
    ENTREGUE {
        @Override
        public String toString(){
          return "ENTREGUE";  
        }
    };
}
