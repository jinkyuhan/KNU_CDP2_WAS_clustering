<%--
  Created by IntelliJ IDEA.
  User: jinkyuhan
  Date: 2020/05/24
  Time: 4:08 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%
    request.setCharacterEncoding("UTF-8");

    String realFolder= "/Users/jinkyuhan/IdeaProjects/web10/web/uploads";
    int maxSize = 5 * 1024 * 1024;  // 5MB
    String encType = "utf-8";

    MultipartRequest multi = new MultipartRequest(
            request,
            realFolder,
            maxSize,
            encType,
            new DefaultFileRenamePolicy()
    );

    String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String manufacturer = multi.getParameter("manufacturer");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");
    Integer price;

    if (unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;

    if (unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);
    ProductRepository dao = ProductRepository.getInstance();

    Product newProduct = new Product();
    newProduct.setProductId(productId);
    newProduct.setPname(name);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategory(category);
    newProduct.setUnitsInStock(stock);
    newProduct.setCondition(condition);
    newProduct.setFileName(fileName);

    dao.addProduct(newProduct);
    response.sendRedirect("products.jsp");
%>