<%@page import="br.edu.fatecpg.poo.Data"%>

<%
    Data hoje = new Data(21, 9, 2020);
    
    Data nasc = new Data(16, 5, 2001);
    nasc.setDia(160);
    nasc.setMes(5);
    nasc.ano = 2001;
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <div> 
            <h4>hoje</h4>
            <%=hoje.getDia()%>/<%=hoje.mes%>/<%=hoje.ano%>
        </div>
        <div> 
            <h4>nascimento</h4>
            <%=nasc.getData()%>
        </div>
    </body>
</html>
