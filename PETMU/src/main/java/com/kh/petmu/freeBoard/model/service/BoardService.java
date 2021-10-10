package com.kh.petmu.freeBoard.model.service;

import static com.kh.petmu.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.petmu.comment.model.vo.Comment;
import com.kh.petmu.freeBoard.model.dao.BoardDAO;
import com.kh.petmu.freeBoard.model.vo.freeBoard;

public class BoardService {
	
	private Connection con;
	private BoardDAO dao = new BoardDAO();

	public int getListCount() {
		con = getConnection();
		
		int result = dao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<freeBoard> selectList(int currentPage, int limit) {
		con = getConnection();
		ArrayList<freeBoard> list = dao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public freeBoard selectOne(int bno) {
		con = getConnection();
		
		freeBoard fb = dao.selectOne(con, bno);
		// System.out.println("[서비스] : " + fb);
		if( fb!= null) {
			// 조회수 1 증가
			fb.setBcount( fb.getBcount() + 1);
			
			int result = dao.updateReadCount(con, bno);
					
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		close(con);
		
		return fb;
	}

	public int insertBoard(freeBoard fb) {
		con = getConnection();
		int result = dao.insertBoard(con, fb);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		// System.out.println("[서비스] : " + result);
		
		return result;
	}

	public freeBoard updateView(int bno) {
		con = getConnection();
		
		freeBoard fb = dao.selectOne(con, bno);
		
		close(con);
		
		return fb;
	}

	public int updateBoard(freeBoard fb) {
		con = getConnection();
		
		int result = dao.updateBoard(con, fb);
//		System.out.println("[서비스] : " + fb);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteBoard(int bno) {
		con = getConnection();
		
		int result = dao.deleteBoard(con, bno);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Comment> selectCoList(int bno) {
		con = getConnection();
		
		ArrayList<Comment> cl = dao.selectCoList(con, bno);
		
		close(con);
		
		return cl;
	}

	public int getCmtCount(int bno) {
		con = getConnection();
		
		int result = dao.getCmtCount(con, bno);
		
		close(con);
		
		return result;
	}

}







