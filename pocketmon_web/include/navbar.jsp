<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <% session.setAttribute("a", "a"); %>
    <ul class="navbar-nav">
        <li class="nav-item active">
            <p class="nav-link">IP: <%=request.getRemoteAddr()%></p>
        </li>
        <li class="nav-item">
            <p class="nav-link">Session ID: <%=session.getId()%></p>
        </li>
      </ul>
</nav>