package com.cabinetdoctor.Authentification;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ConnectionDB.seconnecter();
			Connection con = ConnectionDB.con;
			PreparedStatement p = con.prepareStatement("select * from users where username = ? and password = ?");
			p.setString(1, request.getParameter("username"));
			p.setString(2, request.getParameter("password"));
			ResultSet res = p.executeQuery();
			if(res.next()) {
				request.getRequestDispatcher("./JSP/Home.jsp").forward(request, response);
			}else {
				RequestDispatcher reqD = request.getRequestDispatcher("./HTML/loginError.html");
				reqD.forward(request, response);
			}
		}catch(SQLException e) {
			System.out.println(e);
			RequestDispatcher reqD = request.getRequestDispatcher("./HTML/loginError.html");
			reqD.forward(request, response);
		} catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
