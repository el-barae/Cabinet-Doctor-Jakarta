<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 23‏/4‏/2024
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des rendez-vous non expirés</title>
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

        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            margin: 10px;
            min-width: 10rem;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        #retour{
            background-color: forestgreen;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Liste des rendez-vous non expirés</h1>
<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    ResultSet res;
    java.util.Date currentDate = new java.util.Date();
    Date today = new Date(currentDate.getTime());
    PreparedStatement ps = con.prepareStatement("SELECT * FROM RendezVous WHERE date >= ?");
    ps.setDate(1, today);
    res = ps.executeQuery();
%>
<table>
    <tr>
        <th>ID</th>
        <th>Note</th>
        <th>Date</th>
        <th>Heure</th>
        <th>CIN Patient</th>
    </tr>
    <% while(res.next()){ %>
    <tr>
        <td><%=res.getString("id") %></td>
        <td><%=res.getString("note") %></td>
        <td><%=res.getDate("date") %></td>
        <td><%=res.getString("heure") %></td>
        <td><%=res.getString("cinP") %></td>
    </tr>
    <%}
        res.close();
        con.close();
    %>
</table>
<br>
<a id="retour" href="/Cabinet-Doctor/JSP/RendezVous/RendezVous.jsp"> Retour </a>
</body>
</html>
