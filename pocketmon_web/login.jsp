<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="include/head.jsp" %>
</head>
<body>
    <%@ include file="include/navbar.jsp" %>
    <div id="contents">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
              <div class="card card-signin my-5">
                <div class="card-body">
                  <h5 class="card-title text-center">Sign In</h5>
                  <form class="form-signin" action="login_process.jsp" method="post">
                    <div class="form-label-group">
                      <input type="text" name="id" id="inputEmail" class="form-control" placeholder="ID" required autofocus>
                    </div>
                    <br>
                    <div class="form-label-group">
                      <input type="password" name="pw" id="inputPassword" class="form-control" placeholder="Password" required>
                    </div>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Log in</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
    </div>

    <%@ include file="include/bootstrapjs.jsp" %>
</body>
</html>