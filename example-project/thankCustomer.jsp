<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <title>주문 완료</title>
</head>
<body>
    <%
        String shipping_cartId = "";
        String shipping_shippingDate = "";

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie thisCookie : cookies) {
                String n = thisCookie.getName();
                if (n.equals("Shipping_cartId")) {
                    shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                }
                if (n.equals("Shipping_shippingDate")) {
                    shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                }
            }
        }
    %>
    <jsp:include page="menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">주문 완료</h1>
        </div>
    </div>
    <div class="container">
        <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
        <p>주문은 <%=shipping_shippingDate%>에 배송될 예정입니다!</p>
        <p>주문번호 : <%=shipping_cartId%></p>
    </div>
    <div class="container">
        <p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a></p>
    </div>
</body>
</html>
<%
    if(cookies != null){
        session.invalidate();
        for (Cookie thisCookie : cookies) {
            String n = thisCookie.getName();
            switch(n) {
                case "Customer_Id":
                    thisCookie.setMaxAge(0);
                    break;
                case "Customer_name":
                    thisCookie.setMaxAge(0);
                    break;
                case "Customer_phoneNumber":
                    thisCookie.setMaxAge(0);
                    break;
                case "Customer_country":
                    thisCookie.setMaxAge(0);
                    break;
                case "Customer_zipCode":
                    thisCookie.setMaxAge(0);
                    break;
                case "Customer_addressName":
                    thisCookie.setMaxAge(0);
                    break;
                default:
                    break;
            }
            switch(n) {
                case "Shipping_CartId":
                    thisCookie.setMaxAge(0);
                    break;
                case "Shipping_name":
                    thisCookie.setMaxAge(0);
                    break;
                case "Shipping_shippingDate":
                    thisCookie.setMaxAge(0);
                    break;
                case "Shipping_country":
                    thisCookie.setMaxAge(0);
                    break;
                case "Shipping_zipCode":
                    thisCookie.setMaxAge(0);
                    break;
                case "Shipping_addressName":
                    thisCookie.setMaxAge(0);
                    break;
                default:
                    break;
            }
            response.addCookie(thisCookie);
        }
    }
%>