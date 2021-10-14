package com.kh.petmu.freeBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class freeBoard implements Serializable {
	
	private static final long serialVersionUID = 1002L;
	
	// Board 변수명
	private int bno;
	private int cateNo;
	private String bwriterId;
	private String bwriterNick;
	private String btitle;
	private String bcontent;
	private int bcount;
	private String bfile;
	private int likeCount;
	private Date bdate;
	private String status;
	private int ccount;
	
	
	public freeBoard() { }
	

	public freeBoard(String bwriterId, String bwriterNick, String btitle, String bcontent, String bfile) {
		super();
		this.bwriterId = bwriterId;
		this.bwriterNick = bwriterNick;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
	}


	public freeBoard(int bno, int cateNo, String bwriterId, String bwriterNick, String btitle, String bcontent,
			int bcount, String bfile, int likeCount, Date bdate, String status, int ccount) {
		super();
		this.bno = bno;
		this.cateNo = cateNo;
		this.bwriterId = bwriterId;
		this.bwriterNick = bwriterNick;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bcount = bcount;
		this.bfile = bfile;
		this.likeCount = likeCount;
		this.bdate = bdate;
		this.status = status;
		this.ccount = ccount;
	}


	@Override
	public String toString() {
		return "freeBoard [bno=" + bno + ", cateNo=" + cateNo + ", bwriterId=" + bwriterId + ", bwriterNick="
				+ bwriterNick + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bcount=" + bcount + ", bfile="
				+ bfile + ", likeCount=" + likeCount + ", bdate=" + bdate + ", status=" + status + ", ccount=" + ccount
				+ "]";
	}
	


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getcateNo() {
		return cateNo;
	}


	public void setcateNo(int cateNo) {
		this.cateNo = cateNo;
	}


	public String getbwriterId() {
		return bwriterId;
	}


	public void setbwriterId(String bwriterId) {
		this.bwriterId = bwriterId;
	}


	public String getbwriterNick() {
		return bwriterNick;
	}


	public void setbwriterNick(String bwriterNick) {
		this.bwriterNick = bwriterNick;
	}


	public String getbtitle() {
		return btitle;
	}


	public void setbtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public int getBcount() {
		return bcount;
	}


	public void setBcount(int bcount) {
		this.bcount = bcount;
	}


	public String getBfile() {
		return bfile;
	}


	public void setBfile(String bfile) {
		this.bfile = bfile;
	}


	public int getlikeCount() {
		return likeCount;
	}


	public void setlikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getCcount() {
		return ccount;
	}


	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	
	
	
	
	
}
	