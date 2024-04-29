package com.cabinetdoctor.Ajouter;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;


@WebServlet("/ajouter-rendezvous")
public class AjouterRendezVousServlet extends HttpServlet {
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
            String note = request.getParameter("note");
            LocalDate date = LocalDate.parse(request.getParameter("date"));
            String heure = request.getParameter("heure");
            String cinP = request.getParameter("cinP");

            String sql = "INSERT INTO RendezVous (note, date, heure, cinP) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, note);
            ps.setDate(2, java.sql.Date.valueOf(date));
            ps.setString(3, heure);
            ps.setString(4, cinP);

            ps.executeUpdate();

            request.setAttribute("msg", "Rendez-vous ajouté avec succès ....");
            request.getRequestDispatcher("./JSP/RendezVous/RendezVous.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}