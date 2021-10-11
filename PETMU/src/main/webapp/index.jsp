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

    <header>
        <div id="logo">
            <img src="<%= request.getContextPath()%>/resources/images/petmu.png" align="left" onclick="goHome();" width="130" height="46" id="logo">
        </div>

        <div id="top_menu">
            <div class="top" onclick="memberJoin();">회원가입 |</div>
            <div class="top" onclick="login()">로그인 |</div>
            <div class="top" onclick="myPage();">마이페이지</div>
        </div>

        <div id="serch">
            <input type="text" name="serch" onkeyup="enterKey();" class="serch"> <button type="button"
                class="ser_button">검색</button>
        </div>

        <div id="menu">
            <nav>
                <div class="menu" onclick="all();">≡ 전체 카테고리</div>
                <div class="menu" onclick="hospital();">우리동네 동물병원</div>
                <div class="menu" onclick="information();">후기⋅정보</div>
                <div class="menu" onclick="freeboard();">자유게시판</div>
                <div class="menu" onclick="myPet();">나의 댕냥 자랑</div>
            </nav>
        </div>
        <script>

            function memberJoin() {
                location.href = "<%= request.getContextPath()%>/views/member/agreement_page.jsp";
            }

            function login() {
                location.href = "<%= request.getContextPath()%>/views/member/login_page.jsp";
            }

            function logout() {
                location.href = "<%= request.getContextPath()%>/logout.do";
            }

            function myPage() {
                location.href = "<%= request.getContextPath()%>/views/member/myPage_page.jsp";
            }

            function goHome() {
                location.href = "<%= request.getContextPath()%>/index.jsp";
            }

            function hospital() {
                location.href = "<%= request.getContextPath()%>/views/hospital/hospital.jsp";
            }

            function information() {
                location.href = "<%= request.getContextPath()%>/selectList.bo?cate=3";
            }

            function freeboard() {
                location.href = "<%=request.getContextPath()%>/selectList.fb?cate=1";
            }

            function myPet() {
                location.href = "<%=request.getContextPath()%>/selectList.tn";
            }

        </script>
    </header>

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