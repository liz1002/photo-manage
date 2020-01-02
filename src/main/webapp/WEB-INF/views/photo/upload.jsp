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
	div#preImgBox{
		width: 100%;
		min-height: 200px; 
		border: 1px solid #dcd;
		margin: 20px 0;
		overflow: hidden;
	}
	div.imgbox{
		float: left;
		margin: 5px;
	}
	.imgbox img{
		width: 100px;
	}
</style>

<section>
	<form action="upload" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="auth" value="${Auth}" data-msg="로그인 후 이용해주세요.">
		<p>
			<label>업로드할 파일</label>
			<input type="file" name="files" multiple="multiple" data-msg="파일을 선택하세요.">
		</p>
		<div id="preImgBox"></div>
		<p>
			<input type="submit" value="추가">
			<input type="reset" value="취소">
		</p>
	</form>
</section>

<script>
	$("input[name='files']").change(function() {
		$("#preImgBox").empty();
		
		//$(this) : jquery obj
		//$(this)[0] : javascript obj
		//File Read는 javascript만 가능
		for(var i=0; i<$(this)[0].files.length; i++){
			var file = $(this)[0].files[i];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				var $div = $("<div>").addClass("imgbox");
				var $img = $("<img>").attr("src", e.target.result);
				$div.append($img);
				$("#preImgBox").append($div);
			}
		}
	})
	
	$("form").submit(function() {
		var res = check($("input[name]"));
		if(res == false){
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>