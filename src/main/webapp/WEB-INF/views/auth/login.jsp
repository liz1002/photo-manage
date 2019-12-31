<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	section{
		width: 1200px;
		margin: 0 auto;
	}
	form{
		width: 400px;
		margin: 30px auto;
		text-align: center;
	}
	form p{
		padding: 5px 0px;
	}
	label{
		width: 110px;
		float: left;
		text-align: right;
		margin-right: 20px;
	}
</style>

<section>
	<form action="loginPost" method="post">	
		<p>
			<label>아이디</label>
			<input type="text" name="id">
		</p>
		<p>
			<label>비밀번호</label>
			<input type="password" name="pwd">
		</p>
		<p>
			<input type="submit" value="로그인">
		</p>
	</form>
</section>

<%@include file="../include/footer.jsp" %>