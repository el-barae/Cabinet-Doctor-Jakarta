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

@WebServlet("/ajouter-ordonnance")
public class AjouterOrdonnanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            ConnectionDB.seconnecter();
            Connection con = ConnectionDB.con;

            int idV = Integer.parseInt(request.getParameter("idV"));
            String medicament = request.getParameter("medicament");
            String test = request.getParameter("test");
            String note = request.getParameter("note");

            String sql = "INSERT INTO Ordonnance (idV, medicament, test, note) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idV);
            ps.setString(2, medicament);
            ps.setString(3, test);
            ps.setString(4, note);

            ps.executeUpdate();

            request.setAttribute("msg", "Ordonnance ajoutée avec succès ....");
            request.getRequestDispatcher("./JSP/Ordonnance/Ordonnance.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
