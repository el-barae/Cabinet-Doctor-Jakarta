<%--
  Created by IntelliJ IDEA.
  User: Yassin
  Date: 4/23/2024
  Time: 8:58 PM
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

        table {
            width: 80%;
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
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        #modifier {
            background-color: orange;
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

<% if(request.getAttribute("msg")!=null) { %>
<h2><%= request.getAttribute("msg") %></h2>
<% } %>

<h1>Modifier une visite</h1>

<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    ResultSet res;
    res = con.createStatement().executeQuery("SELECT * FROM Visit");
%>

<table>
    <tr><th>ID</th><th>Symptômes</th><th>Diagnostics</th><th>Note</th><th>Date</th><th>Type</th><th>Montant</th><th>CIN Patient</th><th>Modifier</th></tr>
    <% while(res.next()){ %>
    <tr>
        <td><%= res.getInt("id") %></td>
        <td><%= res.getString("symptoms") %></td>
        <td><%= res.getString("diagnostics") %></td>
        <td><%= res.getString("note") %></td>
        <td><%= res.getDate("deh").toString() %></td>
        <td><%= res.getString("type") %></td>
        <td><%= res.getInt("montant") %></td>
        <td><%= res.getString("cin") %></td>
        <td><a id="modifier" href="/Cabinet-Doctor/JSP/Visit/FormModifierVisite.jsp?id=<%=res.getInt("id")%>">Modifier</a></td>
    </tr>
    <% }
        res.close();
        con.close();
    %>
</table>

<br>
<a id="retour" href="/Cabinet-Doctor/JSP/Visit/Visit.jsp"> Retour </a>

</body>
</html>
