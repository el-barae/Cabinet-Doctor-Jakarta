package com.cabinetdoctor.Modifier;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

@WebServlet("/modifier-patient")
public class ModifierPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;
            String cin = request.getParameter("cin");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            LocalDate ddn = LocalDate.parse(request.getParameter("ddn"));
            String sexe = request.getParameter("sexe");
            String tel = request.getParameter("tele");

            String sql = "UPDATE Patient SET nom=?, prenom=?, sexe=?, ddn=?, tele=? WHERE cin=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, sexe);
            ps.setDate(4, java.sql.Date.valueOf(ddn));
            ps.setString(5, tel);
            ps.setString(6, cin);

            ps.executeUpdate();

            request.setAttribute("msg", "Patient modifié avec succès ....");
            request.getRequestDispatcher("./JSP/Patient/Patient.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
