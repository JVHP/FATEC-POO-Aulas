<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 19:13:14
    Author     : José Vinícius
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Transacao"%>
<%@page import="model.Usuario"%>
<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("cancelar") != null){
            response.sendRedirect(request.getRequestURI());
        
    }
    if(request.getParameter("formInsert") != null){
        try {
            String dataHora = request.getParameter("datahora");
            String descricao = request.getParameter("descricao");
            String categoria = request.getParameter("categoria");
            String origem = request.getParameter("origem");
            double valor = Double.parseDouble(request.getParameter("valor"));
            Transacao.Insert(dataHora, descricao, categoria, origem, valor);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formUpdate") != null){
        try {
            long rowid = Long.parseLong(request.getParameter("rowid"));
            String dataHora = request.getParameter("datahora");
            String descricao = request.getParameter("descricao");
            String categoria = request.getParameter("categoria");
            String origem = request.getParameter("origem");
            double valor = Double.parseDouble(request.getParameter("valor"));
            Transacao.Update(rowid, dataHora, descricao, categoria, origem, valor);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formDelete") != null){
        try {
            long rowid = Long.parseLong(request.getParameter("rowid"));
            Transacao.Delete(rowid);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transações - My Finance</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
            <h2>Transações</h2>
        <%if(session.getAttribute("session.login") == null){%>
            <div>Você não tem permissão de acesso</div>
        <%}else{%>
            <%if(exceptionMessage != null){%>
                <div style="color: red"><%= exceptionMessage%></div>
            <%}%>
            <%if(request.getParameter("prepInsert") != null){%>
                <h3>Inserir Registro</h3>
                <form>
                    Data/Hora: <input type="datetime-local" name="datahora" 
                                      value="<%= new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").format(new Date())%>">
                    Descrição: <input type="text" name="descricao">
                    Categoria: <select name="categoria">
                        <option value=""></option>
                        <%for(Categoria c: Categoria.getList()){%>
                                <option value="<%= c.getNome()%>"><%= c.getNome()%></option>
                        <%}%>
                        </select>
                    Origem: <input type="text" name="origem">    
                    Valor: <input type="number" step="0.01" name="valor">
                    <input type="submit" name="formInsert" value="Inserir">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepUpdate") != null){%>
            <h3>Alterar Registro</h3>
                <form>
                    <%String rowid = request.getParameter("rowid");  
                      String datahora = request.getParameter("datahora");
                      String descricao = request.getParameter("descricao");
                      String categoria = request.getParameter("categoria");
                      String origem = request.getParameter("origem");
                      String valor = request.getParameter("valor");
                    %>
                    <input type="hidden" name="rowid" value="<%= rowid%>">
                    Data/Hora: <input type="datetime-local" name="datahora" 
                                      value="<%= datahora%>">
                    Descrição: <input type="text" name="descricao" value="<%=descricao%>">
                    Categoria: <select name="categoria" value="<%=categoria%>">
                        <option value=""></option>
                        <%for(Categoria c: Categoria.getList()){%>
                                <option value="<%= c.getNome()%>" <%= c.getNome().equals(categoria) ? "selected":"" %>>
                                    <%= c.getNome()%></option>
                        <%}%>
                        </select>
                    Origem: <input type="text" name="origem" value="<%= origem%>">    
                    Valor: <input type="number" step="0.01" name="valor" value="<%= valor%>">
                    <input type="submit" name="formUpdate" value="Alterar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepDelete") != null){%>
            <h3>Deletar Registro</h3>
                <form>
                    <%String rowid = request.getParameter("rowid");%>
                    <input type="hidden" name="rowid" value="<%= rowid%>">
                    Excluir o Registro <b><%= rowid%></b>?
                    <input type="submit" name="formDelete" value="Deletar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepInsert" value="Inserir">
                </form>
            <%}%>
            <h3>Lista</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Data/Hora</th>
                    <th>Descrição</th>
                    <th>Categoria</th>
                    <th>Origem</th>
                    <th>Valor</th>
                    <th>Comandos</th>
                </tr>
                <%for(Transacao t: Transacao.getList()){%>
                <tr>
                <td><%= t.getRowId()%></td>
                <td><%= t.getDataHora()%></td>
                <td><%= t.getDescricao()%></td>
                <td><%= t.getCategoria()%></td>
                <td><%= t.getOrigem()%></td>
                <td><%= t.getValor()%></td>
                <td>
                    <form>
                        <input type="hidden" name="rowid" value="<%= t.getRowId()%>">
                        <input type="hidden" name="datahora" value="<%= t.getDataHora()%>">
                        <input type="hidden" name="descricao" value="<%= t.getDescricao()%>">
                        <input type="hidden" name="categoria" value="<%= t.getCategoria()%>">
                        <input type="hidden" name="origem" value="<%= t.getOrigem()%>">
                        <input type="hidden" name="valor" value="<%= t.getValor()%>">
                        <input type="submit" name="prepUpdate" value="Alterar">
                        <input type="submit" name="prepDelete" value="Excluir">
                    </form>
                </td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>
