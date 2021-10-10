<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>PETMU : 개인정보수정</title>
   <link rel="petmu icon" href="<%= request.getContextPath()%>/resources/petmu.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://kit.fontawesome.com/c10cbac54f.js" crossorigin="anonymous"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <style>

      td{

         text-align: left;
         height: 40px;

      }

      #val{

         font-size: 20px;
         


      }
      .input{


         width: 400px;
         height: 35px;

      }
      .value{

         font-size: 20px;
         color: gray;

      }
  </style>
</head>

<body style="background-color:#f5f6f7">
   <h2 align="center" style="margin-top: 80px;"><a href="../../index.jsp"> <img width="250" height="100" src="<%= request.getContextPath()%>/resources/petmu.png"alt="펫뮤" > </a><br><br>개인정보수정</h2>


   <hr>
   <br><br>


   <form action="<%= request.getContextPath()%>/update.do" method="post" id="updateForm" style="text-align: center;">

   <div style="display: table;  margin: auto;">
   <table align="center" style="width: 300px; padding-left: 42px;">
   <tr>
<td colspan="2" id="val">아이디</td>
<td colspan="2" class="value">jminsu22</td>


   </tr>
   <td id="val"><br>비밀번호</td>
</tr>


   <tr>

      <td colspan="3" class="value"> <input type="password" id="userPwd" class="input" placeholder=" * 숫자, 영문자, 특수문자 포함 8~16자리 이내"></td>


   </tr>


   <tr>
     <td id="val"><br>비밀번호 확인</td>
   </tr>

   <tr>
      <td colspan="3"> <input type="password" id="userPwd2" class="input"></td>
   </tr>

   <tr>
      <td id="val"><br>닉네임</td>
   
      <td colspan="2" class="value"><br>닉네임</td>  </tr>

   <tr>
      <td colspan="2" id="val"><br>이름</td> 
   
      <td class="value"><br>홍기르동</td>
   </tr>

   <tr>
      <td colspan="2" id="val"><br>성별</td>
      <td class="value"><br>남자</td>
      </tr>

      <tr>
         <td colspan="2" id="val"><br>생년월일</td>
         <td class="value"><br>YYYY-MM-DD</td>
      </tr>

      <tr>

         <td id="val"><br>이메일</td>
        </tr> 
        
        <tr>
         <td colspan="3"><input type="text" id="userId" class="input"></td>

      </tr>

      <tr>
         <td colspan="4" id="val"><br>주소</td>   
  
      </tr>
      <tr><td colspan="4"><input type="text" id="zipCode" class="input"></td>
      
         <td><div class="fas fa-search-location" style="font-size: 30px; color: coral; position: relative; left: 22px; bottom:0px;" id="ckZip" onclick="addrSearch();"></div></td>
      </tr>

      <tr><td colspan="4"><br><input  class="input" type="text" id="address1" name="address1"></td></tr>
      <tr><td colspan="4"><br><input  class="input" type="text" id="address2" name="address2"></td></tr>
   
   </table>
   
</div>

<br>

<h3 style="font-weight: 500;" >애완동물을 기르고 계신가요?</h3>
<input type="checkbox" name="petType" value="강아지"> 강아지 &nbsp;
<input type="checkbox" name="petType" value="고양이"> 고양이 &nbsp;
<input type="checkbox" name="petType" value="기타"> 기타 &nbsp;
 <br><br>
<label style="font-size: 18px;">반려동물명 : </label> <input type="text" name="petType" value="" placeholder=" 직접 입력해주세요!" style="width: 200px; height: 35px; font-size: 18px;"> 



 
  <div class="btns" align="center">
   <br><br><br>
   <label class="fas fa-sign-in-alt" id="updateBtn" onclick="updateMember();" style="width: 160px; color: coral; font-size: 30px;">수정완료</label>
</div>

</form>
</body>

<script>
 
 function addrSearch() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수
  
                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      fullAddr = data.roadAddress;
  
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      fullAddr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if(data.userSelectedType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                  
                  $('#address1').val(fullAddr);
  
                  // 커서를 상세주소 필드로 이동한다.
                  $('#address2').focus();
              }

          }).open();
      };


      function updateMember() {
		$("#updateForm").submit();
	}

   $("#updateForm").submit(function(event){
		if($("#userPwd").val() == "" ) alert("비밀번호는 필수 값입니다.");
		else if($('#userPwd').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
		else return;
		event.preventDefault();
	});

</script>
</html>