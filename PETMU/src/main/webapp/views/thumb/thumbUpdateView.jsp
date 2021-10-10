<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.petmu.thumb.model.vo.*"%>
<%
	Thumbnail t = (Thumbnail)request.getAttribute("thumbnail");
	ArrayList<Attachment> fileList
	   = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2);
	Attachment detailImg3 = fileList.get(3);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 게시글 수정</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
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

#cate { /* 상단 머리글(게시글 수정) */
	font-size: 25px;
	text-decoration: none;
}

#btitle { /* 게시글 제목 */
	font-size: 25px;
	width: 1000px;
	border: 0;
	border-bottom: 1px solid grey;
	padding: 10px;
}

#outline { /* 입력폼 + 버튼 묶은 div */
	width: 1300px;
	margin-left: 45px;
	border: 1px solid lightgrey;
	padding: 15px 15px 15px 15px;
}

#updateArea { /* 입력폼(제목,내용,사진) */
	width: 500px;
	width: 1300px;
	margin-left: 45px;
	border: 1px solid lightgrey;
	padding: 15px 15px 15px 15px;
}

#bcontent { /* 내용 */
	width: 1000px;
	height: 150px;
	padding: 10px;
	resize: none;
}

table { /* 사진 */
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

#thumbTitle { /* 대표사진 span 태그 */
	width : 100px;
	display : block;
	text-align : center;
	background-color : black;
	color : white;
	font-size : 13pt;
	margin-top : -200px;
	position : absolute;
}

.btnArea {
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
	<br><br>
		<div class="category">
			<i class="far fa-edit"></i> <label id="cate">게시글 수정</label><br>
			<br>
		</div>
		
		<div id="outline">
		<form action="/petmu/update.tn" method="post" enctype="multipart/form-data">
			<div id="updateArea"> 
				<!-- 게시글 수정 영역 -->
				<input type="hidden" name="bno" value="<%= t.getBno() %>"/>
				<input type="text" id="btitle" name="btitle" value="<%= t.getbtitle() %>"/><br><br>
				<textarea name="bcontent" id="bcontent" ><%= t.getBcontent() %></textarea>
				
				<table>
					<tr>
						<td>
							<div id="titleImgArea">
								<img id="titleImg" width="250" height="200"
								 src="<%= request.getContextPath()%>/resources/thumbFiles/<%= titleImg.getChangename() %>">           
								<span id="thumbTitle">대표사진</span>
							</div>
						</td>
					
						<td>
							<div id="contentImgArea1">
							<% if (detailImg1.getChangename() != null) { %>
								<img id="contentImg1" width="250" height="200"
								     src="<%=request.getContextPath() %>/resources/thumbFiles/<%= detailImg1.getChangename() %>">
							<% } else { %>
								<img id="contentImg1" width="250" height="200" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
						
						<td>
							<div id="contentImgArea2">
							<% if (detailImg2.getChangename() != null) { %>
								<img id="contentImg2" width="250" height="200"
									src="<%=request.getContextPath() %>/resources/thumbFiles/<%= detailImg2.getChangename() %>">
							<% } else { %>
								<img id="contentImg2" width="250" height="200" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
						
						<td>
							<div id="contentImgArea3">
							<% if (detailImg3.getChangename() != null) { %>
								<img id="contentImg3" width="250" height="200"
									src="<%=request.getContextPath() %>/resources/thumbFiles/<%= detailImg3.getChangename() %>">
							<% } else { %>
								<img id="contentImg3" width="250" height="200" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
					</tr>
		      	</table>
			</div>
			
			<div class="fileArea" id="fileArea">
				<!-- 첨부 사진 추가 영역 -->
				<input type="file" accept="image/*" name="thumbImg1" id="thumbImg1" onchange="loadImg(this,1);" />
				<input type="file" accept="image/*" name="thumbImg2" id="thumbImg2" onchange="loadImg(this,2);" />
				<input type="file" accept="image/*" name="thumbImg3" id="thumbImg3" onchange="loadImg(this,3);" />
				<input type="file" accept="image/*" name="thumbImg4" id="thumbImg4" onchange="loadImg(this,4);" />
			</div>
			
			<br><br>
			
			<div class="btnArea">
				<button id="btn" type="submit">수정 완료</button> &nbsp;
				<button id="btn" type="button" onclick="goDetail();">수정 취소</button>
			</div>
			
		</form>
		</div>
		
	<br><br>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
		<script>

		function goDetail(){
			location.href="<%= request.getContextPath()%>/selectOne.tn?bno=<%= t.getBno() %>";
		}
	
		$('#titleImgArea').on('click', function(){
			$('#thumbImg1').click();
		});
		
		$('#contentImgArea1').on('click',function(){
			$('#thumbImg2').click();
		});
		
		$('#contentImgArea2').on('click',function(){ 
			$('#thumbImg3').click();
		});
		
		$('#contentImgArea3').on('click',function(){ 
			$('#thumbImg4').click();
		});
		
		$('#fileArea').hide();
		
		// 사진 미리보기 구현
		function loadImg(img, num) {
			if(img.files && img.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e){
					switch(num) {
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
</html>