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

@WebServlet("/supprimer-ordonnance")
public class SupprimerOrdonnanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Ordonnance WHERE id=?");
            stmt.setInt(1, id);
            int updateCount = stmt.executeUpdate();

            if (updateCount > 0) {
                request.setAttribute("msg", "Ordonnance supprimée avec succès ....");
            } else {
                request.setAttribute("msg", "Aucune ordonnance trouvée avec l'ID spécifié.");
            }
            request.getRequestDispatcher("./JSP/Ordonnance/SupprimerOrdonnance.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
            request.getRequestDispatcher("./JSP/ErrorPage.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
