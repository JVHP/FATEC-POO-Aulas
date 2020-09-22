package br.edu.fatecpg.poo;
    /*
    A classe Data serve para manipular uma data de uma forma simples e didática
    */
public class Data {
    
    /**
    Atributo dia:armazena
    */
    
    public Data(int dia, int mes, int ano){
        this.dia = dia;
        this.mes = mes;
        this.ano = 2020;
        
    }
    
    public String getData(){
        String out = "0";
        if(dia<10)out+="0";
        
        return dia+"/"+mes+"/"+ano;
    }
    
    private int dia;
        public void setDia(int valor){
            if(valor<1){
                dia = 1;
            }else if(valor>31){
                dia = 31;
            }else{
                valor = dia;
            }
        }
        public int getDia(){
            return dia;
        }
    
    public int mes;
    public void setMes(int valor){
            if(valor<1){
                mes = 1;
            }else if(valor>12){
                mes = 12;
            }else{
                valor = mes;
            }
        }
        public int getMes(){
            return mes;
        }
    
    public int ano;
    
    
   
    /***
        public static void main(String[] args) {
        Data hoje;//Declaração
        hoje = new Data();//Instaciação
        
        hoje.ano = 2010;
    }*/
}
