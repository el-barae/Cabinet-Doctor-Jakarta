<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 24‏/4‏/2024
  Time: 07:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.cabinetdoctor.Info.ConnectionDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un patient</title>
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
    String cin = request.getParameter("cin");
    PreparedStatement stm = con.prepareStatement("select * from Patient where cin=?");
    stm.setString(1, cin);
    ResultSet res = stm.executeQuery();
    if(res.next()) { %>
<form action="/Cabinet-Doctor/modifier-patient" method="post">
    <br>CIN du patient : <input type="text" value="<%=cin %>" disabled> <br>
    <input type="hidden" name="cin" value="<%=cin %>">
    <br>Nom : <input type="text" name="nom" value="<%=res.getString("nom") %>"> <br>
    <br>Prénom : <input type="text" name="prenom" value="<%=res.getString("prenom") %>"> <br>
    <br>Sexe :
    <select name="sexe">
        <option value="M" <%= res.getString("sexe").equals("M") ? "selected" : "" %>>Masculin</option>
        <option value="F" <%= res.getString("sexe").equals("F") ? "selected" : "" %>>Féminin</option>
    </select>
    <br>
    <br>Date de naissance : <input type="date" name="ddn" value="<%=res.getDate("ddn") %>"> <br>
    <br>Téléphone : <input type="text" name="tele" value="<%=res.getString("tele") %>"> <br>
    <br><br><input type="submit" value="Modifier">
</form>
<%  } else { %>
<b>Patient introuvable !</b>
<%  }
    res.close();
    con.close();
%>
</body>
</html>
