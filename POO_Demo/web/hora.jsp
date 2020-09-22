<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.fatecpg.poo.Hora"%>
<%
    Hora atual = new Hora(20, 42, 18);
    Hora intervalo = new Hora(21, 40, 06);
%>    

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horário</title>
    </head>
    <body>
        <h1>Esta é a hora atual:</h1>
        <div><%=atual.getHora()%></div>
        <h1>Esta é a hora do intervalo:</h1>
        <div><%=intervalo.getHora()%></div>
        <h3><a href="index.jsp">Index</a></h3>
        
    </body>
</html>
