package com.khrd.domain;

import java.util.Date;

public class PhotoVO {
	private int pno;
	private String title;
	private Date adddate;
	private String writer; //member_name
	
	public PhotoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PhotoVO(int pno, String title, Date adddate, String writer) {
		super();
		this.pno = pno;
		this.title = title;
		this.adddate = adddate;
		this.writer = writer;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "MemberVO [pno=" + pno + ", title=" + title + ", adddate=" + adddate + ", writer=" + writer + "]";
	}
}
