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


@WebServlet("/modifier-rendezvous")
public class ModifierRendezVousServlet extends HttpServlet {
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
            int id = Integer.parseInt(request.getParameter("id"));
            String note = request.getParameter("note");
            LocalDate date = LocalDate.parse(request.getParameter("date"));
            String heure = request.getParameter("heure");
            String cinP = request.getParameter("cinP");

            String sql = "UPDATE RendezVous SET note=?, date=?, heure=?, cinP=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, note);
            ps.setDate(2, java.sql.Date.valueOf(date));
            ps.setString(3, heure);
            ps.setString(4, cinP);
            ps.setInt(5, id);

            ps.executeUpdate();

            request.setAttribute("msg", "Rendez-vous modifié avec succès ....");
            request.getRequestDispatcher("./JSP/RendezVous/RendezVous.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
