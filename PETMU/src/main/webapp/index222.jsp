<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
     <title>임시 인덱스 페이지</title>
</head>
<body>
    <ol>
        <li><a href="<%= request.getContextPath()%>/views/member/agreement_page.jsp">약관동의 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/sign_in_page.jsp">회원가입 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/login_page.jsp">로그인 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/idSerch_page.jsp">ID 찾기 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/pwSerch_page.jsp">PW 찾기 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/myPage_page.jsp">마이페이지 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/withdraw_page.jsp">회원탈퇴 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/userUpdate_page.jsp">개인정보수정 페이지 구현</a></li>
        <li><a href="<%= request.getContextPath()%>/views/member/nicknameUpdate_page.jsp">닉네임 변경 페이지 구현</a></li>
</ol>
    
</body>
</html>