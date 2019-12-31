package com.khrd.domain;

public class MemberVO {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String name, String pwd, String email, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", tel="
				+ tel + "]";
	}
}
