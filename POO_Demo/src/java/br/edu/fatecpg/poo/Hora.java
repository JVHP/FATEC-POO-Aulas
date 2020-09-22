package br.edu.fatecpg.poo;

public class Hora {
    int hora;
    int min;
    int seg;
    
    public Hora(int hora, int min, int seg){
        this.hora = hora;
        this.min = min;
        this.seg = seg;
    }
    
    public void setHora(int valor1, int valor2, int valor3){
        valor1 = hora;
        valor2 = min;
        valor3 = seg;
    }
    
    public String getHora(){
        String out = "";
        if(hora<10) out += "0";
        out+=hora+":";
        if(min<10) out += "0";
        out+=min+":";
        if(seg<10) out += "0";
        out+=seg;
        return out;
    }
}

