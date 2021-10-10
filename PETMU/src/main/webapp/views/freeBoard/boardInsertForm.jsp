<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 게시글 작성</title>
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
<!-- CK클래식 에디터 -->
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
<style>
	body {
		background-color : #E9E9E9;
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
	margin-left: 40px;
}

i { /* 카테고리 아이콘 */
	font-size: 24px;
	color: grey;
}

#cate { /* 상단 머리글 */
	font-size: 25px;
	text-decoration: none;
}

#btitle {
	font-size: 20px;
	width: 1280px;
	border: 0;
	border-bottom: 1px solid grey;
	padding: 10px;
}

.tableArea {
	width: 1300px;
	margin-left: 40px;
	border: 1px solid lightgrey;
	padding: 25px 25px 25px 25px;
}


table {
	padding: 10px;
}

.ck.ck-editor {
	max-width : 1300px;
}

.ck-editor__editable {
	min-height : 500px;
}

.btnArea button {
	width: 100px;
	padding: 10px;
	border: 0;
	outline: none;
	color: orange;
	font-weight: bold;
	font-size: 15px;
}

.btnArea button:hover {
	opacity: 0.5;
	cursor: pointer;
}


</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<%-- <% if ( m != null ) { %> --%>
	
		<div class="outer">
		
		<div class="category">
			<i class="far fa-edit"></i> <label id="cate">게시글 작성</label>
			<br><br>
		</div>
		
			<div class="tableArea">
			
				<form id="insertForm" name="insertForm"
					  action="<%= request.getContextPath() %>/insert.fb"
				      method="post" enctype="multipart/form-data">
                	  <input type="hidden" name="bwriterId" value="test0" /> <%--m.getid --%>
                	  <input type="hidden" name="bwriterNick" value="열매" /> <%--m.getid --%>
				      <input type="text" id="btitle" name="btitle" placeholder="제목을 입력해주세요" 
				      			required maxlength="30"><br>

				      <br>

				<textarea name="bcontent" id="bcontent"></textarea>		
				<br />
				<input type="file" name="bfile" id="bfile" />
				
                <br />
				<div class="btnArea" align="center">
				      	  <button type="submit" name="submitBtn" id="submitBtn">게시글 등록</button>
				      	  <button type="reset" name="cancelBtn" id="cancelBtn" 
				      	  	onclick="location.href='<%=request.getContextPath()%>/selectList.fb'">작성 취소</button>
				      </div>
				</form>
			
			</div>
		</div>
	
	<%-- <% } else { 
		request.setAttribute("error-msg", "회원만 접근 가능합니다!");
		
		request.getRequestDispatcher("../common/errorPage.jsp")
		       .forward(request, response);
	 } --%>
	<br />
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	var eidtor
	ClassicEditor
	   .create( document.querySelector( '#bcontent' ) )
	   .then( newEditor => {
	       editor = newEditor;
	   } )
	   .catch( error => {
	       console.error( error );
	   } );
	
	
	document.querySelector( '#submitBtn' ).addEventListener( 'click', () => {
	    var editorData = editor.getData();
	    var btitle = document.querySelector( '#btitle' ).value;
	    
	    console.log(btitle);
	    console.log(editorData);
	    
	    if(!btitle) {
	    	alert("제목을 입력해 주세요.");
	    } else if(!editorData) {
	    	alert("내용을 입력해 주세요.");
	    } else {
	    	document.querySelector( '#insertForm' ).submit();
	    }
	    
	    
	} );
	
</script>
</html>