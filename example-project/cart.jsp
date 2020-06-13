<%@ page import="java.lang.reflect.Array" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <%
        String cartId = session.getId();
    %>
    <title>장바구니</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">장바구니</h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td align="left">
                    <a class="btn btn-success" href="./deleteCart.jsp?cartId=<%=cartId%>">
                        삭제하기
                    </a>
                </td>
                <td align="right">
                    <a class="btn btn-success" href="./shippingInfo.jsp?cartId=<%=cartId%>">
                        주문하기
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>상품</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
                <th>비고</th>
            </tr>
            <%
                int sum = 0;
                ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                if (cartList == null) {
                    cartList = new ArrayList<Product>();
                }
                for (Product product : cartList) {
                    int total = product.getUnitPrice() * product.getQuantity();
                    sum += total;
            %>
            <tr>
                <td>
                    <%=product.getProductId()%> - <%=product.getPname()%>
                </td>
                <td><%=product.getUnitPrice()%>
                </td>
                <td><%=product.getQuantity()%>
                </td>
                <td><%=total%>
                </td>
                <td>
                    <a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <th></th>
                <th></th>
                <th>총액</th>
                <th><%=sum%>
                </th>
                <th></th>
            </tr>
        </table>
        <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기 </a>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
