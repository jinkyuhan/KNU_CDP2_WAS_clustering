<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="dao.UserRepository" %>
<%@ page import="dto.User" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("utf-8");
    String loginId = request.getParameter("id");
    String loginPw = request.getParameter("pw");
    UserRepository userRepo = UserRepository.getInstance();
    ArrayList<User> userList = userRepo.getAllUsers();

    for(int i = 0; i < userList.size(); i++){
        User user = userList.get(i);
        if (loginId.equals(user.getUserId()) && loginPw.equals(user.getUserPw())) {
            session.setAttribute("id", loginId); // session의 id attribute( != session.getId())가 로그인 상태를 체크하는 flag가 됨
            response.sendRedirect("index.jsp");
        }
    }
//    response.sendRedirect("login_fail.jsp");
%>
