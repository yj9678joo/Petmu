package com.kh.petmu.freeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.petmu.freeBoard.model.service.BoardService;
import com.kh.petmu.freeBoard.model.vo.PageInfo;
import com.kh.petmu.freeBoard.model.vo.freeBoard;


/**
 * Servlet implementation class BoardSelectList
 */
@WebServlet("/selectList.fb")
public class BoardSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시글 목록을 담을 변수 선언
		ArrayList<freeBoard> list = new ArrayList<>();
		BoardService service = new BoardService();
		
		// 1, 2, 3, 4, 5
		int startPage, endPage;
		
		// 55개 게시글 -> 10개 - 페이지 1 --> 6개 페이지
		int maxPage;
		
		// 현재 사용자가 보는 페이지
		int currentPage = 1;
		
		// 페이지당 게시글 수
		int limit = 20;
		
		// 만약 사용자가 특정 페이지 정보를 가져왔다면
		if( request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 총 게시글 수 조회
		int listCount = service.getListCount();
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (int)(((double)currentPage/10 + 0.9) - 1) * 10 + 1;
		
		endPage = startPage + limit - 1; 
		
		// 만약 마지막 페이지가 endPage보다 작다면
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// ------------- 페이지 처리 끝! ----------- //
		list = service.selectList(currentPage, limit);
		
		
		String page = "";
		
		if ( list != null) {
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

			request.setAttribute("list", list);
			request.setAttribute("pi", pi);

			page = "views/freeBoard/boardList.jsp";
		} else {
			request.setAttribute("error-msg", "게시글 조회 실패!");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
