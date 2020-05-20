<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="include/head.jsp" %>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String userid = request.getParameter("id");
        String userpw = request.getParameter("pw");

        if (userid.equals("admin") && userpw.equals("0000")) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    %>

    <%@ include file="include/bootstrapjs.jsp" %>
</body>
</html>