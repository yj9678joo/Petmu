<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>PETMU : 마이페이지</title>
    <link rel="petmu icon" href="<%= request.getContextPath()%>/resources/images/petmu.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c10cbac54f.js" crossorigin="anonymous"></script>

    <style>

#td{
font-size: 20px;
padding-right: 300px;

}

#tr{

    height: 50px;

}

#btn{


    color: coral;
    font-size: 20px;
    font-weight: 600;


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

    </style>

</head>
<body style="margin-left: 150px; margin-right: 150px; background-color:#f5f6f7;">
    

  <br><br><br><br><br><br>
    <h1> <label class="fas fa-user-alt" style="color: coral;"  ></label> 마이페이지</h1>
  <hr style= "border-width: 1px; ">

 
<br>
            
<div style="display:inline-block;">
            <table align="left">
<br><br>
                <tr>

                    <td><h1 style= "color: coral;">아이번달인</h1></td>

                    <td><a href="nicknameUpdate_page.jsp"><label class="far fa-edit" style="color: coral; font-size: 30px;" ></label></a></td>
                </tr>

       

                <tr id="tr">

                    <td id="td" style="font-weight: 600;" >아이디&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td id="td" style="color: gray;" >example</td>

                </tr>


                <tr id="tr">

                    <td id="td" style="font-weight: 600;">이름</td>
                    <td id="td"  style="color: gray;" >홍길동</td>
                    

                </tr>

                <tr id="tr">

                    <td id="td" style="font-weight: 600;">생년월일</td>
                    <td id="td" style="color: gray;" > YYYY_MM_DD</td>

                </tr>

                <tr id="tr">

                    <td id="td" style="font-weight: 600;">E-Mail</td>
                    <td id="td" style="color: gray;" >example@test.net</td>

                </tr>

       

                <tr id="tr">

                    <td id="td" style="font-weight: 600;">주소</td>
                    <td id="td" style="color: gray;" >서울특별시 강남구 무슨로<br> 무슨아파트 몇동 몇호 </td>

                </tr>
                
                <tr id="tr">

                    <td id="td" style="font-weight: 600;">반려동물 정보</td>
                    <td id="td" style="color: gray;" >(강아지/고양이/기타) 유자 </td>

                </tr>
            </table>
        </div>

<div>
<table align="right" style="margin-top: 50px;">    
    <tr>
    <td id="btn"><a href="userUpdate_page.jsp" style="color: coral; text-decoration-line: none;" >개인정보수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td id="btn"><a href="withdraw_page.jsp" style="color: coral; text-decoration-line: none;" >회원탈퇴</a>
</tr>
</table>
</div>

      

            <div id="boardTitle" style="margin-top: 100px;">
                <hr>
                <h2 >내가 작성한 게시글</h2>
            </div>
    
            <div class="tableArea">
                <table id="listArea">
                    <thead>
                        <tr>
                            <th width="100px">No.</th>
                            <th width="1200px">제목</th>
                            <th width="300px">글쓴이</th>
                            <th width="300px">작성일</th>
                            <th width="200px">조회수</th>
                            <th width="200px">추천수</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <tr>
                        	<input type="hidden" value="??" /> 
                            <td>1</td>
                            <td>테스트 제목</td> 
                            <td>테스트</td> 
                            <td>2021-10-04</td> 
                            <td>199</td> 
                            <td><i class="fas fa-thumbs-up"></i> + 55</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <br><br><br>
</body>

<script>



</script>
</html>>