<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>PETMU</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/petcss.css">
</head>

<body>

   <%@ include file="/views/common/header.jsp" %>

    <div id="best">
        <div class="bestboard"><img class="bestphoto" src="<%= request.getContextPath()%>/resources/images/dog.jpg"></div>
        <div class="bestboard"><img class="bestphoto" src="<%= request.getContextPath()%>/resources/images/dogcat.jpg"></div>
    </div>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

    <h2>FOCUS ON</h2>

    <div id="need">
        <div class="NeedToKnow"><img class="NeedPhoto" src="<%= request.getContextPath()%>/resources/images/know1.png" onclick="know();"></div>
        <div class="NeedToKnow"><img class="NeedPhoto" src="<%= request.getContextPath()%>/resources/images/know2.png" onclick="know();"></div>
        <div class="NeedToKnow"><img class="NeedPhoto" src="<%= request.getContextPath()%>/resources/images/know3.png" onclick="know();"></div>
    </div>

    <br>

    <footer>
        <img src="<%= request.getContextPath()%>/resources/images/petmu.png" align="center" width="65" height="23">
        <p>COPYRIGHT © 2021 PETMU, ALL RIGHTS RESERVED. SEMIPROJECT ⎮ KH Academy reserved by Yongjoo, Minsu, Gichang,
            Jieun</p>
    </footer>

</body>


</html>