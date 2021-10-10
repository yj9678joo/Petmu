package com.kh.petmu.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.petmu.board.model.service.BoardService;
import com.kh.petmu.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/update.bo")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cateNo = Integer.parseInt(request.getParameter("cate"));
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		// 게시글 저장 vo
		Board b = new Board();
		
		BoardService service = new BoardService();
		
		b = service.updateView(bno);
		
		b.setBtitle(btitle);
		b.setBcontent(bcontent);
		
		int result = service.updateBoard(b);
		
		String page = "";
		
		if(result > 0) {
			
				switch(cateNo) {
				case 3 : page = "selectList.bo?cate=3";
						 break;
				case 4 : page = "selectList.bo?cate=4";
						 break;
				case 5 : page = "selectList.bo?cate=5";
				 		 break;
				case 6 : page = "selectList.bo?cate=6";
						 break;
				case 7 : page = "selectList.bo?cate=7";
				 		 break;
				case 8 : page = "selectList.bo?cate=8";
						 break;		 
						 
				}
			
			response.sendRedirect(page);
		} else {
			request.setAttribute("error-msg", "게시글 수정에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}