<nav class="navbar navbar-expand navbar-dark bg-dark">
    <% session.setAttribute("a", "a"); %>
    <div class="container">
        <a href="./welcome.jsp" class="navbar-brand">Home</a>
        <a href="./products.jsp" class="navbar-brand">Products</a>
        <a href="./cart.jsp" class="navbar-brand">Cart</a>
        <p class="navbar-brand">IP: <%=request.getRemoteAddr()%></p>
        &nbsp;
        <p class="navbar-brand">Session ID: <%=session.getId()%></p>
    </div>
</nav>