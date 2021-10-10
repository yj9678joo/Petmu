<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>PETMU : ID/PW 찾기</title>
   <link rel="petmu icon" href="<%= request.getContextPath()%>/resources/images/petmu.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://kit.fontawesome.com/c10cbac54f.js" crossorigin="anonymous"></script>

   <style>

.select{
width: 500px;
height: 35px;
border-width: 1px;


}
.serch{
display: inline-block;
width: 280px;
height: 55px;
border-style: solid;
border-width: 1px;
font-size: 27px;
padding-top: 20px;
}

#idSerch{
    background-color: black;
    color: white;
 

}

#pwSerch{

    background-color : white;
    border-color: white;
    color: gray;

}

.input{

    width: 550px;
    height: 50px;
    font-size: 25px;
    border-radius: 10px;
    border-width: 1px;
    border-style: solid;

}

#findId{


    width: 560px;
    height: 55px;
    background-color: rgb(255, 143, 16);
    display: inline-block;
    color: white;
    padding-top: 20px;
    font-size: 25px;

}



   </style>
</head>
<body  style="background-color:#f5f6f7;">
    <h2 align="center" style="margin-top: 150px;"><a href="../../index.jsp"> <img width="250" height="100" src="<%= request.getContextPath()%>/resources/images/petmu.png"alt="펫뮤" > </a><br><br> ID / PW 찾기 </h2>
    <br><hr><br>
<form action="<%= request.getContextPath()%>/idSerch.do"  method="post" id="idSerchForm" style="text-align: center; ">

    <br><br><br>
    <span align="center" class="select">

        <span class="serch" id="idSerch">아이디</span>
        <a href="pwSerch_page.jsp"><span class="serch" id="pwSerch">비밀번호</span></a>


    </span>
<br><br>

    <h2 style="color: gray; font-weight: 500; font-size: 20px;">회원 가입 시 작성한 이름과 E-Mail을 입력해주세요.</h2> 

    <input type="text" id="userName" class="input" placeholder=" 이름" > <br><br>
    <input type="text" id="userEmail" class="input" placeholder=" E-Mail">
    
    <br><br><br>

    <span id=findId onclick="submit" >아이디 찾기</span>
    <br><br><br>

</form>

</body>
</html>