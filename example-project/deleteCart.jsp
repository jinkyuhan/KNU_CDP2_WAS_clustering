<%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/06/06
  Time: 5:42 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("cartId");

    if (id == null || id.trim().equals("")) {
        response.sendRedirect("cart.jsp");
        return;
    }

    session.invalidate();

    response.sendRedirect("cart.jsp");
%>