<%
    session.setAttribute("a", "a");
%>
<html>
    <head>
        <title>Test JSP</title>
    </head>

    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>Session ID: </td>
                <td><%=session.getId()%></td>
            </tr>
        </table>

        <% System.out.println("here!"); %>
    </body>
</html>