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
<title>Petmu : 댕냥자랑</title>
<script src="/petmu/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="/petmu/resources/images/petmu.ico" /> 
<!-- awesome 아이콘 cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" /> 
<!-- 구글폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
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
  	width : 1200px;
  	margin-left : 45px;
  }
  
  .detail {
  	width: 1200px;
  	text-align: right;
  	
  }
  
  #outline {
  	width: 1300px;
  	margin-left: 45px;
  	border : 1px solid lightgrey;
  	padding : 15px 15px 15px 15px;
  }
  
  i { /* 카테고리 아이콘 */
  	font-size: 24px;
  	color : grey;
  }
  
  a { /* 카테고리 a태그 */
  	font-size: 25px;
  	text-decoration: none;
  	color: orange;
  	font-family: 'Jua', sans-serif;
  }
  
  #btitle{
  	width : 800px;
  	font-size : 28px;
  	font-weight: bold;
  	/* 글자길이 800px 초과시 숨겨지게 (원래 ... 으로 떠야되는데 안뜸, 입력받을 때 글자수 제한 둬야할 듯)*/
	overflow: hidden;
	text-overflow : elipsis;
  	white-space : nowrap;
  }
  
  #bwriter {
  	font-weight: bold;
  	font-size : 20px;
  }
  
  #right {
  	text-align: right;
  	width : 350px;
  }
  

  #contentArea {
	width : 607px;

  }
  
  #content {
  	width : 200px;
  }
  
  
  .slides {
  	padding: 0;
  	width: 609px;
  	height: 420px;
  	display: block;
	margin-left : 0;
  	position: relative;
  }
  
  .slides * {
  	user-select: none;
  	-ms-user-select: none;
  	-moz-user-select: none;
  	-khtml-user-select: none;
  	-webkit-user-select: none;
  	-webkit-touch-callout: none;
  }
  
  .slides input {
  	display: none;
  }
  
  .slide-container {
  	display: block;
  }
  
  .slide {
  	top: 0;
  	opacity: 0;
  	width: 609px;
  	height: 420px;
  	display: block;
  	position: absolute;
  	transform: scale(0);
  	transition: all .7s ease-in-out;
  }
  
  .slide img {
  	width: 100%;
  	height: 100%;
  }
  
  .nav label {
  	width: 200px;
  	height: 100%;
  	display: none;
  	position: absolute;
  	opacity: 0;
  	z-index: 9;
  	cursor: pointer;
  	transition: opacity .2s;
  	color: #FFF;
  	font-size: 140pt;
  	text-align: center;
  	line-height: 380px;
  	background-color: rgba(255, 255, 255, .3);
  	text-shadow: 0px 0px 15px rgb(119, 119, 119);
  }
  
  .slide:hover+.nav label {
  	opacity: 0.5;
  }
  
  .nav label:hover {
  	opacity: 1;
  }
  
  .nav .next {
  	right: 0;
  }
  
  input:checked+.slide-container  .slide {
  	opacity: 1;
  	transform: scale(1);
  	transition: opacity 1s ease-in-out;
  }
  
  input:checked+.slide-container .nav label {
  	display: block;
  }
  
  .nav-dots {
  	width: 100%;
  	bottom: 9px;
  	height: 11px;
  	display: block;
  	position: absolute;
  	text-align: center;
  }
  
  .nav-dots .nav-dot {
  	top: -5px;
  	width: 11px;
  	height: 11px;
  	margin: 0 4px;
  	position: relative;
  	border-radius: 100%;
  	display: inline-block;
  	background-color: rgba(0, 0, 0, 0.6);
  }
  
  .nav-dots .nav-dot:hover {
  	cursor: pointer;
  	background-color: rgba(0, 0, 0, 0.8);
  }
  
  input#img-1:checked ~ .nav-dots label#img-dot-1, 
  input#img-2:checked ~ .nav-dots label#img-dot-2, 
  input#img-3:checked ~ .nav-dots label#img-dot-3,
  input#img-4:checked ~ .nav-dots label#img-dot-4 {
  	background: rgba(0, 0, 0, 0.8);
  }
  
  #content {
  	width : 800px;
  	heigth : auto;
  	padding : 5px;
	font-size : 13pt;
  }  
  
  #likeArea>span {
	display: table-cell;
	vertical-align: middle;
	font-size: 18px;
	font-weight: bold;
	width: auto;
	height: 35px;
	padding: 0 10px;
	border: 1px solid orange;
	border-radius: 3px;
	background: rgb(255, 244, 230);
}

#likeArea i {
	padding-right: 7px;
}

#likeArea>span:hover {
	cursor: pointer;
	color: white;
	background: orange;
}
  
  #btnArea {
	float: right;
}
  
  #btnArea button {
	width: 50px;
	padding: 10px;
	border: 0;
	outline: none;
	font-weight: bold;
	font-size: 15px;
	border-radius : 3px;
}

#btnArea button:hover {
	cursor : pointer;
}

#deleteBtn {
	color : white;
	background : rgb(254, 54, 64);
}

  
  #comments {
	padding : 15px;
	margin-left : 30px;
  }
  
  #comment-head {
  	margin-top : -10px;
  	font-weight : bold;;
  }
  
  #comment-new {
  	width:1000px; 
  	height:50px; 
  	border:1px solid lightgrey;

  }
  
  .comment {
  	margin-left : 40px;
  }
  
  
  .btnArea2 {
  	margin : auto;
  	display : block;
  	text-align: center;
  }
  
  #commentBtn {
    width : 100px;
    height : 45px;
	padding : 10px;
	border : 0;
	outline: none;
	color : orange;
	font-weight: bold;
	font-size : 15px;
	border-radius : 3px;
  }
  
  #commentBtn:hover {
  	cursor : pointer;
  } 
    
  #goListBtn {
  	width : 100px;
	padding : 10px;
	border : 0;
	outline: none;
	color : orange;
	font-weight: bold;
	font-size : 15px;
  }
  
  #goListBtn:hover {
  	cursor : pointer;
  }
  
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<section>
		<br>
		<br>
		<div class="category">
			<i class="far fa-edit"></i> 
			<a href='<%= request.getContextPath() %>/selectList.tn'>우리 댕냥 자랑</a><br><br> 
		</div>
		
		<div id="outline">
		
		<table style="width:1300px; table-layout : fixed;">
			<tr>
				<td id="btitle" colspan="1"><%= t.getbtitle() %></td>
				<td id="right" colspan="3"><sub><%= t.getBdate() %></sub></td>
			</tr>
			<tr>
				<td id="bwriter" ><%= t.getbwriterNick() %>(<%= t.getbwriterId() %>)</td>
				<td id="right">조회수 <%= t.getBcount() %></td>
				<td id="right">추천수 <%= t.getlikeCount() %></td>
				<td id="right">댓글 15</td>
			</tr>
		</table>


			<hr />
			<br />

			<ul class="slides">
				<input type="radio" name="radio-btn" id="img-1" checked />
				<li class="slide-container">
					<div class="slide">
						<img id="titleImg"
							src="<%=request.getContextPath()%>/resources/thumbFiles/<%=titleImg.getChangename()%>">
					</div>
					<div class="nav">
						<label for="img-4" class="prev">&#x2039;</label> <label
							for="img-2" class="next">&#x203a;</label>
					</div>
				</li>

				<input type="radio" name="radio-btn" id="img-2" />
				<li class="slide-container">
					<div class="slide">
						<%
						if (detailImg1.getChangename() != null) {
						%>
						<img id="detailImg1"
							src="<%=request.getContextPath()%>/resources/thumbFiles/<%=detailImg1.getChangename()%>">
						<%
						} else {
						%>
						<img id="detailImg1" class="detailImg"
							src="<%=request.getContextPath()%>/resources/images/no-image.png">
						<%
						}
						%>
					</div>
					<div class="nav">
						<label for="img-1" class="prev">&#x2039;</label> <label
							for="img-3" class="next">&#x203a;</label>
					</div>
				</li>

				<input type="radio" name="radio-btn" id="img-3" />
				<li class="slide-container">
					<div class="slide">
						<%
						if (detailImg2.getChangename() != null) {
						%>
						<img id="detailImg2"
							src="<%=request.getContextPath()%>/resources/thumbFiles/<%=detailImg2.getChangename()%>">
						<%
						} else {
						%>
						<img id="detailImg2" class="detailImg"
							src="<%=request.getContextPath()%>/resources/images/no-image.png">
						<%
						}
						%>
					</div>
					<div class="nav">
						<label for="img-2" class="prev">&#x2039;</label> <label
							for="img-4" class="next">&#x203a;</label>
					</div>
				</li>

				<input type="radio" name="radio-btn" id="img-4" />
				<li class="slide-container">
					<div class="slide">
						<%
						if (detailImg3.getChangename() != null) {
						%>
						<img id="detailImg3"
							src="<%=request.getContextPath()%>/resources/thumbFiles/<%=detailImg3.getChangename()%>">
						<%
						} else {
						%>
						<img id="detailImg3" class="detailImg"
							src="<%=request.getContextPath()%>/resources/images/no-image.png">
						<%
						}
						%>
					</div>
					<div class="nav">
						<label for="img-3" class="prev">&#x2039;</label> <label
							for="img-1" class="next">&#x203a;</label>
					</div>
				</li>



				<li class="nav-dots"><label for="img-1" class="nav-dot"
					id="img-dot-1"></label> <label for="img-2" class="nav-dot"
					id="img-dot-2"></label> <label for="img-3" class="nav-dot"
					id="img-dot-3"></label> <label for="img-4" class="nav-dot"
					id="img-dot-4"></label>
				</li>
			</ul>

		
		<p id="content" ><%= t.getBcontent() %></p>
		
			<div id="likeArea" align="center">
				<span> <i class="fas fa-thumbs-up"></i> <span><%=t.getlikeCount()%>
						Like</span> <%--likecount 가져오기 --%>
				</span>
			</div>
			
			<br />
			<div id="btnArea">
		<%-- <%
		if (m != null && m.getUserId().equals(t.getBwriter())) {
		%> --%>
		<button id="updateBtn"
			onclick="location.href='<%=request.getContextPath()%>/updateView.tn?bno='+<%=t.getBno()%>">수정</button>
		<button id="deleteBtn" onclick="deleteOk();">삭제</button>
		<%-- <%
		}
		%> --%>
		</div>
		<br /><br />
		
		<br /><hr />
		
		<div id="comments">
			<div id="comment-head" class="comment-row">
				<span id="comments-count">댓글  t.getCcount</span>
			</div>
			<br />
			
			<table style="width:1200px;">
				<tr>
					<td><%= t.getbwriterNick() %></td>
					<td>댓글 샘플 내용1 입니다.</td>
					<td style="text-align:right">2021-10-05 15:09:33</td>
				</tr>
				
				<tr>
					<td><%= t.getbwriterNick() %></td>
					<td>댓글 샘플 내용12 입니다. 댓글 샘플 내용12 입니다. 댓글 샘플 내용12 입니다.</td>
					<td style="text-align:right">2021-10-05 15:09:33</td>
				</tr>
				
				
			</table>
			
			<br />
			<div class="comment">
				<input id="comment-new" 
						type="text" placeholder="내용을 입력해주세요"/>
				<button id="commentBtn" type="submit" onclick="submitComment()">등록</button>
			</div>
		</div>

		</div>
		
		<br><br><br>

		<div class="btnArea2">
		<button id="goListBtn"
			onclick="location.href='<%=request.getContextPath()%>/selectList.tn'">목록으로</button>
		</div>

		<br>
		<br>
	</section>
	<br />
	<%@ include file="../common/footer.jsp"%>
</body>
<script>

function deleteOk(){
 	if (!confirm("삭제시 복구 할 수 없습니다. 삭제하시겠습니까?")) {
        // 취소(아니오) 버튼 클릭 시 이벤트
    } else {
        // 확인(예) 버튼 클릭 시 이벤트
    	location.href='<%=request.getContextPath()%>/delete.tn?bno=<%= t.getBno() %>';        
    }
	
}
</script>
</html>













