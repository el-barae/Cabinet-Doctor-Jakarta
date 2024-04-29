<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<script src="https://cdn.tailwindcss.com"></script>
		<title>Cabinet-Doctor: Signup</title>
	</head>
	<body class='w-min-screen'>
		<div class="bg-cyan-300 w-min-full py-8">
			<h1 class="text-6xl font-bold text-center">Cabinet-Doctor</h1>
			<h1 class="text-4xl font-bold text-center">Create Account</h1>
		</div>
	
		<div class="flex flex-col justify-center items-center">
			<form class="flex flex-col justify-center items-center px-6 my-4 border-2 border-black rounded-xl" method=POST action="/Cabinet-Doctor/signup">
				<h1 class="text-3xl font-bold my-2">Sign up</h1>
				<span>CIN:</span>
				<input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type=text name=cin placeholder="enter your cin"/>
				<span>Username:</span>
				<input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type=text name=username placeholder="enter your username"/>
				<span>Email:</span>
				<input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type=email name=email placeholder="enter your email"/>
				<span>Password:</span>
				<input class="my-2 text-2xl border-2 border-gray-400 rounded-lg px-1" type=password name=password placeholder="enter your password"/>
				<input class="my-2 text-lg text-cyan-800 font-semibold rounded-full bg-cyan-200 px-12 py-2 hover:cursor-pointer" type=submit value="signup"/>
				<p class="font-semibold">Already have an Account. try <a class="text-cyan-800 underline hover:cursor-pointer" href="./index.jsp">Login</a></p>
			</form>
		</div>
	
	</body>
</html>