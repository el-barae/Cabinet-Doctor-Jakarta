package com.cabinetdoctor.Authentification;

import com.cabinetdoctor.Info.ConnectionDB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ConnectionDB.seconnecter();
			Connection con = ConnectionDB.con;
			PreparedStatement p = con.prepareStatement("insert into users(cin, username, email, password, tdc, ddc) "
					+ "values(?, ?, ?, ?, CURTIME(), CURDATE())");
			p.setString(1, request.getParameter("cin"));
			p.setString(2, request.getParameter("username"));
			p.setString(3, request.getParameter("email"));
			p.setString(4, request.getParameter("password"));
			
			int res = p.executeUpdate();
			if(res == 1) {
				RequestDispatcher reqD = request.getRequestDispatcher("./HTML/succesSignup.html");
				reqD.forward(request, response);
			}else {
				RequestDispatcher reqD = request.getRequestDispatcher("./HTML/loginError.html");
				reqD.forward(request, response);
			}
		}catch(Exception e) {
			System.out.println(e);
			RequestDispatcher reqD = request.getRequestDispatcher("./HTML/loginError.html");
			reqD.forward(request, response);
		}
	}

}
