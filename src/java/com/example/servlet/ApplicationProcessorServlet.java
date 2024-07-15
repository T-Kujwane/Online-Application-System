/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlet;

import com.example.persistance.DatabaseManager;
import com.example.persistance.DatabaseManager.Applicant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thato Keith Kujwane
 */
@MultipartConfig
public class ApplicationProcessorServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("first_name");
        String surname = request.getParameter("surname");
        String idNumber = request.getParameter("id_number");
        Part idCopy = request.getPart("id_copy");
        
        DatabaseManager dbManager;
        
        try {
            System.out.println("Creating database manager");
            dbManager = new DatabaseManager();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ApplicationProcessorServlet.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        
        //class Foo {
            //class Foe{
            //}
        //}
        
        //Applicant applicant = dbManager.new Applicant(firstName, surname, idNumber, idCopy);
        Applicant applicant = dbManager.new Applicant(firstName, surname, idNumber, idCopy);
        //AJAX JavaScript
        try {
            System.out.println("Inserting applicant");
            dbManager.insert(applicant);
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationProcessorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println("Redirecting to home");
        response.sendRedirect("home");
        
        try {
            System.out.println("Closing database connection");
            dbManager.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationProcessorServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
