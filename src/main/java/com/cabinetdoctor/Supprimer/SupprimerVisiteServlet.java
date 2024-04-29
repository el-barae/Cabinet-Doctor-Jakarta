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

@WebServlet("/supprimer-visite")
public class SupprimerVisiteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Visit WHERE id=?");
            stmt.setInt(1, id);
            int result = stmt.executeUpdate();

            if (result > 0) {
                request.setAttribute("msg", "Visite supprimée avec succès.");
            } else {
                request.setAttribute("msg", "Aucune visite trouvée avec cet ID.");
            }

            request.getRequestDispatcher("./JSP/Visit/SupprimerVisite.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Une erreur s'est produite lors de la suppression de la visite.");
            request.getRequestDispatcher("./JSP/Visit/SupprimerVisit.jsp").forward(request, response);
        } finally {
            try {
                ConnectionDB.con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
