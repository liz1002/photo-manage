<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	header{
		width: 1200px;
		margin: 0 auto;
	}
	header div#menu{
		width: 100%;
		background: #F7C1C1;
		padding: 10px 0px;
	}
	#menu ul{
		width: 60%;
		margin: 0 auto;
		list-style: none; 
		overflow: hidden;
	}
	#menu ul li{
		width: 25%;
		height: 100%;		
		float: left;
		text-align: center;
		padding: 5px 0px;
	}
	#menu ul li:hover{
		background: lightgray;
	}
	#menu ul li a{
		display: inline-block;
		color: #fff;
		text-decoration: none;
		font-size: 18px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<header>
		<div id="menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/photo/upload">사진 업로드</a></li>
				<li><a href="${pageContext.request.contextPath}/photo/view">사진 보기</a></li>
				<li>
					<c:if test="${Auth == null}">
						<a href="${pageContext.request.contextPath}/auth/login">로그인</a>
					</c:if>
					<c:if test="${Auth != null}">
						<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
					</c:if>
				</li>
				<li>
					<c:if test="${Auth == null}">
						<a href="${pageContext.request.contextPath}/member/regist">회원가입</a>
					</c:if>
					<c:if test="${Auth != null}">
						<a href="#">${Auth}님 환영합니다.</a>
					</c:if>
				</li>
			</ul>
		</div>
	</header>
	