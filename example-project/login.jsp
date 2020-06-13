<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <title>로그인</title>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div id="contents">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
              <div class="card card-signin my-5">
                <div class="card-body">
                  <h5 class="card-title text-center">Sign In</h5>
                  <form class="form-signin" action="login_process.jsp" method="post">
                    <div class="form-label-group">
                      <input type="text" name="id" id="id" class="form-control" placeholder="ID" required autofocus>
                    </div>
                    <br>
                    <div class="form-label-group">
                      <input type="password" name="pw" id="pw" class="form-control" placeholder="Password" required>
                    </div>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Log in</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
    </div>

</body>
</html>