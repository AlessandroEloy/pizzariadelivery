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
public class ItemPedido {
    private int cod;
    private Pedido pedido;
    private Produto produto;
    private int quantidade;
    private double valorItem;
  
    
    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValorItem() {
        return this.getQuantidade() * this.produto.getValor();
    }

    public void setValorItem(double valorItem) {
        this.valorItem = valorItem;
    }
    
}
