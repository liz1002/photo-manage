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

<section>
	<form action="regist" method="post">	
		<p>
			<label>아이디</label>
			<input type="text" name="id" data-msg="아이디를 입력하세요.">
			<button type="button" id="over">중복확인</button>
		</p>
		<p>
			<label>이름</label>
			<input type="text" name="name" data-msg="이름을 입력하세요.">
		</p>
		<p>
			<label>이메일</label>
			<input type="email" name="email" data-msg="이메일을 입력하세요.">
		</p>
		<p>
			<label>전화번호</label>
			<input type="text" name="tel" data-msg="전화번호를 입력하세요.">
		</p>
		<p>
			<label>비밀번호</label>
			<input type="password" name="pwd" data-msg="비밀번호를 입력하세요.">
		</p>
		<p>
			<label>비밀번호 확인</label>
			<input type="password" name="pwdCheck" data-msg="비밀번호 확인을 입력하세요.">
		</p>
		<p>
			<input type="submit" value="가입">
			<input type="reset" value="취소">
		</p>
	</form>
</section>

<script>
	var overlap = 0;

	$("form").submit(function() {
		var res = check($("input[name]"));
		
		if($("input[name='pwd']").val() != $("input[name='pwdCheck']").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;			
		}
		
		if(res == false){
			return false;
		}else if(overlap == 0){
			alert("아이디 중복 확인을 하지 않았습니다.");
			return false;
		}
	})	
	
	$("#over").click(function() {
		var id = $("input[name='id']").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/member/overlap",
			type: "get",
			data: {"id" : id},
			headers: {"Content-Type" : "application/json"},
			dataType: "text",
			success: function(res) {
				console.log(res);
				if(res == "no"){
					overlap = 0;
					alert("사용할 수 없는 아이디입니다.");
				}else{
					overlap = 1;
					alert("사용 가능한 아이디입니다.");
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
		
	})
	
	$("input[name='id']").change(function() {
		overlap = 0;
	})
	
</script>
<%@include file="../include/footer.jsp" %>