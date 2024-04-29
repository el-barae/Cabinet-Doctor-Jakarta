<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 23‏/4‏/2024
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire Modifier Rendez-vous</title>
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
        input[type="date"],
        input[type="time"] {
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
    PreparedStatement stm = con.prepareStatement("select * from RendezVous where id=?");
    stm.setInt(1, id);
    ResultSet res = stm.executeQuery();
    if(res.next()) { %>
<form action="/Cabinet-Doctor/modifier-rendezvous" method="post">
    <br>ID du rendez-vous : <input type="text" value="<%=id %>" disabled> <br>
    <input type="hidden" name="id" value="<%=res.getInt(1) %>">
    <br>Note : <input type="text" name="note" value="<%=res.getString(2) %>"> <br>
    <br>Date : <input type="date" name="date" value="<%=res.getDate(3) %>"> <br>
    <br>Heure : <input type="time" name="heure" value="<%=res.getTime(4) %>"> <br>
    <br>CIN du patient : <input type="text" name="cinP" value="<%=res.getString(5) %>"> <br>
    <br><br><input type="submit" value="Modifier">
</form>
<%  } else { %>
<b>Rendez-vous introuvable !</b>
<%  }
    res.close();
    con.close();
%>
</body>
</html>
