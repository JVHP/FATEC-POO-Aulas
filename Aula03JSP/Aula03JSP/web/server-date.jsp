<%-- 
    Document   : index
    Created on : 31 de ago de 2020, 19:40:31
    Author     : trize
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AULA 03 || JSP || Data/Hora</title>
    </head>
    <body>
        <h1><a href="index.jsp">Voltar</a></h1>
        <h1>Java Server Pages</h1>
        <h2>Data/Hora Servidor</h2>
        <h3>Utilizando scrptilet</h3>
        <%
            java.util.Date agora = new java.util.Date();
            out.print("<h3>Agora no servidor:"+agora+"</h3>");
        %>
        <h3>Utilizando Expression</h3>
        <h3>Agora, no servidor: <%=new java.util.Date()%></h3>
    </body>
</html>
