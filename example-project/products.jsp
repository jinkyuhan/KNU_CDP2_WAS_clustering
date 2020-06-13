<%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/05/23
  Time: 1:11 오전
  To change this template use File | Settings | File Templates.
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<html>
<head>
    <title>상품 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>
<%
    ProductRepository dao = ProductRepository.getInstance();
    ArrayList<Product> listOfProducts = dao.getAllProducts();
%>
<div class="container">
    <div class="row" align="center">
        <%
            for (int i = 0; i < listOfProducts.size(); i++) {
                Product product = listOfProducts.get(i);
        %>
        <div class="col-md-4">
            <img src="./uploads/<%=product.getFileName()%>" style="width: 100%">
            <h3><%=product.getPname()%>
            </h3>
            <p><%=product.getDescription()%>
            </p>
            <p><%=product.getUnitPrice()%>
            </p>원
            <p>
                <a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">
                    상세 정보 &raquo;
                </a>
            </p>
        </div>
        <%
            }
        %>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
