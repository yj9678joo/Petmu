package com.kh.petmu.comment.model.service;

import static com.kh.petmu.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.petmu.comment.model.dao.CommentDAO;
import com.kh.petmu.comment.model.vo.Comment;

public class CommentService {
	Connection con;
	CommentDAO dao = new CommentDAO();
	
	public int insertComment(Comment co) {
		con = getConnection();
		
		int result = dao.insertComment(con, co);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteComment(int cno) {
		con = getConnection();
		
		int result = dao.deleteComment(con, cno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
