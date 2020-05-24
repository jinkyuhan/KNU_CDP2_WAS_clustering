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
                    <%@ page import="java.util.*" %>
                    <%
                    //session data를 arraylist에 저장
                    int cnt=0;
                    ArrayList<String> list = (ArrayList)session.getAttribute("sessionlist");
                    String sessionId = session.getId();

                    if(list==null)
                    {
                      list = new ArrayList<String>();
                      session.setAttribute("sessionlist",list);
                    }

                    for(int i=0;i<list.size();i++)
                      if(list.get(i)==sessionId)
                        cnt = 1;

                    if(cnt==0)
                      list.add(sessionId);
                    %>
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
        	var c = "<%=cnt%>";
        	if(c==0)
          		window.location.href = "login.jsp";
        	else
          		window.location.href = "home.jsp";
        }, 5000);
    </script>
  </body>
</html>
