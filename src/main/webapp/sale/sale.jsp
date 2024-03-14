<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FleaMarket</title>

</head>
<body>
<%@ include file="../layout/header.jsp" %>

<!-- sell list -->
<div id="main">
	<div id="wrap">
	<div id="head-wrap"></div>
		<h2>전체 상품</h2>

<!-- category -->
<div class="search">
	<!-- form action 이 없을 때 동작은? 자기자신 url 입니다. method 기본값은 get-->
	<form>
	<select name="category">
		<option value="">카테고리 선택</option>
		<c:forEach items="${sellList}" var="cate">
			<option value="${cate.category}"></option>
		</c:forEach>
	</select>
	</form>
	</div>

		<section id="contents" style="overflow: hidden;" id="list">
			<ul class="item-list sell-list col-4">				
			<c:forEach var="vo" items="${list}">
				<li id="cards-wrap">
					<div class="card-top">
						<!-- 판마 완료일 경우 판매완료 사진 -->
						<div class="pdt-card card-contents">
							<c:if test="${vo.sell_stt=='N' }">
								<div class="card-photo">
								<img src="./images/soldout.png" alt="판매완료">
								</div>
							</c:if>
							<!-- 판마 중일 경우 대표사진 -->
							<c:if test="${vo.sell_stt=='Y' }">
								<div class="card-photo">
								<img src="${vo.images} }" alt="상품이미지">
								</div>
							</c:if>
						</div>
							<!-- 사진 이외 정보 묶음 -->
						<div class="card-desc">
							<div class="title">
								<h3>
									<a href="sale?idx=${vo.pdt_code}"><c:out value="${vo.title}"/></a>
								</h3>
							</div>
							<div class="card-price">(<fmt:formatNumber value="${vo.price}" pattern="###,###"/> 원)
							</div>
							<div class="card-region-name"><c:out value="${vo.sell_location}"/>
							</div>
							<!-- 얼마나 전에 올린 게시물인지 확인 -->
							<div class="timeAgo">	
								<!-- vo.createdAt 날짜 패턴을 적용한 결과 문자열을 createdAt 새로운 변수로 저장 -->
								<fmt:formatDate value="${vo.sell_date}" pattern="yyyy-MM-dd" var="createdAt"/>
								<!-- 오늘 작성한 글은 시간으로 표시 -->
									<c:if test='${createdAt == today}'>
										<fmt:formatDate value="${vo.sell_date }" type="time"/>
									</c:if>
								<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
									<c:if test='${createdAt != today}'>
										<fmt:formatDate value="${vo.sell_date }" pattern="MM-dd"/>
									</c:if>
								<%-- //<fmt:formatDate value="${vo.pay_date}" type="both"/> --%>
							</div>
							<div class="read-cnt">
								<p><c:out value="${vo.read_cnt}"/></p>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>	
		</section>
	</div>
</div>




    


<!-- move page -->
    <div class="list"
		style="width: 700px; margin: auto; padding: 10px; text-align: center;">
		전체 글 개수 :
		<c:out value="${paging.totalCount }" />
		<br>
		<hr>
		 <a class="pagenum" href="javascript:page('1')">&lt;&lt;</a> 
		<!--(1) 첫번째 페이지 1번으로 이동 -->

		<!--(2)  실행하면서 파악해보세요. -->
		<!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
		<a class="pagenum"
			href="javascript:page('${paging.startPage-1 }')"
			style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

		<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<a class="pagenum ieach" href="javascript:page('${i }')"> <c:out
					value="${i }" />
			</a>
		</c:forEach>

		<a class="pagenum" href="javascript:page('${paging.endPage+1 }')"
			style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

		 <a class="pagenum" href="javascript:page('${paging.totalPage }')">&gt;&gt;</a> 
		<!--(5) 가장 마지막 페이지로 이동 -->
	</div>
	
<%-- footer --%>


<script type="text/javascript">
		const temp='${cate}'
</script>
<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${paging.currentPage}') {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
	function page(pno){  /* 페이지이동 url을 만들고 이동하기 */
		let url = '?page=' + pno
		if('${paging.findText }'!='')
			url += '&findText=${paging.findText}&column=${paging.column}'
		location.href=url	
	}
	function readOne(idx){
		let url = 'read?idx='+idx+'&page=' + ${paging.currentPage}
		if('${paging.findText }'!='')
			url += '&findText=${paging.findText}&column=${paging.column}'
		location.href=url	
	}
</script>
<!-- scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<script src="../js/nav.js"></script>
</body>
</html>