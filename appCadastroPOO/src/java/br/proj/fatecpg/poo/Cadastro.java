package br.proj.fatecpg.poo;

public class Cadastro {
    String nome;
    String telefone;
    String email;
    
    public Cadastro(String nome, String telefone, String email){
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        
    }
    
    public String getNome(){
        return nome;
    }
    
    public String getTel(){
        return telefone;
    }
    
    public String getEmail(){
        return email;
    }
    
}
