<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 19:13:14
    Author     : José Vinícius
--%>

<%@page import="model.Transacao"%>
<%@page import="model.Categoria"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - My Finance</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Página Inicial</h2>
        <hr/>
        <h3>Categorias</h3>
        <hr/>
        <div><%= Categoria.getList().size()%> registros</div>
        <h3>Transações</h3>
        <div><%= Transacao.getList().size()%> registros</div>
        <hr/>
        <h3>Transações</h3>
        <div><%= Usuario.getList().size()%> usuários cadastrados</div>
        
    </body>
</html>
