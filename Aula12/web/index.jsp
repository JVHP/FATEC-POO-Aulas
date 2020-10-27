<%-- 
    Document   : index
    Created on : 26 de out de 2020, 19:14:57
    Author     : José Vinícius Henrique Pereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="listeners.DBListener"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if(DBListener.exception!=null){%>
        <div style="color: red"><%= DBListener.exception%></div>
        <%}%>
        <%
            String loginErrorMessage = null;
            if(request.getParameter("login")!= null){
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String name = DBListener.login(email, password);
                if(name == null){
                    loginErrorMessage = "Usuário e/ou Senha inválido!";
                }else{
                session.setAttribute("email", email);
                session.setAttribute("name", name);
                response.sendRedirect(request.getRequestURI());
                }
            }
            if(request.getParameter("logout")!= null){
                session.removeAttribute("email");
                session.removeAttribute("name");
                response.sendRedirect(request.getRequestURI());
            }
        %>
        <%if(session.getAttribute("email")==null){%>
            <%if(loginErrorMessage!=null){%>
            <div style="color: red;"><%=loginErrorMessage%></div>
            <%}%>
            <form>
                Email: <input type="text" name="email"/>
                Senha: <input type="password" name="password"/>
                <input type="submit" name="login" value="Entrar"/>
            </form>
        <%}else{%>
            <form>
                Bem Vindo, <%= session.getAttribute("name")%>
                <input type="submit" name="logout" value="Sair"/>
            </form>
        <%}%>
        <hr/>
        <h1>Controle de Acesso</h1>
        <%try{%>
            <h2>Usuários: <%= DBListener.getUsersCount()%></h2>
            <%for(String email: DBListener.getUsersEmails()){%>
                <div><%= email%></div>
            <%}%>
            <%}catch(Exception requestException){%>
            <div style="color: red"><%= requestException.getMessage()%></div>
        <%}%>
    </body>
</html>
