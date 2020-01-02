<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	section{
		width: 1200px;
		margin: 0 auto;
	}
	section div#wrap{
		width: 500px;
		margin: 30px auto;
	}
	#wrap p{
		text-align: center;
		line-height: 50px;
	}
	#wrap a{
		text-decoration: none;
		color: gray;
	}
	#wrap a:hover {
		text-decoration: underline;
	}
</style>

<section>
	<div id="wrap">
		<p>${msg}</p>
		<p><a href="login">로그인 재시도</a>
	</div>
</section>
<%@include file="../include/footer.jsp" %>