<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.petmu.board.model.vo.*, java.util.*"%>
<%--vo임포트하고 Board list, PageInfo 받아오기 --%>
 
 <%
 	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
 	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
 	
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 	int currentPage = pi.getCurrentPage();
 	int listCount = pi.getListCount();
 %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PETMU : 병원 / 약국 정보</title>
    <link rel="stylesheet" href="/PetMu/resources/css/sideMenu.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    
    <script src="/PetMu/resources/js/jquery-3.6.0.min.js"></script>
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


    #listArea tbody td:nth-child(3) {
        text-align: left;
    }
	
	#listArea {
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
    
    #btnArea {
    	padding-right: 30px;
    }

    #postBtn {
    	width : 80px;
    	height : 35px;
    	color : orange;
        font-size: 12pt;
        font-weight: bold;
        background : rgb(231, 231, 231);
        border: none;;
        border-radius: 3px;
    }

    #postBtn:hover {
        cursor: pointer;
    }
    
    #listArea i {
    	color : orange;
    }
    
    .pagingArea button {
    	color : gray;
    	background : none;
    	border : none;
    	font-weight : bold;
    	font-size : 13pt;
    }
    
    .pagingArea button:hover {
    	color : orange;
    	cursor: pointer;
    }
    
    
</style>
</head>

<body>
    <header>header</header>
    <div class="main">

	<%@ include file="/views/common/sideMenu.jsp" %>	

        <div class="boardArea">
            <div id="boardTitle">
                <h2><i class="far fa-edit"></i> 병원 / 약국 정보 공유</h2>
            </div>
    
            <div class="tableArea">
                <table id="listArea">
                    <thead>
                        <tr>
                            <th width="50px">No.</th>
                            <th width="600px">제목</th>
                            <th width="150px">글쓴이</th>
                            <th width="150px">작성일</th>
                            <th width="100px">조회수</th>
                            <th width="100px">추천수</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <%-- for each문을 통해 board list 담아주기 --%>

                        <%for(Board b : list) {%>
                        <tr>
							<input type="hidden" value="<%=b.getBno() %>" /> <%--bno 받아오기 --%>
                            <td><%=b.getBno() %></td> <%-- bno 받아오기 --%>
                            <td><%=b.getBtitle() %></td> <%--btitle 받아오기 --%>
                            <td><%=b.getBwriterNick() %></td> <%--userNickname 받아오기 --%>
                            <td><%=b.getBdate() %></td> <%--uploadDate 받아오기 --%>
                            <td><%=b.getBcount()%></td> <%-- likeCount 받아오기 --%>
                            <td><i class="fas fa-thumbs-up"></i> + <%=b.getLikeCount() %></td>                        
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
    		<br />
            <div class="pagingArea" align="center">
    			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1&cate=3'"><<</button>
    			<%-- currentPage, stardPage, endPage, listCount받아와서 페이징 --%>
    			<%if(currentPage <= 1) {%>
    			<button disabled><</button>
    			<%} else { %>
    			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1%>&cate=3'"><</button>
    			<%} %>
    			<%for(int p = startPage; p <= endPage; p++){ 
    				if(p ==currentPage){
    			%>
    				<button disabled style="color:orange;"><%=p %></button>
    				<%} else { %>
    				<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=p%>&cate=3'"><%=p%></button>
    				<%} %>
    			<%} %>
    			<%if(currentPage >= maxPage) {%>
    			<button disabled>></button>
    			<%} else { %>
    			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1%>&cate=3'">></button>
    			<%} %>
    			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=maxPage %>&cate=3'">>></button>
            </div>
            
            <div id="btnArea" align="right">
            	<%--insert.bo로 이동 --%>
            	<button onclick="post();" id="postBtn">글쓰기</button>
            </div>
        </div>
    </div>
    <footer>footer</footer>
    
    
    <script>
 
    	function post(){
    		<%--만약 로그인 돼있으면 hospital/infoInsert.jsp로 이동 아니면 alert창 띄우기 --%>
    		location.href = "views/board/info_review/hospital/infoInsert.jsp";
    	}
    	
    	<%-- 게시글 td누르면 bno값들고 selectOne.bo로 이동--%>
    	$('#listArea td').on('click', function(){
    		var bno = $(this).parent().find('input').val();
    		location.href = "<%= request.getContextPath() %>/selectOne.bo?cate=3&bno=" + bno;
    	});
    </script>
</body>
</html>










