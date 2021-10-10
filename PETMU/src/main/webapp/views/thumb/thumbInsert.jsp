<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 게시글 작성</title>
<script src="/petmu/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<!-- 타이틀로고 -->
<link rel="shortcut icon" type="image/x-icon" href="/petmu/resources/images/petmu.ico" /> 
<!-- fontawesome 아이콘cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" /> 
<!-- 구글폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
body {
	background-color: #E9E9E9;
}
section {
	width: 1400px;
	height: auto;
	background: white;
	color: black;
	margin-left: auto;
	margin-right: auto;
	padding: 50px;
	margin-top: 40px;
}

.category {
	width: 1200px;
	margin-left: 45px;
}

i { /* 카테고리 아이콘 */
	font-size: 24px;
	color: grey;
}

#cate { /* 카테고리 a태그 */
	font-size: 25px;
	text-decoration: none;
}

#btitle {
	font-size: 25px;
	width: 1000px;
	border: 0;
	border-bottom: 1px solid grey;
	padding: 10px;
}

#outline {
	width: 1300px;
	margin-left: 45px;
	border: 1px solid lightgrey;
	padding: 15px 15px 15px 15px;
}

#insertArea {
	width: 500px;
	width: 1300px;
	margin-left: 45px;
	border: 1px solid lightgrey;
	padding: 15px 15px 15px 15px;
}

#bcontent {
	width: 1000px;
	height: 150px;
	padding: 10px;
	resize: none;
}

table {
	margin-left: -5px;
}

[id*=contentImgArea], #titleImgArea {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	margin: 10px;
}

[id*=ImgArea]:hover {
	cursor: pointer;
}

#thumbTitle {
	width : 100px;
	display : block;
	text-align : center;
	background-color : black;
	color : white;
	font-size : 13pt;
	margin-top : -200px;
	position : absolute;
}

#btnArea {
    display : block; 
	text-align: center;
}

#btn {
	width: 100px;
	padding: 10px;
	border: 0;
	outline: none;
	color: orange;
	font-weight: bold;
	font-size: 15px;
}

#btn:hover {
	opacity: 0.5;
	cursor: pointer;
}
</style>
</head>
<body>
	 <%@ include file="../common/header.jsp" %>

	<section>
		<br>
		<br>
		<div class="category">
			<i class="far fa-edit"></i> 
			<label id="cate">게시글 작성</label><br><br> 
		</div>
		
	<div id="outline">
    <form action="<%= request.getContextPath() %>/insert.tn"
			  method="post" enctype="multipart/form-data">
        <div class="insertArea">
        <!-- 게시글 추가 영역 -->
        <input type="hidden" name="bwriterId" value="test0" />
        <input type="hidden" name="bwriterNick" value="열매" />
        <input id="btitle" type="text" name="btitle" placeholder="제목을 입력해주세요" required maxlength="30"><br><br>
        <textarea name="bcontent" id="bcontent" placeholder="내용을 입력해주세요" maxlength="300"></textarea>
    <br />
    <table> 
        <tr>
            <td>
                <div id="titleImgArea">
                    <img id="titleImg" width="250" height="200">
                    <span id="thumbTitle">대표사진</span>
                </div>
            </td>
            <td>
                <div id="contentImgArea1">
                    <img id="contentImg1" width="250" height="200">
                </div>
            </td>
            <td>
                <div id="contentImgArea2">
                    <img id="contentImg2" width="250" height="200">
                </div>
            </td>
            <td>
                <div id="contentImgArea3">
                    <img id="contentImg3" width="250" height="200">
                </div>
            </td>
        </tr>
    </table>
    </div>

    <div class="fileArea" id="fileArea">
        <!-- 첨부할 사진 추가 영역 -->
        <input type="file" name="thumbnailImg1" id="thumbnailImg1" onchange="loadImg(this,1);" />
        <input type="file" name="thumbnailImg2" id="thumbnailImg2" onchange="loadImg(this,2);" />
        <input type="file" name="thumbnailImg3" id="thumbnailImg3" onchange="loadImg(this,3);" />
        <input type="file" name="thumbnailImg4" id="thumbnailImg4" onchange="loadImg(this,4);" />
    </div>
    
    <br /><br />

        <div class="btnArea">
            <button id="btn" type="submit">작성 완료</button>
            <button id="btn" type="reset"
            	onclick="location.href='<%=request.getContextPath()%>/selectList.tn'">작성 취소</button>
        </div>
    </form>
    </div>
    
	</section>		
	<script>
		// 사진 게시글 미리보기 기능 구현
		$(function(){
			$('#titleImgArea').click(function(){
				$('#thumbnailImg1').click();
			});
			
			$('#contentImgArea1').click(function(){
				$('#thumbnailImg2').click();
			});
			
			$('#contentImgArea2').click(function(){
				$('#thumbnailImg3').click();
			});
			
			$('#contentImgArea3').click(function(){
				$('#thumbnailImg4').click();
			});
			
			$('#fileArea').hide();
		})
		
		function loadImg(img, num){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					switch(num){
					case 1 : $('#titleImg').attr('src', e.target.result);
							 break;
					case 2 : $('#contentImg1').attr('src', e.target.result);
							 break;
					case 3 : $('#contentImg2').attr('src', e.target.result);
							 break;
					case 4 : $('#contentImg3').attr('src', e.target.result);
							 break;
					}
				}
				
				reader.readAsDataURL(img.files[0]);
			}	
		}
	</script>

	<br />
	<%@ include file="../common/footer.jsp" %>
</body>
</html>



