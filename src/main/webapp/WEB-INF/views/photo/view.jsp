<%@page import="com.khrd.domain.PhotoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	section{
		width: 1200px;
		min-height: 200px;
		margin: 0 auto;
		position: relative;
		overflow: hidden;
	}
	div.imgbox{
		width: 300px;
		min-height: 200px;
		float: left;
		margin: 5px 50px;
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
		top: 5px;
		right: 5px;
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
		/* rgba(237, 126, 126, 0.7) / rgba(246, 192, 192, 0.7) */
		display: none;
		/* padding: 50px 0px; */
		position: absolute;
		left: 0px;
		top: 0px;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	#bigImg img{
		display: none;
		max-height: 70%;
	}
</style>

<section>
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
	
	<div id="pageWrap">
		<ul class="pagination">
			<c:if test="${pageMaker.prev == true}">
				<li><a href="listPage?page=1&searchType=${cri.searchType}&keyword=${cri.keyword}">&ctdot;</a></li>
				<li><a href="listPage?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&lBarr;</a></li>
			</c:if> 
			<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li ${idx == pageMaker.cri.page ? 'class=active' : ''}> <!-- pageMaker.cri.page : 현재 페이지 번호 -->
					<a href="listPage?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<li><a href="listPage?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&rBarr;</a></li>
				<li><a href="listPage?page=${pageMaker.lastPage}&searchType=${cri.searchType}&keyword=${cri.keyword}">&ctdot;</a></li>
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