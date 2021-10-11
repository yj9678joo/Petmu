<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.petmu.board.model.vo.*, java.util.*"%>
    
<%
	Board b = (Board)request.getAttribute("board");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 게시글 수정</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/sideMenu.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>

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
    
    #boardTitle h2, p {
    	margin : 7px 0;
    }
    
    #content {
    border : 1px solid lightgray;
    padding: 20px 20px;
    border-radius: 5px;
    height: 775px;
	}

	#btitle {
    width : 1050px;
    height : 40px;
    font-size: 15px;
    border : 1px solid lightgray;
    border-radius: 2px;
	}
	
	#btitle:focus {
	outline : 1px solid cornflowerblue;
	}

	#submitBtn {
    width : 93px;
    height : 44px;
    background: orange;
    border : none;
    border-radius: 3px;
    color : white;
    font-size: 17px;
    font-weight: bold;
    margin-left : 7px;
	}
	
	#submitBtn:hover {
		cursor : pointer;
	}

	
	#bfile {
		padding : 15px 0;
	}
	
	.ck-editor__editable {
	    min-height: 650px;
	}
	
	#top {
		display:flex;
		align-items: center;
		padding-bottom : 10px;
	}

</style>

</head>
<body>
<%@ include file="/views/common/header.jsp" %>
    <div class="main">

        <%@include file="/views/common/sideMenu.jsp" %>

        <div class="boardArea">
            <div id="boardTitle" style="font-family: 'Jua', sans-serif; font-size : 30px;">
                <label>게시글 수정</label>
                <p style="font-size : 20px;">[동반입장 장소 공유]</p>
            </div>
            <div id="content">

                 <form action="<%= request.getContextPath() %>/update.bo?cate=5" method="post" id="frm"> <%--cate check --%>
                	<input type="hidden" name="bno" value="<%= b.getBno() %>" />
                    <div id="top">
	                    <input type="text" name="btitle" id="btitle" placeholder=" 제목을 입력해 주세요." value="<%= b.getBtitle() %>">
	                    <%--b.gettitle --%>
	                    <button type="button" name="submitBtn" id="submitBtn">수정</button>                    
                    </div>
                    <textarea name="bcontent" id="bcontent" cols="100" rows="10" style="height:650px;"><%= b.getBcontent() %></textarea>
                    
                </form>

            </div>
    	</div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
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
	    	document.querySelector( '#frm' ).submit();
	    }
	    
	    
	} );
	
</script>


</html>









