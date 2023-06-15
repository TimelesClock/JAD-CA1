<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar bg-base-100 shadow-xl">
    <div class="flex-1">
        <a class="btn btn-ghost normal-case text-xl">SP Books</a>
    </div>
    <div class="flex-none">
        <div class="menu menu-horizontal px-1">
            <%
            HttpSession loginSession = request.getSession(false);
            if (loginSession != null && loginSession.getAttribute("email") != null) { %>
                <!-- Logout button -->
                <form action="AuthenticateServlet" method="post">
                    <input type="hidden" name="action" value="logout">
                    <button type="submit" class="btn btn-outline btn-error">Logout</button>
                </form>
            <% } else { %>
                <!-- Login button -->
                <form action="AuthenticateServlet" method="get" class = "">
                    <input type="hidden" name="action" value="login">
                    <button type="submit" class="btn btn-outline">Login</button>
                </form>
            <% } %>

        </div>
    </div>
</div>

</body>
</html>