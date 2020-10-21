<%-- 
    Document   : index
    Created on : 19 de out de 2020, 19:20:31
    Author     : José Vinícius Henrique Pereira
--%>
<%@page import="DB.TaskConnector"%>
<%@page import="java.util.ArrayList"%>
<%
    String errorMessage = null;
    if(request.getParameter("insert")!=null){
        try{
            String name = request.getParameter("nome");
            TaskConnector.insert(name);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            errorMessage = "Erro ao inserir tarefa "+ex.getMessage();
        }
    }
    if(request.getParameter("delete")!=null){
        try{
            String name = request.getParameter("nome");
            TaskConnector.delete(name);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            errorMessage = "Erro ao excluir tarefa "+ex.getMessage();
        }
    }
    ArrayList<String> tasks = new ArrayList<>();

    try{
        tasks = TaskConnector.select();
    }catch(Exception ex){
        errorMessage = "Erro ao ler dados da tabela"+ex.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tasks SQLite</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <%@include file="WEB-INF/jspf/style.jspf"%>
    <body>
        <h3>Teste JSBD</h3>
        <h1>SQLite</h1>
        <h2>Disciplinas</h2>
        <form>
            <input type="name" name="nome"/>
            <input type="submit" name="insert" value="Inserir Disciplina"/>
        </form>
        <hr/>
        <%if(errorMessage != null){%>
        <div><%= errorMessage%></div>
        <%}%>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Comando</th>
            </tr>
            <%for(String name: TaskConnector.select()){%>
            <tr>
                <td><%= name%></td>
                <td>
                    <form>
                        <input type="hidden" name="nome" value="<%= name%>"/>
                        <input type="submit" name="delete" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>