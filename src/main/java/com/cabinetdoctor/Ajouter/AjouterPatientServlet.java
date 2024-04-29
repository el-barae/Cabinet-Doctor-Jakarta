package com.cabinetdoctor.Ajouter;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.sql.Connection;


@WebServlet("/ajouter-patient")
public class AjouterPatientServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html");
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
            String sexe = request.getParameter("sexe");
            LocalDate ddn = LocalDate.parse(request.getParameter("ddn"));
            String tele = request.getParameter("tele");
            String sql = "INSERT INTO Patient (cin, nom, prenom, sexe, ddn, tele) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cin);
            ps.setString(2, nom);
            ps.setString(3, prenom);
            ps.setString(4, sexe);
            ps.setDate(5, java.sql.Date.valueOf(ddn));
            ps.setString(6, tele);

            ps.executeUpdate();

            request.setAttribute("msg", "Patient ajouté avec succès ....");
            request.getRequestDispatcher("./JSP/Patient/Patient.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
