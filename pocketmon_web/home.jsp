<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="include/head.jsp" %>
</head>
<body>
    <%@ include file="include/navbar.jsp" %>
    <h2>내가 잡은 포켓몬</h2>
    <table>
        <tr>
            <!--요기는 사용자가 포획한 포켓몬 개수 만큼 동적으로 반복문?!
            <td> 
            <%@ include file="card.jsp" %>
            </td>

            -->

        </tr>
    </table>

    <h2>야생의 포켓몬</h2>
    <table>
        <tr>
            <td>
                <%@ include file="card.jsp" %>

            </td>
        </tr>

    </table>



    <%@ include file="include/bootstrapjs.jsp" %>
</body>

</html>