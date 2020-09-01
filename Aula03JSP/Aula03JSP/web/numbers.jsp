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
        <title>AULA 03 || JSP || Números Aleatórios</title>
    </head>
    <body>
        <h1><a href="index.jsp">Voltar</a></h1>
        <h1>Java Server Pages</h1>
        <h2>Números Aleatórios</h2>
        <table border="1">
            <tr>
                <th>Número</th>
            </tr>
            <tr>
                <%for(int i = 1; i<=10; i++){%>
                <td>
                    <%=((int)(100*Math.random()))%>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
