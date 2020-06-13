<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_shippingDate = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_addressName = "";

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie thisCookie : cookies) {
            String n = thisCookie.getName();
            switch(n){
                case "Shipping_cartId":
                    shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                case "Shipping_name":
                    shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                case "Shipping_shippingDate":
                    shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                case "Shipping_country":
                    shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                case "Shipping_zipCode":
                    shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                case "Shipping_addressName":
                    shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    break;
                default:
                    break;
            }
        }
    }
%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <title>Title</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">주문 정보</h1>
        </div>
    </div>
    <div class="container col-8 alert alert-info">
        <div class="text-center">
            <h1>영수증</h1>
        </div>
        <div class="row justify-content-between">
            <div class="col-4" align="left">
                <strong>배송 주소</strong> <br>
                성명 : <%=shipping_name%> <br>
                우편번호 : <%=shipping_zipCode%> <br>
                주소 : <%=shipping_addressName%>(<%=shipping_country%>) <br>
            </div>
            <div class="col-4" align="right">
                <p> <em>배송일: <%=shipping_shippingDate%></em></p>
            </div>
        </div>
        <div>
            <table class="table table-hover">
                <tr>
                    <th class="text-center">도서</th>
                    <th class="text-center">#</th>
                    <th class="text-center">가격</th>
                    <th class="text-center">소계</th>
                </tr>
            <%
                int sum = 0;
                ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                if (cartList == null){
                    cartList = new ArrayList<Product>();
                }
                for (Product product: cartList) {
                    int total = product.getUnitPrice() * product.getQuantity();
                    sum += total;
            %>
            <tr>
                <td class="text-center"><em><%=product.getPname()%></em></td>
                <td class="text-center"><%=product.getQuantity()%></td>
                <td class="text-center"><%=product.getUnitPrice()%></td>
                <td class="text-center"><%=total%>원</td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td></td>
                <td class="text-right"><strong>총액:</strong></td>
                <td class="text-center text-danger"><strong><%=sum%></strong></td>
            </tr>
            </table>

            <a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button"> 이전 </a>
            <a href="./thankCustomer.jsp" class="btn btn-success" role="button"> 주문 완료 </a>
            <a href="./checkOutCancelled.jsp" class="btn btn-success" role="button"> 취소 </a>
        </div>
    </div>
</body>
</html>
