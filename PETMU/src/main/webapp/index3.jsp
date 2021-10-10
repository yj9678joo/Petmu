<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 펫커뮤니티</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<style>
#menu {
    width : 1000px;
    height : 40px;
}
.nav {
    width : 1000px;
    list-style: none;
    float: left;
    margin: 0;
    padding: 0;
    background :lightskyblue;
}

.nav li {
    display: inline;
}

.nav li a {
    float: left;
    color : black;
    line-height: 60px;
    text-decoration: none;
    text-shadow: 1px 1px 1px gray;
    margin: 0;
    padding : 0px 30px;
}

.nav li:hover {
    color : white;
    background: lightcyan;
}

.nav ul {
    display: none;
}

.nav li:hover>ul {
    display: block;
    position : absolute;
    width : 1000px;
    height : 50px;
    background: lightseagreen;
    margin-top : 60px;
}

.nav li:hover>ul li a {
    line-height:  50px;
}
</style>
</head>
<body>
    
    <div id="menu">
        <ul class="nav">
            <li>
                <a href="#">Home</a>
            </li>
            <li>
                <a href="#">공지사항</a>
            </li>
            <li>
                <a href="#">게시판</a>
                <ul>
                    <li>
                        <a href='<%=request.getContextPath()%>/selectList.bo'>자유게시판</a>
                    </li>
                    <li>
                        <a href='<%=request.getContextPath()%>/selectList.tn'>사진게시판</a>
                    </li>
                    <li>
                        <a href="#">나의꽃밭</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">Contact US</a>
            </li>

        </ul>
    </div>

    
</body>
</html>