<%--
  Created by IntelliJ IDEA.
  User: el-barae
  Date: 23‏/4‏/2024
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Cabinet-Doctor: Login</title>
  <%// <link rel=stylesheet href="styles.css">%>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-min-screen">
<div class="bg-cyan-300 w-min-full py-8">
  <h1 class="text-6xl font-bold text-center">Cabinet-Doctor</h1>
  <h1 class="text-6xl font-bold text-center">Authentication</h1>
</div>
<div class="flex flex-col justify-center items-center">
  <form class="flex flex-col justify-center items-center px-6 my-4 border-2 border-black rounded-xl" action="/Cabinet-Doctor/login" method="POST">
    <h1 class="text-3xl font-bold my-2 ">Login</h1>
    <span>Username:</span>
    <input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type="text" name="username" placeholder="Enter your username..."/>
    <span>Password:</span>
    <input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type="password" name="password" placeholder="Enter your password..."/>
    <input class="my-2 text-lg text-cyan-800 font-semibold rounded-full bg-cyan-200 px-12 py-2 hover:cursor-pointer" type="submit" value="Login"/>
    <p class="font-semibold">Don't have an Account. try <a class="text-cyan-800 underline hover:cursor-pointer" href="./signup.jsp">Signup</a></p>
  </form>
</div>

</body>
</html>
