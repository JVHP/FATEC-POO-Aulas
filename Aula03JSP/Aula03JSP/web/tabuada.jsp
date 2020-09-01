<%-- 
    Document   : index
    Created on : 31 de ago de 2020, 19:40:31
    Author     : trize
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    int n;
    try{
        n = Integer.parseInt(request.getParameter("n"));
    }catch(Exception ex){
        n = 0;
        requestException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AULA 03 || JSP || Multiplicação</title>
    </head>
    <body>
        <h1><a href="index.jsp">Voltar</a></h1>
        <h1>Java Server Pages</h1>
        <h2>Multiplicação</h2>
        <form>
            Quantidade:
            <input type="number" name="n"/>
            <input type="submit" value="gerar"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Operação</th>
                
            </tr>
            <%if(request.getParameter("n")==null){%>
                <tr><td colspan="2">Não Há Parâmetro</td></tr>
            <%}else if(requestException!=null){%>
                <tr><td colspan="2">Parâmetro Inválido</td></tr>
            <%}%>    
            <%for(int i = 1; i<=10; i++){%>
            <tr>
                <th><%= n+"x"+i%></th>
                <td><%= n * i%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
