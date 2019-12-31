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
	span.guid{
		font-size: 12px;
		display: none;
	}
</style>

<script>
	$(function() {
		$("input[name]").each(function(i, obj) {
			if($(obj).val() == ""){
				return false;
			}
		})
	})
</script>

<section>
	<form action="regist" method="post">	
		<p>
			<label>아이디</label>
			<input type="text" name="id">
			<button type="button">중복확인</button>
			<span class="guid ok">사용 가능한 아이디입니다.</span>
			<span class="guid error">사용 불가능한 아이디입니다.</span>
		</p>
		<p>
			<label>이름</label>
			<input type="text" name="name">
		</p>
		<p>
			<label>이메일</label>
			<input type="email" name="email">
		</p>
		<p>
			<label>전화번호</label>
			<input type="text" name="tel">
		</p>
		<p>
			<label>비밀번호</label>
			<input type="password" name="pwd">
		</p>
		<p>
			<label>비밀번호 확인</label>
			<input type="password" name="pwdCheck">
		</p>
		<p>
			<input type="submit" value="가입">
			<input type="reset" value="취소">
		</p>
	</form>
</section>

<%@include file="../include/footer.jsp" %>