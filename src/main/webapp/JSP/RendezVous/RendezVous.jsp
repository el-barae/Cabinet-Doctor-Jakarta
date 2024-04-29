<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 23‏/4‏/2024
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des rendez-vous</title>
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
            min-width: 20rem;
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
<% if(request.getAttribute("msg")!=null) { %>
<h2> <%= request.getAttribute("msg") %></h2>
<% } %>
<h1>Liste des rendez-vous</h1>
<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    ResultSet res;
    res = con.createStatement().executeQuery("SELECT * FROM RendezVous");
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
<a href="/Cabinet-Doctor/HTML/AjouterRendezVous.html"> Ajouter un nouveau rendez-vous </a><br>
<br>
<a href="/Cabinet-Doctor/JSP/RendezVous/ListerRendezVous.jsp"> Lister les rendez-vous non expirés </a><br>
<br>
<a href="/Cabinet-Doctor/JSP/RendezVous/ModifierRendezVous.jsp"> Modifier un rendez-vous </a><br>
<br>
<a href="/Cabinet-Doctor/JSP/RendezVous/SupprimerRendezVous.jsp"> Supprimer un rendez-vous </a><br>
<br>
<a id="retour" href="/Cabinet-Doctor/JSP/Home.jsp">Retour</a>
</body>
</html>
