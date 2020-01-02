<%@page import="com.khrd.domain.PhotoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	section{
		width: 1200px;
		margin: 0 auto;
	}
	div#imgWrap{
		width: 1200px;
		min-height: 200px;
		position: relative;
		overflow: hidden;
	}
	div.imgbox{
		width: 300px;
		min-height: 220px;
		float: left;
		margin: 15px 50px;
		padding: 5px 0px; 
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		cursor: pointer;
		z-index: 0;
	}
	.imgbox img{
		margin: 5px;
	}
	.imgbox p{
		display: block;
		width: 200px;
		word-wrap: break-word;
		text-align: center;
	}
	p.filename{
		font-size: 13px;
	}
	button.del{
		position: absolute;
		top: 10px;
		right: 10px;
		background: rgba(188, 143, 143, 0.7);
		border: #BC8F8F;
		color: #fff;
		padding: 1px 4px;
		z-index: 100;
	}
	div#bigImg{
		width: 100%;
		height: 100%;
		background : rgba(255, 255, 255, 0.7);
		display: none;
		position: absolute;
		left: 0px;
		top: 0px;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		cursor: pointer;
	}
	#bigImg img{
		display: none;
		max-height: 70%;
	}
	div#pageWrap{
		width: 100%;
		margin: 20px 0px;
	}
	#pageWrap ul#pagination{
		width: 360px;
		list-style: none;
		overflow: hidden;
		margin: 0 auto;
		text-align: center;
	}	
	#pagination li{
		display: inline;
		float: left;
		width: 30px;
		height: 30px;
		line-height: 30px;
		margin: 5px;
		background: #F5ECEF;
		box-shadow: gray 1px 1px 2px;
	}
	#pagination li.active{
		background: rgba(247, 193, 193, 0.7);
	}
	#pagination li a{
		text-decoration: none;
		display: inline-block;
		width: 100%;
		height: 100%;
		color: gray;
		font-size: 14px;
	}
</style>

<section>
	<div id="imgWrap">
		<c:forEach var="photo" items="${list}">
			<div class="imgbox" data-src="${photo.title}">
				<img src="${pageContext.request.contextPath}/upload/displayThumbFile?filename=${photo.title}">
				<p>
					<fmt:formatDate value="${photo.adddate}" pattern="yyyy-MM-d"/>
				</p>
				<p class="filename">
					${fn:substring(photo.title, 49, -1)}				
				</p>
				<button class="del" data-src="${photo.title}">X</button>
			</div>
		</c:forEach>
		<div id="bigImg">
			<img>
		</div>
	</div>
	
	<div id="pageWrap">
		<ul id="pagination">
			<c:if test="${pageMaker.prev == true}">
				<li><a href="view?page=1">&laquo;</a></li>
				<li><a href="view?page=${pageMaker.startPage-1}">&lsaquo;</a></li>
			</c:if> 
			<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li ${idx == pageMaker.cri.page ? 'class=active' : ''}> <!-- pageMaker.cri.page : 현재 페이지 번호 -->
					<a href="view?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<li><a href="view?page=${pageMaker.endPage+1}">&rsaquo;</a></li>
				<li><a href="view?page=${pageMaker.lastPage}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</section>

<script>
	$(".imgbox").hover(function() {
		//$(this).children().css("font-weight", "300");	
		$(this).css("background", "rgba(246, 192, 192, 0.7)");
	}, function() {
		//$(this).children().css("font-weight", "normal");
		$(this).css("background", "none");
	})
	
	$(".imgbox").click(function() {
		var src = $(this).attr("data-src");
		
		$.ajax({
			url: "${pageContext.request.contextPath}/upload/displayOriginFile",
			type: "get",
			data: {"filename" : src},
			headers: {"Content-Type" : "application/json"},
			dataType: "text",
			success: function(res) {
				console.log(res);
				$("#bigImg img").attr("src", "${pageContext.request.contextPath}/upload/displayThumbFile?filename=" + res).css("display", "inline-block");
				$("#bigImg").css("display", "flex");
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	$("#bigImg, #bigImg img").click(function() {
		$("#bigImg").css("display", "none");
		$("#bigImg img").css("display", "none");
	})
	
	$(".del").click(function() {
		var res = confirm("정말 삭제하시겠습니까?");
		
		if(res == false){
			return false;
		}
		
		var src = $(this).attr("data-src");
		var target = $(this);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/upload/deleteFile",
			type: "get",
			data: {"filename" : src},
			headers: {"Content-Type" : "application/json"},
			dataType: "text",
			success: function(res) {
				console.log(res);
				target.parent().remove();
			},
			error: function(err) {
				console.log(err);
			}
		})
		
		return false;
	})
</script>

<%@include file="../include/footer.jsp" %>