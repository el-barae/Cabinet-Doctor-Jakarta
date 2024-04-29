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
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/modifier-visite")
public class ModifierVisiteServlet extends HttpServlet {
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
            String symptoms = request.getParameter("symptoms");
            String diagnostics = request.getParameter("diagnostics");
            String note = request.getParameter("note");
            LocalDate deh = LocalDate.parse(request.getParameter("deh"));
            String type = request.getParameter("type");
            int montant = Integer.parseInt(request.getParameter("montant"));
            String cin = request.getParameter("cin");

            String sql = "UPDATE Visit SET symptoms=?, diagnostics=?, note=?, deh=?, type=?, montant=?, cin=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, symptoms);
            ps.setString(2, diagnostics);
            ps.setString(3, note);
            ps.setDate(4, java.sql.Date.valueOf(deh));
            ps.setString(5, type);
            ps.setInt(6, montant);
            ps.setString(7, cin);
            ps.setInt(8, id);

            ps.executeUpdate();

            request.setAttribute("msg", "Visite modifiée avec succès.");
            request.getRequestDispatcher("./JSP/Visit/Visit.jsp").forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
