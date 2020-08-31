/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author trize
 */
@WebServlet(name = "GreetingServlet", urlPatterns = {"/greeting.html"})
public class GreetingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GreetingServlet</title>");            
            out.println("</head>");
            out.println("<body style=\"background-color: gainsboro\">");
            int h = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
            if(h>=6&&h<12){
                out.println("<h3 style=\"font-family: arial;color: grey\">Todos dias podem ser especiais<br>Quando temos a dose certa de esperança no coração!</h3>");
                out.println("<h1 style=\"font-family: arial\">Bom Dia!</h1>");
            }
            else if(h>=12&&h<19){
                out.println("<h3 style=\"font-family: arial;color: grey\">O vencedor não é aquele que vence<br>Mas sim aquele que nunca para de lutar!</h3>");
                out.println("<h1 style=\"font-family: arial\">Boa Tarde!</h1>");
            }
            else if(h>=19&&h<=23){
                out.println("<h3 style=\"font-family: arial;color: grey\">Durma com ideias,<br>Acorde com atitude!</h3>");                
                out.println("<h1 style=\"font-family: arial\">Boa Noite!</h1>");
            }
            else{
                out.println("<h1 style=\"font-family: arial\">Oque ta fazendo acordado á essa hora, caro visitante?</h3>");
                out.println("<h2 style=\"font-family: arial\">Alguns links pra te ajudar a dormir:</h2>");
                out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='https://www.youtube.com/watch?v=l7TxwBhtTUY' target='_blank'>Lo-Fi</a></div>");
                out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='https://www.youtube.com/watch?v=h7vuWEX7zsA' target='_blank'>Video 'relaxante'<br></a></div>");
                out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='https://www.youtube.com/watch?v=fyYIwFd4XHM&t=319s' target='_blank'>Musicas The Witcher 3</a></div>");
                out.println("<h2 style=\"font-family: arial\">Caso você esteja acordando agora, links para ta ajudar a despertar:</h2>");
                out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='https://www.youtube.com/watch?v=pBZs_Py-1_0' target='_blank'>SoundGarden</a></div>");
                out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='https://www.youtube.com/watch?v=IpEXM1Yziws' target='_blank'>Alice in Chains</a></div>");
            }
            out.println("<h1></h1>");
            out.println("<div style=\"font-family: arial\"><a style=\"text-decoration: none\" href='index.html'>Voltar</a></div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
