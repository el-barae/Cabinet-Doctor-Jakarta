<%--
  Created by IntelliJ IDEA.
  User: Yassin
  Date: 4/23/2024
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire Modifier Ordonnance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            margin-top: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        b {
            color: red;
        }
    </style>
</head>
<body>
<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement stm = con.prepareStatement("SELECT * FROM Ordonnance WHERE id=?");
    stm.setInt(1, id);
    ResultSet res = stm.executeQuery();
    if(res.next()) {
%>
<h1>Modifier Ordonnance</h1>
<form action="/Cabinet-Doctor/modifier-ordonnance" method="post">
    <br>ID de l'ordonnance : <input type="text" value="<%= id %>" disabled> <br>
    <input type="hidden" name="id" value="<%= res.getInt("id") %>">
    <br>ID de la visite : <input type="text" name="idV" value="<%= res.getInt("idV") %>"> <br>
    <br>Médicament : <textarea name="medicament"><%= res.getString("medicament") %></textarea> <br>
    <br>Test : <textarea name="test"><%= res.getString("test") %></textarea> <br>
    <br>Note : <textarea name="note"><%= res.getString("note") %></textarea> <br>
    <br><br><input type="submit" value="Modifier">
</form>
<%  } else { %>
<b>Ordonnance introuvable !</b>
<%  }
    res.close();
    con.close();
%>
</body>
</html>
