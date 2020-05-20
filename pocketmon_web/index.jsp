<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="include/head.jsp" %>
  </head>
  <body>
    <% session.setAttribute("a", "a"); %>
    <div id="contents">
      <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h4 class="card-title text-center">접속자 정보</h4>
                  <div class="form-label-group">
                    <h5>IP:</h5>
                    <h5><%=request.getRemoteAddr()%></h5>
                  </div>
                  <br>
                  <div class="form-label-group">
                    <h5>Session ID:</h5>
                    <h5><%=session.getId()%></h5>
                  </div>
                  <br>
              </div>
            </div>
          </div>
        </div>
    </div>

    <%@ include file="include/bootstrapjs.jsp" %>
    <script>
        setTimeout(function(){
          // 세션 정보 있으면
          // window.location.href = "home.jsp";
          // 아니면
          window.location.href = "login.jsp";
        }, 5000);
    </script>
  </body>
</html>
