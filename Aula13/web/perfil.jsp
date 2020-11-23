<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 19:13:14
    Author     : José Vinícius
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("changePassword") != null){
        try {
            String login = (String)session.getAttribute("session.login");
            String password = request.getParameter("password");
            String newPassword = request.getParameter("newPassword2");
            String newPassword2 = request.getParameter("newPassword2");
            if(Usuario.getUsuario(login, password) == null){
                exceptionMessage = "Senha Inválida!";
            }else if(!newPassword.equals(newPassword2)){
                exceptionMessage = "Senhas não conferem";
            }else{
                Usuario.changePassword(login, newPassword);
                response.sendRedirect(request.getRequestURI());
                
            }
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
            <h2>Perfil do Usuário</h2>
        <%if(session.getAttribute("session.login") == null){%>
            <div>Você não tem permissão de acesso</div>
        <%}else{%>
            <h3>Login</h3>
            <ul><li><%= session.getAttribute("session.login")%></li></ul>
            <h3>Nome</h3>
            <ul><li><%= session.getAttribute("session.nome")%></li></ul>
            <h3>Papel</h3>
            <ul><li><%= session.getAttribute("session.papel")%></li></ul>
            
            <hr/>
            
            <%if(exceptionMessage != null){%>
                <div style="color: red"><%= exceptionMessage%></div>
            <%}%>
            <h4>Alterar Senha</h4>
            <form method="post">
                <div>Senha atual:<div> <input type="password" name="password"></div></div>
                <div>Nova senha:<div> <input type="password" name="newPassword"></div></div>
                <div>Confirmação nova senha:<div> <input type="password" name="newPassword2"></div></div>
                <br/>
                <input type="submit" name="changePassword" value="Alterar">
            </form>
        <%}%>
    </body>
</html>
