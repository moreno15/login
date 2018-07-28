/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author ronald
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        Usuario u = new Usuario();
        u.setName(user);
        u.setPass(clave);

        boolean estado = u.validarUsuario();

        request.setAttribute("usuario", u);
        if (estado) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);//"Pankaj"
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(10 * 60);
            Cookie userName = new Cookie("user", user);
            userName.setMaxAge(10 * 60);
            response.addCookie(userName);

            response.sendRedirect("vista/Administrador.jsp");
            /*RequestDispatcher rd = request.getRequestDispatcher("vista/Administrador.jsp");
            rd.forward(request, response);*/
        } else {
             response.sendRedirect("login/login.jsp");
           /* RequestDispatcher rd = getServletContext().getRequestDispatcher("/vista/error.jsp");
            rd.include(request, response);*/
        }
    }

}
