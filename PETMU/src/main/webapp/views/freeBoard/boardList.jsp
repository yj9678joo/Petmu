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
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<!-- 타이틀로고 -->
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/resources/images/petmu.ico" /> 
<!-- fontawesome 아이콘cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" /> 
<!-- 구글폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	.outer{
		width : 1400px;
		height : auto;
		background : white;
		margin-left : auto;
		margin-right: auto;
		padding: 50px;

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
	
	    #listArea tbody td:nth-child(2) {
        text-align: left;
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
    
    #listArea i {
    	color : orange;
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
    	color : gray;
    	background : none;
    	border : none;
    	font-family: 'Jua', sans-serif;
    	font-size : 13pt;
    }
    
    .pagingArea button:hover {
    	color : orange;
    	cursor: pointer;
    }
	
   	#searchFrm {
		text-align: center;
		display : flex;
		width : 510px;
		margin-left : auto;
		margin-right : auto;
	}
	
	#bsearch {
		width:350px; 
		height:26px;
		border :1px solid grey;
	}
	
	select {
		width:80px; 
		height:30px;
		border : 1px solid grey;
	}
	
	#searchBtn {
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
                    <td><i class="fas fa-thumbs-up"></i> + <%= fb.getlikeCount() %></td>
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
				
			<%-- <% } %> --%>			
		</div>
		
		<br /><br /><br />
		
		<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
		<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=1'"><i class="fas fa-angle-double-left"></i></button>
			<%  if(currentPage <= 1){  %>
			<button disabled><i class="fas fa-angle-left"></i></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%=currentPage - 1 %>'"><i class="fas fa-angle-left"></i></button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled style="color : orange;"><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled><i class="fas fa-angle-right"></i></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%=currentPage + 1 %>'"><i class="fas fa-angle-right"></i></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.fb?currentPage=<%= maxPage %>'"><i class="fas fa-angle-double-right"></i></button>
		
		</div>
		
		<br /><br /><br />
		
		<div id="searchArea">
			<div id="searchFrm">
				<select id="searchTarget" name="searchTarget">
				<%-- 삼항연산자 사용
						옵션(searchTarget)에서 value(title, writerId, writerNick)를 
						선택한게 맞다면 선택한 옵션이 남아있게 함.
						검색버튼을 누르고 페이지가 바뀌어도 선택한 옵션이 그대로 선택되어 있음.
				 --%>
					<option ${(param.searchTarget == "title") ? "selected" : " " } value="title">제목</option>
					<option ${(param.searchTarget == "writerId") ? "selected" : " " } value="writerId">아이디</option>
					<option ${(param.searchTarget == "writerNick") ? "selected" : " " } value="writerNick">닉네임</option>
				</select> &nbsp; 
					<input id="bsearch" type="text" name="bsearch" value="${param.keyword}"
							placeholder="검색어를 입력해주세요" /> &nbsp; 
					<input id="searchBtn" type="button" value="검색" onclick="search();" />
			</div>
		</div>
		
		
	</div>

	<br />
	<%@ include file="../common/footer.jsp" %>

</body>

<script>
// 게시글 리스트 마우스이벤트, 작성하기 버튼 함수
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
/* -- 질문했었던 부분
	위에 테이블 tr>td 안에 input type="hidden"으로 bno를 받아오면 
	var bno = $(this).parent().find('input').val();
	내 코드에선 input type="hidden"을 안쓰고 tr>td 안에서 바로 bno값을 받았기때문에
	var bno = $(this).parent().find('td:first').html(); 라고 써서
	부모인 tr 밑에 첫번째 td 값을 가져오는 것
*/

// 검색 기능
function search(){
	var target = $('#searchTarget').val();
	var keyword = $('#bsearch').val();
	
	console.log(keyword);
	
	if(!keyword){
		alert("검색어를 입력해주세요.")
	} else {
		location.href = "<%= request.getContextPath()%>/selectList.fb?searchTarget=" + target + "&keyword=" + keyword;
	}
}
</script>
</html>