package com.cabinetdoctor.Supprimer;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/supprimer-patient")
public class SupprimerPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;
            String cin = request.getParameter("cin");
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Patient WHERE cin=?");
            stmt.setString(1, cin);
            stmt.executeUpdate();
            request.setAttribute("msg", "Patient supprimé avec succès ....");
            request.getRequestDispatcher("./JSP/Patient/SupprimerPatient.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
