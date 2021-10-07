<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<nav class="sideMenu">
	    <div id="sideArea">
	        <ul>
	            <li class="listTitle"> 동물병원 / 약국
	                <ul>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=3">병원 / 약국 정보 공유</a></li>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=4">이용 후기</a></li>
	                </ul>
	            </li>
	            <li class="listTitle"> 동반입장 장소
	                <ul>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=5">장소 공유</a></li>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=6">이용 후기</a></li>
	                </ul>
	            </li>
	            <li class="listTitle"> 기타 장소
	                <ul>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=7">장소 공유</a></li>
	                    <li><a href="<%= request.getContextPath()%>/selectList.bo?cate=8">이용 후기</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	</nav>