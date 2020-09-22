<%@page contentType="text/html" pageEncoding="utf-8"%>
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
        <title>Cadastro em POO</title>
    </head>
    <body>
        <form method="post" align="center">
            Nome: <input type="text" name="nome"/>
            Telefone: <input type="text" name="tel" required/>
            e-Mail: <input type="text" name="email" required/>
            <input type="submit" name="add" value="Adicionar" required/>
        </form>
        <hr/>
        <table border="1" align="center">
            <tr>
                <thead>
                <th>Contato</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Comando</th>
                <thead/>
                <%for(int i=0; i<lstCdstr.size(); i++){%>
                <% Cadastro contato1 = lstCdstr.get(i);%>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= contato1.getNome() %></td>
                        <td><%= contato1.getTel() %></td>
                        <td><%= contato1.getEmail() %></td>
                        <td>
                            <form>
                                <input type="submit" name="remove" value="Remover"/>
                                <input type="hidden" name="i" value="<%= i %>">
                            </form>
                        </td>
                    </tr>
                <%}%>
            </tr>
        </table>
        <hr/>
        <h4 align="center"><a href="index.jsp">Home Page</a></h4>
    </body>
</html>
