/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.modelo;

/**
 *
 * @author Alessandro_Eloy
 */
public class Perfil {

    private int id;
    private String acesso;
    private Nivel_Acesso nivel_acesso;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcesso() {
        return acesso;
    }

    public void setAcesso(String acesso) {
        this.acesso = acesso;
    }

    public Nivel_Acesso getNivel_acesso() {
        return nivel_acesso;
    }

    public void setNivel_acesso(Nivel_Acesso nivel_acesso) {
        this.nivel_acesso = nivel_acesso;
    }

    public enum Nivel_Acesso {
        
        GERENTE  ("GERENTE"), BALCONISTA ("BALCONISTA"), PIZZAIOLO ("PIZZAIOLO"), CLIENTE ("CLIENTE");
       
        private String nome;
        
        private Nivel_Acesso(String nome){
            this.nome = nome;
        }
 
    }
}
