<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">
		<link rel="stylesheet" href="../assets/css/main.css" />
  		<link rel="stylesheet" href="../css/layout.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css">
		<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
<div id="page-wrapper">
	<%@ include file="../layout/header.jsp" %>
	<section style="overflow: hidden;" id="list">
  	
	<div style="padding: 2rem;width: 60rem;margin: auto;" class="table" >
	<div>
		<h3>동네 이야기</h3>
		<p>오늘의 최신 글</p>
			<hr style="color:orange;">
			<ul id="main">
				<li>
					<ul  class="row">
						<li>번호</li>
						<li>제목</li>
						<li>작성자</li>
						<li>조회수</li>
						<li>작성일</li>
					</ul>
				</li>
				
			 	<c:choose>
			 	<c:when test="${empty list}">
			 		<li>
			 			<p>글이 없습니다.</p>
			 		</li>
			 	</c:when>
			 	<c:otherwise>
			 	<c:forEach var="vo" items="${list}"> 
				<li>
					<ul  class="row">
						<li>
							<c:out value="${vo.idx }"/>
						</li>
						<li><a href="read?idx=${vo.idx }&page=${paging.currentPage}" class="title">  <!-- 현재페이지 번호 전달 시작 -순서1) -->
								<c:out value="${vo.title }"/>
							</a>
					 		..<span style="color:orange;font-size: 80%;">(<c:out value="${vo.comment_cnt }"/>)
					 		</span></li>
						<li>
							<c:out value="${vo.writer_id }"/>
						</li>
						<li>
							<c:out value="${vo.read_cnt }"/>
						</li>
					<li>
					<!-- 컬럼명만 변경 -->
					<fmt:formatDate value="${vo.crt_date }" pattern="yyyy-MM-dd" var="crt_date"/>
					<!-- 컬럼명만 변경 -->
					<c:if test='${crt_date == today}'>
						<fmt:formatDate value="${vo.crt_date }" type="time"/>
					</c:if>
					<!-- 컬럼명만 변경 -->
					<c:if test='${crt_date != today}'>
						<fmt:formatDate value="${vo.crt_date }" pattern="yyyy-MM-dd"/>
					</c:if>
					</li>
					
				</ul>
			</li>
		 	</c:forEach>
		 	</c:otherwise>
		 	</c:choose>
			</ul>
		</div>	
	<!-- <div style="float:right;margin:40px;"> -->
	<hr>
<%-- 		<a href="write?page=${paging.currentPage }" class="button" >글쓰기</a> --%>  
		<!-- 로그인 상태가 아니면 로그인으로 이동으로 변경 -->
		<button onclick="cwrite()">글쓰기</button>
<%-- 		<a href="${pageContext.request.contextPath}" class="button" >홈</a> --%>
	

<script type="text/javascript">
	function cwrite() {
		let yn
		// 아래 user.id는 원래 코드 DemoProject의 user.userid지만 우리는 DemoProject의 userid 컬럼명 대신
		// id를 사용하기 때문에 오류가 날 수 도 있음.
		if('${user.id}'==''){
			yn=confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) {
				sessionStorage.setItem('back', './community/write');
				location.href='../login'  
			}
		}else{
			location.href='write?page=${paging.currentPage }'
		}
	}
</script>

			<div style="width:100%;margin: auto;padding: 10px;text-align: center;float: none;" class="list">
				전체 글 개수 : <c:out value="${paging.totalCount }"/> <br>
				<hr>
				<a class="pagenum" href="?page=1">&lt;&lt;</a>
				<a class="pagenum" href="?page=${paging.startPage-1 }"      
						style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
				
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a class="pagenum ieach" href="?page=${i }"><c:out value="${i }"/></a>
				</c:forEach>
				<a class="pagenum" href="?page=${paging.endPage+1 }"
						style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
						
				<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
			</div>
	</div>
	<div data-num="5" id="datanum"></div>
</section>

 <script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${paging.currentPage}') {    
			item.classList.add('current')
		}else{
			item.classList.remove('current')
		}
	});
</script>
</div>			
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../js/nav.js"></script>
			
</body>
</html>
