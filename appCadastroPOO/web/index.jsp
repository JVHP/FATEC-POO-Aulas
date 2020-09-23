<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<%@page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%@page import="br.proj.fatecpg.poo.Cadastro"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Cadastro> lstCdstr = (ArrayList) application.getAttribute("lstCdstr");
    if(lstCdstr == null){
        lstCdstr = new ArrayList<Cadastro>();
        application.setAttribute("lstCdstr", lstCdstr);
    }
    if(request.getParameter("add") != null){
        String nome = request.getParameter("nome");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        lstCdstr.add(new Cadastro(nome, tel, email));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove") != null){
        int i = Integer.parseInt(request.getParameter("i"));
        lstCdstr.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>

<!DOCTYPE html>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contatos | POO</title>
    </head>
    
    <body>
        
        <br/>
        <div>
            <h1 align="center">CONTATOS</h1>
        </div>
        
        <br/>
        <hr/>
        
        <form method="post" align="center">
            <div class="form-group">
                <p>Nome: </p>
                <input type="text" name="nome"/>
            </div>
            <div class="form-group">
                <p>Telefone Celular com DDD: </p>
                <input type="text" name="tel"  maxlength="11" required/>
            </div>
            <div class="form-group">
                <p>e-Mail: </p>
                <input type="text" name="email" required/>
            </div>
            <input type="submit" name="add" value="Adicionar" required/>
        </form>
        
        <hr/>
        
        <table class="table-bordered" align="center">
            <tr>
                <thead align="center">
                    <th>Contato</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Email</th>
                    <th>Comando</th>
                <thead/>
                <%for(int i=0; i<lstCdstr.size(); i++){%>
                <% Cadastro contato1 = lstCdstr.get(i);%>
                <tbody>
                    <tr>
                        <td align="center"><%= i + 1 %></td>
                        <td align="center"><%= contato1.getNome() %></td>
                        <td align="center"><%= contato1.getTel() %></td>
                        <td align="center"><%= contato1.getEmail() %></td>
                        <td align="center">
                            <form>
                                <p></p>
                                <input type="submit" name="remove" value="Remover" class="btn btn-danger btn-sm"/>
                                <input type="hidden" name="i" value="<%= i %>">
                            </form>
                        </td>
                    </tr>
                </tbody>    
                <%}%>
            </tr>
        </table>
            
        <hr/>
        
    </body>
</html>
