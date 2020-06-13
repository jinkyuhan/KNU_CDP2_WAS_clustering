<%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/05/23
  Time: 1:11 오전
  To change this template use File | Settings | File Templates.
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<html>

<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>

<body>
<%@ include file="menu.jsp" %>
<%!
    String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
    String tagline = "Welcome to Web Market";
%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <%= greeting%>
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <h3>
            <%= tagline%>
        </h3>
        <%
            response.setIntHeader("Refresh", 5);
            Date day = new java.util.Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            if (hour / 12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + minute + ":" + second + " " + am_pm;
            out.println("현재 접속 시각: " + CT + "\n");
        %>
    </div>
</div>
<%@ include file="footer.jsp" %>

</body>

</html>