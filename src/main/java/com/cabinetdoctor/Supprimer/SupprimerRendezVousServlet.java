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

@WebServlet("/supprimer-rendezvous")
public class SupprimerRendezVousServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement stmt = con.prepareStatement("DELETE FROM RendezVous WHERE id=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            request.setAttribute("msg", "Rendez-vous supprimé avec succès ....");
            request.getRequestDispatcher("./JSP/RendezVous/SupprimerRendezVous.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
