<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.petmu.thumb.model.vo.*" %>
<%
	ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmu : 댕냥자랑</title>
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
		background-color : #E9E9E9;
	}

	section {
		width : 1400px;
		height : auto;
		background : white;
		margin-left : auto;
		margin-right: auto;
		padding: 50px;
		margin-top : 40px;
	}
	
	#thumbnailArea {
		width : 1300px;
		height : auto;
		margin-left : auto;
		margin-right : auto;
		margin-top : 30px;
		padding-left : 12px;
	}
	
	.thumb-list {
		width : 230px;
		border : 1px solid grey;
		display : inline-block;
		margin : 10px;
		align : center;
	}
	
	.thumb-list:hover {
		opacity : 0.8;
		cursor : pointer;
	}
	
	ul {
		width : 200px;
		list-style : none;
		text-align : center;
		/* 블릿기호 없애고 생긴 여백 없애기 */
		padding-left : 0px;
		/* 글자수 200px 초과시 안보이게 */
		overflow : hidden;
		text-overflow : ellipsis;
		white-space : nowrap;
	}
	
	#btitle {
		font-weight : bold;
	}
	
	i { /* 카테고리 아이콘 */
	font-size: 40px;
	color: grey;
	}
	
	.category {
		font-family: 'Jua', sans-serif;
		margin-top : -30px;
		font-size : 50px;
		color : orange;
	}
	
	#Bhead {
		text-align: center;
	}
	
	#photoInfo {
		font-family: 'Jua', sans-serif;
		text-align : center;
		margin-top : -8px;
		font-size : 23px;
		color : grey;
	}
	
	#btn1 {
  		width : 100px;
		padding : 10px;
		border : 0;
		outline: none;
		color : orange;
		font-weight: bold;
		font-size : 15px;
		margin : auto;
  		display : block;
  		text-align: center;
  		float : right;
	}
	
	#btn1:hover {
	 	opacity : 0.5;
  	 	cursor : pointer;
	}
	
	.pagingArea button {
		border : 0;
		outline : none;
		background-color : white;
		font-size : 12pt;
	}
	
	.pagingArea button:hover {
	 	opacity : 0.5;
     	cursor : pointer;
	}
	
	#serchArea {
		width : 1000px;
		height : 50px;
		margin-left : auto;
		margin-right : auto;
	}
	
	#serchArea {
		width : 1000px;
		height : 50px;

		margin-left : auto;
		margin-right : auto;
	}
	
	form {
		text-align: center;
		height : 50px;
	}
	
	#bserch {
		width:350px; 
		height:26px;
		border :1px solid grey;
	}
	
	select {
		width:80px; 
		height:30px;
		border : 1px solid grey;
	}
	
	#btn2 {
		width:60px; 
		height:35px; 
		border:0; 
		font-weight: bold;
		color : orange;
	}
	
	#btn2:hover {
		cursor : pointer;
	}

	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<section>
		<br>
		<div id="Bhead">
		<i class="far fa-images"></i>
		<label class="category"> 우리 댕냥 자랑</label>
		<p id="photoInfo">
			반려동물의 모습을 사진으로 자랑하세요!
		</p>
		</div>
		<hr />
		<div id="thumbnailArea">
			<% for(Thumbnail thumb : list) { %>
				<div class="thumb-list" align="center">
					<div>
						<input type="hidden" name="bno" value="<%= thumb.getBno() %>" />
						<img src="<%=request.getContextPath() %>/resources/thumbFiles/<%= thumb.getBfile() %>"
						     width="230px" height="200px"/>					
					</div>
					
					<ul>
						<li id="btitle"><%= thumb.getbtitle() %></li>
						<li><b><%= thumb.getbwriterNick() %></b>(<%= thumb.getbwriterId() %>)</li>
						<li>조회수 <%= thumb.getBcount() %> &nbsp;댓글 2</li>
						<%-- <li><%= thumb.getBdate() + " 조회 " + thumb.getBcount() %></li> --%>
					</ul>
				</div>
							
			<% } %>
			<br><br>
	
				<button id="btn1" onclick="location.href='views/thumb/thumbInsert.jsp'">작성하기</button>
	
		</div>
		
		<br /><br /><br />
		
		<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
		<button onclick="location.href='<%= request.getContextPath() %>/selectList.tn?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.tn?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.tn?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.tn?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.tn?currentPage=<%= maxPage %>'">>></button>
		
		</div>
		 
		<br /><br /><br />
		<div id="serchArea">
			<form>
				<select name="f">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
				<input id="bserch" type="text" name="q" 
						value="" placeholder="검색어를 입력해주세요"/>
				<input id="btn2" type="submit" value="검색"/>
			</form>
		</div>
	</section>
	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				// var bno = $(this).children().children().eq(0).val();
				var bno = $(this).find('input').val();
				// console.log(bno);
				
				location.href = '<%= request.getContextPath()%>/selectOne.tn?bno=' + bno;
			});
		})
	</script>
	
	<br />
	<%@ include file="../common/footer.jsp" %>

</body>
</html>