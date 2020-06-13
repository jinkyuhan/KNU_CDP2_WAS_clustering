<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/06/06
  Time: 5:26 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id");
    if ( id == null || id.trim().equals("") ) {
        response.sendRedirect("products.jsp");
        return ;
    }
    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductById(id);
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }

    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    cartList.removeIf(item -> item.getProductId().equals(id));

    response.sendRedirect("cart.jsp");
%>