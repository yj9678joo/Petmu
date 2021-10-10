package com.kh.petmu.member.model.service;

import static com.kh.petmu.common.JDBCTemplate.close;
import static com.kh.petmu.common.JDBCTemplate.commit;
import static com.kh.petmu.common.JDBCTemplate.getConnection;
import static com.kh.petmu.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.petmu.member.model.dao.MemberDAO;
import com.kh.petmu.member.model.vo.Member;

public class MemberService {

	private Connection con;
	private MemberDAO dao = new MemberDAO();
	
	public int insertMember(Member m) {
		con = getConnection();
		
		int result = dao.insertMember(con, m);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Member selectMember(Member loginMember) {
		con = getConnection();
		
		Member result = dao.selectMember(con, loginMember);
		
		close(con);
		
		return result;
	}

	public int idcheck(String userId) {
		con = getConnection();
		
		int result = dao.idcheck(con, userId);
		
		close(con);
		
		return result;
	}
	
	public int nicknamecheck(String nickname) {
		con = getConnection();
		
		int result = dao.nicknamecheck(con, nickname);
		
		close(con);
		
		return result;
	}

	
	public int emailcheck(String email) {
con = getConnection();
		
		int result = dao.emailcheck(con, email);
		
		close(con);
		
		return result;
	}
}

