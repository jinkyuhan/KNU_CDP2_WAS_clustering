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
    <title>상품 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script type="text/javascript" src="./assets/js/validation.js"></script>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 등록</h1>
        </div>
    </div>
    <div class="container">
        <form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2">상품 코드</label>
                <div class="col-sm-3">
                    <input type="text" id="productId" name="productId" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">상품명</label>
                <div class="col-sm-3">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">가격</label>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">상세 정보</label>
                <div class="col-sm-5">
                    <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">제조사</label>
                <div class="col-sm-3">
                    <input type="text" name="manufacturer" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">분류</label>
                <div class="col-sm-3">
                    <input type="text" name="category" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">재고 수</label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">상태</label>
                <div class="col-sm-5">
                    <input type="radio" name="condition" value="New">
                    신규 제품
                    <input type="radio" name="condition" value="Old">
                    중고 제품
                    <input type="radio" name="condition" value="Refurbished">
                    재생 제품
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">이미지</label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
                </div>
            </div>
        </form>
    </div>

</body>

</html>