<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.petmu.freeBoard.model.vo.*, com.kh.petmu.comment.model.vo.*, java.util.*"%>

<%
freeBoard fb = (freeBoard) request.getAttribute("freeBoard");
// ArrayList<Comment> coList = (ArrayList<Comment>)request.getAttribute("coList");
// int cmtCount = (int)request.getAttribute("cmtCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 잡담게시판</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%= request.getContextPath()%>/resources/images/petmu.ico" />
<!-- awesome 아이콘 cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<!-- 구글폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	background-color: #E9E9E9;
}

.outer {
	width: 1400px;
	height: auto;
	background: white;
	margin-left: auto;
	margin-right: auto;
	padding: 50px;
	margin-top: 40px;
}

.category {
	width: 1200px;
	margin-left: 35px;
}

i { /* 카테고리 아이콘 */
	font-size: 24px;
	color: grey;
}

#atag { /* 카테고리 a태그 */
	font-size: 25px;
	text-decoration: none;
	color: orange;
	font-family: 'Jua', sans-serif;
}

#btitle {
	width: 800px;
	font-size: 25px;
	font-weight: bold;
	overflow: hidden;
	text-overflow: elipsis;
	white-space: nowrap;
}

#bwriter {
	font-weight: bold;
	font-size: 18px;
}

#right {
	text-align: right;
	width: 350px;
}

.tableArea {
	width: 1300px;
	margin-left: 35px;
	border: 1px solid lightgrey;
	padding: 25px 25px 25px 25px;
}

#bcontent {
	width: 1300px;
	height: 500px;
	resize: none;
	border: none;
	font-size: 13pt;
	background-color: white;
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

.btnArea2 button {
	width: 130px;
	padding: 10px;
	border: 0;
	outline: none;
	color: orange;
	font-weight: bold;
	font-size: 15px;
}

.btnArea2 button:hover {
	cursor: pointer;
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

#cmtCount {
	font-weight: bold;
}

#cmtCount label {
	color: orange;
}

.cmts {
	border-bottom: 1px solid lightgray;
}

.cmtHead>div {
	float: left;
}

.cmtHead>span {
	float: right;
}

.cmtHead i:hover {
	cursor: pointer;
}

.cmtBody {
	padding: 5px 0;
}

.cmtFoot {
	text-align: right;
	font-size: 12px;
	color: gray;
	padding-bottom: 3px;
}

#cmtInsert {
	display: flex;
	align-items: center;
	padding: 20px 0;
}

#ccontent {
	border: 2px solid lightgray;
	border-radius: 3px;
}

#ccontent:focus {
	outline: none;
}

#cmtBtn {
	margin-left: 10px;
	width: 110px;
	height: 53px;
	background: rgb(241, 241, 241);
	border: 2px solid gray;
	border-radius: 3px;
	font-size: 17px;
	font-weight: bold;
}

#cmtBtn:hover {
	background: rgb(241, 241, 241);
	cursor: pointer;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="outer">
		<br> <br>
		<div class="category">
			<i class="far fa-edit"></i> 
			<a id="atag" href='<%=request.getContextPath()%>/selectList.fb'>잡담게시판</a><br>
			<br>
		</div>

		<div class="tableArea">
			<table style="width: 1300px; table-layout: fixed;">
				<tr>
					<td id="btitle" name="btitle" colspan="1"><%=fb.getbtitle()%></td>
                    <input type="hidden" name="bno" value="<%=fb.getBno() %>" />
					<td id="right" colspan="3"><sub><%=fb.getBdate()%></sub></td>
				</tr>
				<tr>
					<td id="bwriter"><%= fb.getbwriterNick() %>(<%= fb.getbwriterId() %>)</td>
					<td id="right">조회수 <%= fb.getBcount()%></td>
					<td id="right">추천수 <%= fb.getlikeCount() %></td>
					<td id="right">댓글 2</td>
				</tr>
			</table>
			<hr />
			<br>
                <article id="bcontent"> 
                    <%= fb.getBcontent() %>
                </article>
			
			<div id="likeArea" align="center">
				<span> <i class="fas fa-thumbs-up"></i> <span><%= fb.getlikeCount()%>
						Like</span> <%--likecount 가져오기 --%>
				</span>
			</div>
			<%
			if (fb.getBfile() != null && fb.getBfile().length() > 0) {
			%>
		<label>첨부파일 </label><a href="<%= request.getContextPath() %>/resources/boardUploadFiles/<%=fb.getBfile() %>" download>
							<%=fb.getBfile() %></a>
		<% } %>

			<span id="btnArea">


				<%-- <%
				if (m != null && m.getUserId().equals(fb.getbwriterId())) {
				%> --%>
				<button id="updateBtn"
					onclick="location.href='<%=request.getContextPath()%>/updateView.fb?bno='+<%=fb.getBno()%>">수정</button>
				<button id="deleteBtn" onclick="deleteOk();">삭제</button>
				<%-- <%
				}
				%> --%>
			</span>
			<br /><br />
		
		<br />
		<hr />
<%-- 
			<div class="cmtListArea">
				for each문으로 comment정보 담기
				<%
				for (Comment c : coList) {
				%>
				<div class="cmts">
					<div class="cmtHead">
						<div>
							<input type="hidden" name="cno" value="<%=c.getCno()%>" />
							cno 가져오기
							<span style="font-size: 14px; font-weight: bold;"><%=c.getCwriterNick()%></span>
							<input type="hidden" name="cwriterId"
								value="<%=c.getCwriterId()%>" />
							cno 가져오기
						</div>
						usernickname과 cwriter 일치하면 보이기
						<span style="font-size: 13px;"> <i class="far fa-edit"
							id="updateCmt"></i> &nbsp; <i class="far fa-trash-alt"
							id="deleteCmt"></i>
						</span>
					</div>
					<br />
					<div class="cmtBody" style="font-size: 14px;">
						<%=c.getCcontent()%>
					</div>
					<div class="cmtFoot"><%=c.getCdate()%></div>
				</div>
				<%
				}
				%>
			</div> --%>
		</div>


			<br /> <br />

			<div align="center" class="btnArea2">
				<button id="goMenuBtn"
					onclick="location.href='<%=request.getContextPath()%>/selectList.fb'">목록으로</button>

			</div>
			</div>

			<br /> <br />



		<%@ include file="../common/footer.jsp"%>
</body>
<script>

function deleteOk(){
 	if (!confirm("삭제시 복구 할 수 없습니다. 삭제하시겠습니까?")) {
        // 취소(아니오) 버튼 클릭 시 이벤트
    } else {
        // 확인(예) 버튼 클릭 시 이벤트
    	location.href='<%=request.getContextPath()%>/delete.fb&bno=<%= fb.getBno() %>';        
    }
	
}
</script>

</html>