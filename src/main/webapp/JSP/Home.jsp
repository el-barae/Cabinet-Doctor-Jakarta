<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 24‏/4‏/2024
  Time: 07:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cabinet-Doctor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        a {
            display: inline-block;
            margin: 10px;
            min-width: 12rem;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        #logout{
            background-color: firebrick;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>Selectionez votre choix</h2>
<br>
<a href="/Cabinet-Doctor/JSP/Patient/Patient.jsp">Patients</a><br>
<br>
<a href="/Cabinet-Doctor/JSP/RendezVous/RendezVous.jsp">Rendez-vous</a><br>
<br>
<a href="/Cabinet-Doctor/JSP/Visit/Visit.jsp">Visites</a><br>
<br>
<a href="/Cabinet-Doctor/JSP/Ordonnance/Ordonnance.jsp">Ordonnances</a><br>
<br>
<a id="logout" href="/Cabinet-Doctor/index.jsp">Log out</a>
</body>
</html>
