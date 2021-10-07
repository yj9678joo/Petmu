<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMU : 게시글 작성</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/PetMu/resources/css/sideMenu.css" />

<script src="/PetMu/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>


<style>
   	header, footer{
   	background: rgb(143, 186, 214);
   	width : 1500px;
  	height: 100px;
  	margin: 0 auto;
  	font-size: 50pt;
   	text-align: center;
    }

    .main {
        width : 1500px;
        height : 1000px;
        margin: 0 auto;
        
        
    }
    
    .boardArea {
    display : inline-block;
    padding: 50px 0 0 30px;
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
    height: 787px;
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
<header>header</header>
    <div class="main">

        <%@include file="/views/common/sideMenu.jsp" %>

        <div class="boardArea">
            <div id="boardTitle">
                <h2>게시글 작성</h2>
                <p>[병원 / 약국 정보 공유]</p>
            </div>
            <div id="content">

                <form action="<%= request.getContextPath() %>/insert.bo?cate=3" method="post" id="frm">
                	<input type="hidden" name="bwriterId" value="test01" /> <%--m.getid --%>
                	<input type="hidden" name="bwriterNick" value="아이언맨" /> <%--m.getid --%>
                    <div id="top">
	                    <input type="text" name="btitle" id="btitle" placeholder=" 제목을 입력해 주세요." required>
	                    <button type="button" name="submitBtn" id="submitBtn">등록</button>                    
                    </div>
                    <textarea name="bcontent" id="bcontent" cols="100" rows="10" style="height:650px;"></textarea>

                    

                </form>

            </div>
    	</div>
    </div>
    <footer>footer</footer>
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









