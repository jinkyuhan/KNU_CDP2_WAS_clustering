<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/06/06
  Time: 4:16 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductById(id);
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }

    ArrayList<Product> goodsList = dao.getAllProducts();
    Product goods = new Product();
    for (Product goodsItem : goodsList) {
        goods = goodsItem;
        if (goods.getProductId().equals(id)){
            break;
        }
    }

    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null){
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0;

    for (Product goodsItem : list) {
        if(goodsItem.getProductId().equals(id)) {
            cnt ++;
            int orderQuantity = goodsItem.getQuantity() + 1;
            goodsItem.setQuantity(orderQuantity);
        }
    }

    if (cnt == 0) {
        goods.setQuantity(1);
        list.add(goods);
    }
    response.sendRedirect("cart.jsp");
//    response.sendRedirect("product.jsp?id=" + id);
%>