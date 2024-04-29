<%--
  Created by IntelliJ IDEA.
  User:Yassin
  Date: 4/23/2024
  Time: 11:45 PM
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
    <title>Supprimer des Ordonnances</title>
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
            margin: 5px;
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        #supprimer{
            background-color: firebrick;
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
<% if(request.getAttribute("msg") != null) { %>
<h2> <%= request.getAttribute("msg") %></h2>
<% } %>

<h1>Supprimer des Ordonnances</h1>

<%
    ConnectionDB.seconnecter();
    Connection con = ConnectionDB.con;
    ResultSet res;
    res = con.createStatement().executeQuery("SELECT * FROM Ordonnance");
%>

<table>
    <tr><th>ID</th><th>ID Visite</th><th>Médicament</th><th>Test</th><th>Note</th><th>Supprimer</th></tr>
    <% while(res.next()){ %>
    <tr>
        <td><%=res.getInt("id") %></td>
        <td><%=res.getInt("idV") %></td>
        <td><%=res.getString("medicament") %></td>
        <td><%=res.getString("test") %></td>
        <td><%=res.getString("note") %></td>
        <td><a id="supprimer" href="/Cabinet-Doctor/supprimer-ordonnance?id=<%=res.getInt("id")%>" >Supprimer</a></td>
    </tr>
    <% }
        res.close();
        con.close();
    %>
</table>

<br>
<a id="retour" href="/Cabinet-Doctor/JSP/Ordonnance/Ordonnance.jsp">Retour</a>
</body>
</html>
