<%-- 
    Document   : error.jsp
    Created on : Jun 6, 2022, 5:57:51 PM
    Author     : MinhQuang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error!</title>
    </head>
    <body>
        <h1>Error at ${ERROR.toString()}</h1>
        ${errorMessage}
    </body>
</html>
