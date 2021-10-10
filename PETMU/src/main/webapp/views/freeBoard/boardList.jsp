<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.petmu.freeBoard.model.vo.*, java.util.*" %>
<%
	ArrayList<freeBoard> list = (ArrayList<freeBoard>)request.getAttribute("list");
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
<title>PETMU : 잡담게시판</title>
<script src="/PetMu/resources/js/jquery-3.6.0.min.js"></script>
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
	.outer{
		width : 1400px;
		height : auto;
		background : white;
		margin-left : auto;
		margin-right: auto;
		padding: 50px;
		margin-top : 40px;
	}
	
	#title {
		font-weight : bold;
		margin-left : 35px;
	}
	
	#cateicon { /* 카테고리 아이콘 */
		font-size: 30px;
		color: grey;
		margin-left : 35px;
	}
	
	#likeicon {
		color : orange;
	}
	
	.category {
		font-family: 'Jua', sans-serif;
		margin-top : -30px;
		font-size : 30px;
		color : orange;
	}
	
	.tableArea {
		width : 1300px;
		height : auto;
	}
	
	#listArea {
		margin-left : 35px;
	}
	
	
	#listArea {
		width : 1300px;
		border-collapse : collapse;
	}
	
    #listArea th {
    	height : 30px;
        border-top : 3px solid gray;
        border-bottom : 1px solid lightgray;
    }
    
   	#listArea td {
   		height : 30px;
        border-bottom : 1px solid lightgray;
    }
    
    #listArea td:hover {
    	cursor:pointer;
    }
    
    .btnArea {
    	width : 1330px;
    }
    
    #postBtn {
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
  
  	#postBtn:hover {
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
	
	#serchBtn {
		width:60px; 
		height:32px; 
		border:0; 
		font-weight: bold;
		color : orange;
	}
	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="outer">
		<br>
		<div id="Bhead">
		<i id="cateicon" class="far fa-edit"></i>
		<label class="category">잡담게시판</label>	
		</div>
		
		<br>
		
		<div class="tableArea">
			<table id="listArea" >
				<thead>
					<tr align="center">
						<th width="60px">No.</th>
						<th width="650px">제  목</th>
						<th width="150px">글쓴이</th>
						<th width="150px">작성일</th>
						<th width="100px">조회수</th>
						<th width="100px">추천수</th>
					</tr>
				</thead>
				
				<tbody align="center">
				<%
				for (freeBoard fb : list) {
				%>
				<tr>
					<td><%= fb.getBno()%></td>
					<td><%= fb.getbtitle()%></td>
					<td><%= fb.getbwriterNick()%></td>
					<td><%= fb.getBdate() %></td>
					<td><%= fb.getBcount() %></td>
                    <td><%= fb.getlikeCount() %></td>
				</tr>
				<% } %>
				</tbody>		
			</table>
		</div>
		<br />
		
		<div class="btnArea" >
			<%-- <% if ( m != null ) { %> --%> 
				<button id="postBtn" onclick="location.href='views/freeBoard/boardInsertForm.jsp'">
					작성하기
				</button>
				
				<script>
					$(function(){
						$('#listArea td').mouseenter(function(){
							$(this).parent().css({"background" : "#f2f2f2", "cursor" : "pointer"});
						}).mouseout(function(){
							$(this).parent().css({"background" : "white"});
						}).click(function(){
							var bno = $(this).parent().find('td:first').html();
							location.href = "<%= request.getContextPath() %>/selectOne.fb?bno=" + bno;
						});
					});
				</script>
			<%-- <% } %> --%>			
		</div>
		
		<br /><br /><br />
		
		<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
		<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%= maxPage %>'">>></button>
		
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
				<input id="serchBtn" type="submit" value="검색"/>
			</form>
		</div>
		
		
	</div>

	<br />
	<%@ include file="../common/footer.jsp" %>

</body>
</html>