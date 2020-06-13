<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String nextPage = "";
    String loginStatus = "";
    if (id == null || id.equals("")) {
        loginStatus = "False";
        nextPage = "\"login.jsp\"";
    } else {
        loginStatus = "True";
        nextPage = "\"welcome.jsp\"";
    }
%>
<div id="contents">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h4 class="card-title text-center">접속자 정보</h4>
                    <div class="form-label-group">
                        <h5><b>IP:</b> <%=request.getRemoteAddr()%></h5>
                    </div>
                    <br>
                    <div class="form-label-group">
                        <h5><b>Session ID: </b> <%=session.getId()%></h5>
                    </div>
                    <div class="form-label-group">
                        <h5><b>Login Status:</b> <%=loginStatus%></h5>
                        <br>
                        <h6>잠시뒤 <%=nextPage%>로 이동합니다...</h6>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    setTimeout(function () {
        window.location.href = <%=nextPage%>;
    }, 3000);
</script>

</body>
</html>