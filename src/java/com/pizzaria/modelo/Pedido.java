/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzaria.modelo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Alessandro
 */
public class Pedido {
 
    private int cod;
    private boolean status;
    private Funcionario funcionario;
    private String observacao;
    private double desconto;
    private boolean entrega;
    private double taxaEntrega;
    private double troco;
    private Endereco endereco;
    private Cliente cliente;
    private List<ItemPedido> itens = new ArrayList<ItemPedido>();
    private double valorTotal;
    private Date data;
    
    
    
    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }
    
    public void addItem (ItemPedido item){
        item.setPedido(this);
        this.itens.add(item);
    }

    public List<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedido> itens) {
        this.itens = itens;
    }
    

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public double getDesconto() {
        return desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    public boolean isEntrega() {
        return entrega;
    }

    public void setEntrega(boolean entrega) {
        this.entrega = entrega;
    }

    public double getTaxaEntrega() {
        return taxaEntrega;
    }

    public void setTaxaEntrega(double taxaEntrega) {
        this.taxaEntrega = taxaEntrega;
    }

    public double getTroco() {
        return troco;
    }

    public void setTroco(double troco) {
        this.troco = troco;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

        
        public double CalcTotal(){
            double vtotal = 0;
        for (ItemPedido item : this.itens){ 
         vtotal += item.getValorItem();
        }
        this.valorTotal = vtotal;
        return valorTotal;
    }
   
    public void removerItem(ItemPedido itemRemove){
        for(Iterator i = itens.iterator(); i.hasNext();){
            ItemPedido item = (ItemPedido) i.next();
            if(item.getProduto().getCod() == itemRemove.getProduto().getCod()){
                i.remove();
            }
        }
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
        
}
