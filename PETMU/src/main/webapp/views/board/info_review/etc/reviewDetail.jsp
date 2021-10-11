<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.petmu.board.model.vo.*, com.kh.petmu.comment.model.vo.*, java.util.*"%>

<%--vo임포트하고 board, comment list 가져오기 --%>

<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<Comment> coList = (ArrayList<Comment>)request.getAttribute("coList");
	int cmtCount = (int)request.getAttribute("cmtCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 기타 장소 이용 후기</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/sideMenu.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>


<style>

    .main {
        width : 1500px;
        height : 1000px;
        margin: 0 auto;
        
        
    }
    
    .boardArea {
    display : inline-block;
    padding-left: 30px;
    height : 800px;
    width : 1200px;
        
    }
    
	.postArea {
	    border-bottom : 1px solid lightgray;
	    padding-bottom : 10px;
	}
	
	#tableArea {
	    border-collapse: collapse;
	}
	
	#tableArea th:first-child {
	    text-align: left;
	    font-size: 25px;
	    width: 900px;
	}
	
	#tableArea th:last-child {
	    text-align: right;
	    font-weight: normal;
	}
	
	#tableArea td:first-child {
	    font-weight: bold;
	}
	
	#tableArea td {
	    border-bottom : 1px solid lightgray;
	    height : 35px;
	}
	
	#tableArea span {
		font-weight : normal;
	}
	
	#content {
	    border : 1px solid lightgray;
	    padding: 20px 20px;
	    border-radius: 5px;
	    max-height: 1100px;
   		overflow: auto;
	}
	
	
	#likeArea>span {
		display: table-cell;
		vertical-align: middle;
		font-size : 18px;
		font-weight : bold;
		width : auto;
		height : 35px;
		padding : 0 10px;
		border : 1px solid orange;
		border-radius : 3px;
		background : rgb(255, 244, 230);
	}
	
	#likeArea i{
	    padding-right : 7px;
	}
	
	#likeArea>span:hover {
		cursor:pointer;
		color : white;
		background : orange;
	}
	
	#cmtCount {
	    font-weight: bold;
	}
	
	#cmtCount label {
	    color : orange;
	}
	
	[class*=cmts] {
    border-bottom: 1px solid lightgray;
	}
	
	.cmtHead>div{
	    float: left;
	}
	
	.cmtHead>span{
	    float: right;
	}
	
	.cmtHead i:hover {
		cursor : pointer;
	}
	
	.cmtBody {
	    padding : 5px 0;
	}
	
	.cmtFoot {
	    text-align: right;
	    font-size: 12px;
	    color : gray;
	    padding-bottom: 3px;
	}
	
	
	#cmtInsert {
	    display: flex;
	    align-items: center;
	    padding : 20px 0;
	}
	
	#ccontent {
	    border : 2px solid lightgray;
	    border-radius: 3px;
	}
	
	#ccontent:focus, #upCon:focus {
	    outline : none;
	}
	
	#cmtBtn {
	    margin-left: 10px;
	    width:110px;
	    height: 53px;
	    background: rgb(241, 241, 241);
	    border : 2px solid gray;
	    border-radius: 3px;
	    font-size: 17px;
	    font-weight: bold;
	}
	
	#cmtBtn:hover {
	    background: rgb(241, 241, 241);
	    cursor: pointer;
	}
	
	#btnArea {
		text-align : center;
		padding-top : 15px;
	}
	
	
	#btnArea button:hover {
		cursor : pointer;
	}
	
	#goList {
		font-size : 16px;
		color : orange;
		font-weight : bold;
		width : 100px;
		height : 40px;
		background : rgb(231, 231, 231);
		border : none;
		border-radius : 3px;
	}

	#btnArea2 {
		text-align : right;
	}
	
	
	#btnArea2 button:hover {
		cursor : pointer;
	}
	
	#btnArea2 button {
		font-size : 13px;
		font-weight : bold;
		width : 50px;
		height : 30px;
		border : none;
		border-radius : 3px;
	}
	
	#goList2 {
		color : orange;
		background : rgb(231, 231, 231);

	}
	
	#updateBtn2 {
		color : white;
		background : rgb(34, 170, 236);

	}
	
	#deleteBtn2 {
		color : white;
		background : rgb(254, 54, 64);
	}
	
	.cmtUpdate {
	    border-bottom: 1px solid lightgray;
	    padding-top : 3px;
	}
	
	.upHead>div{
	    float: left;
	}
	
	.upHead>span{
	    float: right;
	}
	
	
	.upBody {
	    padding : 5px 0;
	}
	
	.upFoot {
	    text-align: right;
	    font-size: 12px;
	    color : gray;
	    padding-bottom: 3px;
	}
	
	#cmtCon {
	    border : 2px solid lightgray;
	    border-radius: 3px;
	}

	
	
	

</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
    <div class="main">

	<%@ include file="/views/common/sideMenu.jsp" %>	

        <div class="boardArea">
            <div id="boardTitle" style="font-family: 'Jua', sans-serif; font-size : 30px; padding-bottom : 10px;">
           		<i class="far fa-edit"></i>
                <label style="color : orange;"> 병원 / 약국 이용 후기</label>
            </div>

            <div id="content">

                <div class="postArea">
                    <table id="tableArea">
                            <tr>
                                <th><%=b.getBtitle() %></th> <%--btitie 가져오기 --%>
                            	<input type="hidden" name="bno" value="<%=b.getBno() %>" />
                                <th colspan="3"><%=b.getBdate() %></th> <%--bDate 가져오기 --%>
                            </tr>
                            <tr>
                                <td><%=b.getBwriterNick() %><span> (<%=b.getBwriterId() %>)</span></td> <%--bwriter 가져오기 --%>
                                <td width="100px" align="right">조회수 <%=b.getBcount() %></td> <%--bcount 가져오기 --%>
                                <td width="100px" align="right">추천수 <span class="likeCnt"><%=b.getLikeCount() %></span></td> <%--likeCount 가져오기 --%>
                                <td width="90px" align="right">댓글 <%= cmtCount %></td> <%--cmtCount 가져오기 --%>
                            </tr>
                    </table>
                    <br><br>
                    <p> <%--bcontent 가져오기 --%>
                        <%= b.getBcontent() %>
                    </p>
                    <br><br><br>
    
                    <div id="likeArea" align="center">
                    	<span id="likeBtn">
	                        <i class="fas fa-thumbs-up"></i>
	                        <span class="likeCnt"><%=b.getLikeCount() %></span> <%--likecount 가져오기 --%>
	                        <span>Like</span>                    	
                    	</span>
                    </div>
                    
                    <div id="btnArea2">
	                	<button id="goList2" onclick="goList();">목록</button>
	                	
	                	<%-- 로그인 멤버 게시글 작성 멤버 일치 확인 --%>
	                	<%if(m != null && m.getUserId().equals(b.getBwriterId())) { %>
	                	<button id="updateBtn2" onclick="update();">수정</button>
	                	<button id="deleteBtn2" onclick="deleteOk();">삭제</button>
                		<%} %>

               		 </div>
                    
                </div>
                <br>
                
                <div class="cmtArea">
                    <div id="cmtCount">
                        댓글 <label><%= cmtCount %></label> <%--cmtCount 가져오기 --%>
                    </div>
        
                    <div id="cmtInsert">
                        <textarea name="ccontent" id="ccontent" cols="145" rows="3" style="resize: none;" placeholder="댓글을 남겨 보세요."></textarea>
                        <button name="cmtBtn" id="cmtBtn" onclick="postCmt();">등록</button>
                    </div>
        			
        			<div class="cmtListArea">
        				<%--for each문으로 comment정보 담기 --%>
      					<%for(Comment c : coList) {%>
	                        <div class="cmts<%= c.getCno() %>">
	                            <div class="cmtHead">
	                                <div>
	                                	<input type="hidden" name="cno" value="<%= c.getCno() %>"/> <%--cno 가져오기 --%>
	                                    <span style="font-size: 14px; font-weight: bold;"><%= c.getCwriterNick() %></span>
	                                    <input type="hidden" name="cwriterId" value="<%= c.getCwriterId() %>"/> <%--cno 가져오기 --%>
	                                </div>
	                                <%if(m != null && m.getUserId().equals(c.getCwriterId())) { %>
		                                <span style="font-size: 13px;">
		                                    <i class="far fa-edit" id="updateCmt" onclick="updateCon('<%= c.getCno() %>', '<%= c.getCwriterNick() %>', '<%= c.getCcontent() %>');"></i> &nbsp;
		                                    <i class="far fa-trash-alt" id="deleteCmt"></i>
		                                </span>
		                          	<%} %>
	                            </div>
	                            <br />
	                            <div class="cmtBody" style="font-size: 14px;">
	                                <p id="cmtContent<%= c.getCno() %>" style="margin : 0px;"><%= c.getCcontent() %></p>
	                            </div>
	                            <div class="cmtFoot"><%= c.getCdate() %></div>
	                        </div>
                        <%} %>
                    </div>
                </div>
                
                <div id="btnArea">
                	<button id="goList" onclick="goList();">목록</button>
                </div>
            </div>
    	</div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
</body>

<%if(m != null) { %>
	<script>
	// 댓글 입력 함수
	
		function postCmt(){
			<%-- locatoin.href="<%= request.getContextPath() %>/cmtInsert.co"; --%>
			var jsonData = {
					bno : <%=b.getBno() %>,
					cwriterId : "<%= m.getUserId() %>", /* m.getUserId */
					cwriterNick : "<%= m.getNickname()%>", /* m.getnickname */
					ccontent : $('#ccontent').val()
				}
				
				//console.log(jsonData); // 전송할 데이터 확인
				if(!$('#ccontent').val()){
					alert("댓글을 입력해주세요.");
				} else {
					$.ajax({
						url : "<%= request.getContextPath() %>/cmtInsert.co",
						type : "post",
						data : jsonData,
						success : function(data){
							if(data == 1){ // 데이터 처리가 성공적으로 완료되면 페이지 새로고침
								document.location.reload();
							}
						}, error : function(error){
							alert("댓글 등록 실패");
						}
						
					});
				}
		}
	
		// 게시글 좋아요 기능 함수
		$('#likeBtn').click(function(){
			
			var bno = <%= b.getBno() %>;
			var id = '<%= m.getUserId() %>'; <%-- <%= m.getUserId() %> --%> 
			
			console.log(bno, id);
			
			if(!confirm("이 게시글을 추천 하시겠습니까?")){
				// 취소 버튼 클릭시
			} else {
				/// 확인 버튼 클릭시
				$.ajax({
					url : "<%= request.getContextPath() %>/likeUpdate.do",
					type : "post",
					data : { bno, id },
					success : function(data){
						if(data.result == 1){
							$('.likeCnt').html(data.like);
						} else {
							alert(data.text);
						}
					}, error : function(error){
						alert("게시글 추천 실패");
					}
				});
			}
			
			
		});

	</script>
<%} else {%>
	<script>
		function postCmt(){
			alert("로그인 후 댓글을 작성해 주세요.");
		}
		
		$('#likeBtn').click(function(){
			alert("로그인 후 추천이 가능합니다.");
		});
	</script>
<%} %>
<script>
	
	// 댓글 수정 함수
	
	// 수정 아이콘 클릭시 수정 댓글창으로 변경
	function updateCon(cno, nick, content){
		var htmls = "";
		
		htmls += '<div class="cmtUpdate">';
		htmls += '<div class="upHead">';
		htmls += '<div>';
		htmls += '<input type="hidden" id="upCno" value="' + cno + '"/> ';
		htmls += '<span style="font-size: 14px; font-weight: bold;">';
		htmls += nick;
		htmls += '</span>';
		htmls += '</div>';
		htmls += '<span style="font-size: 13px;">';
		htmls += '<button id="upBtn" onclick="sendCon();")>수정</button> &nbsp;';
		htmls += '<button id="delBtn" onclick="document.location.reload();">취소</button>';
		htmls += '</span>';
		htmls += '</div>';
		htmls += '<br>';
		htmls += '<div class="upBody" style="font-size: 14px;">';
		htmls += '<textarea name="upCon" id="upCon" cols="162" rows="3" style="resize: none;">';
		htmls += content;
		htmls += '</textarea>';
		htmls += '</div>';
		htmls += '<div class="upFoot">2021-10-08</div>';
		htmls += '</div>';
		
		$('.cmts'+cno).replaceWith(htmls);
		$('#upCon').focus();
	}
	
	// 댓글 수정
	function sendCon() {
		var jsonData = {
				cno : $('#upCno').val(),
				ccontent : $('#upCon').val()
			}
			
			//console.log(jsonData); // 전송할 데이터 확인
			if(!$('#upCon').val()){
				alert("댓글을 입력해주세요.");
			} else {
				$.ajax({
					url : "<%= request.getContextPath() %>/cmtUpdate.co",
					type : "post",
					data : jsonData,
					success : function(data){
						if(data == 1){ // 데이터 처리가 성공적으로 완료되면 페이지 새로고침
							document.location.reload();
						}
					}, error : function(error){
						alert("댓글 등록 실패");
					}
					
				});
			}
	}
			
	
	// 댓글 삭제 함수
	$('#deleteCmt').click(function(){
		if (!confirm("삭제시 복구 할 수 없습니다. 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	        var cno = $(this).closest('div').find('input[name=cno]').val();
	        
	    	$.ajax({
				url : "<%= request.getContextPath() %>/cmtDelete.co",
				type : "post",
				data : { cno },
				success : function(data){
					if(data == 1){ // 데이터 처리가 성공적으로 완료되면 페이지 새로고침
						document.location.reload();
					}
				}, error : function(error){
					alert("댓글 삭제 실패");
				}
				
			});        
	    }
	});
	
	// 목록, 수정, 삭제 함수
	function goList(){
		location.href='<%= request.getContextPath()%>/selectList.bo?cate=8'; /* cate check */
	}
	
	function update(){
		location.href='<%= request.getContextPath()%>/updateView.bo?cate=8&bno=<%=b.getBno() %>'; /* cate check */
	}
	
	function deleteOk(){
     	if (!confirm("삭제시 복구 할 수 없습니다. 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	location.href='<%= request.getContextPath()%>/delete.bo?cate=8&bno=<%=b.getBno() %>';   /* cate check */     
	    }
		
	}
	
</script>
</html>















