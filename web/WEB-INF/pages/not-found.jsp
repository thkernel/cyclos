<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="basicStyle.html" flush="false" />
        <style>
            body {
                padding: 160px 10px 10px 10px;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div style="text-align:center">
            ${notificationMessage}
        </div>
    </body>
</html>
