<%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/05/24
  Time: 1:22 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<html>
<head>
    <title>상품 상세 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 상세 정보</h1>
        </div>
    </div>
    <%
        String id = request.getParameter("id");
        ProductRepository dao = ProductRepository.getInstance();
        Product product = dao.getProductById(id);
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="./uploads/<%=product.getFileName()%>" alt="#">
                <h3><%=product.getPname()%></h3>
                <p><%=product.getDescription()%></p>
                <p> <b>상품 코드 : </b><span class="badge badge-danger">
                    <%=product.getProductId()%>
                </span></p>
                <p><b>제조사 :</b><%=product.getManufacturer()%></p>
                <p><b>분류 :</b><%=product.getCategory()%></p>
                <p><b>재고 수 :</b><%=product.getUnitsInStock()%></p>
                <h4><%=product.getUnitPrice()%>원</h4>
                <form name="addForm" method="post" action="./addCart.jsp?id=<%=product.getProductId()%>">
                    <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
                    <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
                    <a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo; </a>
                </form>
            </div>
        </div>
        <hr>
    </div>
    <jsp:include page="footer.jsp"/>
    <script type="text/javascript">
        function addToCart() {
            if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
                document.addForm.submit();
            } else {
                document.addForm.reset();
            }
        }
    </script>
</body>
</html>
