<%--
  Created by IntelliJ IDEA.
  User: Yassin
  Date: 4/23/2024
  Time: 11:44 PM
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
    <title>Liste des Ordonnances non expirées</title>
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

        #retour {
            background-color: forestgreen;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Liste des Ordonnances non expirées</h1>
<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    ResultSet res;
    PreparedStatement ps = con.prepareStatement("SELECT * FROM Ordonnance");
    res = ps.executeQuery();
%>
<table>
    <tr>
        <th>ID</th>
        <th>ID Visite</th>
        <th>Médicament</th>
        <th>Test</th>
        <th>Note</th>
    </tr>
    <% while(res.next()){ %>
    <tr>
        <td><%=res.getInt("id") %></td>
        <td><%=res.getInt("idV") %></td>
        <td><%=res.getString("medicament") %></td>
        <td><%=res.getString("test") %></td>
        <td><%=res.getString("note") %></td>
    </tr>
    <%}
        res.close();
        con.close();
    %>
</table>
<br>
<a id="retour" href="/Cabinet-Doctor/JSP/Ordonnance/Ordonnance.jsp"> Retour </a>
</body>
</html>
