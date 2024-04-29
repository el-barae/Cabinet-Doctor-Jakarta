<%--
  Created by IntelliJ IDEA.
  User: Yassin
  Date: 4/23/2024
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une visite</title>
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
            max-width: 600px;
            margin: auto;
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
        input[type="date"],
        input[type="number"],
        select {
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
    </style>
</head>
<body>
<h1>Modifier une visite</h1>
<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement stm = con.prepareStatement("SELECT * FROM Visit WHERE id=?");
    stm.setInt(1, id);
    ResultSet res = stm.executeQuery();
    if(res.next()) {
%>
<form action="/Cabinet-Doctor/modifier-visite" method="post">
    ID de la visite : <input type="text" value="<%= id %>" disabled><br>
    <input type="hidden" name="id" value="<%= id %>">
    Symptômes : <input type="text" name="symptoms" value="<%= res.getString("symptoms") %>"><br>
    Diagnostics : <input type="text" name="diagnostics" value="<%= res.getString("diagnostics") %>"><br>
    Note : <input type="text" name="note" value="<%= res.getString("note") %>"><br>
    Date de la visite : <input type="date" name="deh" value="<%= res.getDate("deh").toString() %>"><br>
    Type : <select name="type">
    <option <%= "Consultation".equals(res.getString("type")) ? "selected" : "" %>>Consultation</option>
    <option <%= "Follow-up".equals(res.getString("type")) ? "selected" : "" %>>Follow-up</option>
    <option <%= "Emergency".equals(res.getString("type")) ? "selected" : "" %>>Emergency</option>
</select><br>
    Montant (€) : <input type="number" name="montant" value="<%= res.getInt("montant") %>"><br>
    CIN du patient : <input type="text" name="cin" value="<%= res.getString("cin") %>"><br>
    <input type="submit" value="Modifier">
</form>
<%  } else { %>
<b>Visite introuvable !</b>
<%  }
    res.close();
    con.close();
%>
</body>
</html>
