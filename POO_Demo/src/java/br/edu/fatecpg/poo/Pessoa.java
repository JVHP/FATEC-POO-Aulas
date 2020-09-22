package br.edu.fatecpg.poo;

public class Pessoa {
    String nome;
    Pessoa pai;
    Pessoa mae;
    Data nascimento;

    
    public Pessoa(String nome, Pessoa pai, Pessoa mae, Data nascimento){
        this.nome = nome;
        this.pai = pai;
        this.mae = mae;
        this.nascimento = nascimento;
        
    }
}
