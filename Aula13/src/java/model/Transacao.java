/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author José Vinícius
 */
public class Transacao {
    private long rowId;
    private String dataHora;
    private String descricao;
    private String categoria;
    private String origem;
    private double valor;

    public Transacao(long rowId, String dataHora, String descricao, String categoria, String origem, double valor) {
        this.rowId = rowId;
        this.dataHora = dataHora;
        this.descricao = descricao;
        this.categoria = categoria;
        this.origem = origem;
        this.valor = valor;
    }

    public static ArrayList<Transacao> getList() throws Exception{
        ArrayList<Transacao> lst = new ArrayList<>();
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = DbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT rowId, * FROM transacoes;");
            while (rs.next()) {
                lst.add(new Transacao(
                rs.getLong("rowId"),
                rs.getString("dataHora"),
                rs.getString("descricao"),
                rs.getString("categoria"),
                rs.getString("origem"),
                rs.getDouble("valor")
                ));
            }
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        return lst;
    }

    public static void Insert(String dataHora, String descricao, String categoria, String origem, double valor) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO transacoes VALUES(?, ?, ?, ?, ?)");
            stmt.setString(1, dataHora);
            stmt.setString(2, descricao);
            stmt.setString(3, categoria);
            stmt.setString(4, origem);
            stmt.setDouble(5, valor);
            stmt.execute();
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        
    }
    public static void Update(long rowId, String dataHora, String descricao, String categoria, String origem, double valor) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("UPDATE transacoes "
                    + "SET dataHora=?, descricao=?, categoria=?, origem=?, valor=?"
                    + "WHERE rowId=?");
            stmt.setLong(1, rowId);
            stmt.setString(2, dataHora);
            stmt.setString(3, descricao);
            stmt.setString(4, categoria);
            stmt.setString(5, origem);
            stmt.setDouble(6, valor);
            stmt.execute();
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        
    }
    
    public static void Delete(long rowId) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM transacoes WHERE rowId = ?");
            stmt.setLong(1, rowId);
            stmt.execute();
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        
    }
    
    
    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public String getDataHora() {
        return dataHora;
    }

    public void setDataHora(String dataHora) {
        this.dataHora = dataHora;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS transacoes("
                + "datahora VARCHAR(25) NOT NULL,"
                + "descricao VARCHAR(200) NOT NULL,"
                + "categoria VARCHAR(50) NOT NULL,"
                + "origem VARCHAR(200) NOT NULL,"
                + "valor NUMERIC(10, 2) NOT NULL,"
                + "FOREIGN KEY(categoria) REFERENCES categoria(nome)"
                + ");";
    }
    
}
