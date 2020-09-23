<%-- 
    Document   : Idade
    Created on : 31 de ago de 2020, 19:58:43
    Author     : trize
--%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            int esteAno = Calendar.getInstance().get(Calendar.YEAR);
            int anoDoMeuNascimento = 2001;
            int idade = esteAno - anoDoMeuNascimento;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Java Server Pages</h1>
        <h2>Minha Idade Atual</h2>
        <h3>José Vinícius Henrique Pereira</h3>
        <h3>Idade: <%=idade%></h3>
    </body>
</html>
