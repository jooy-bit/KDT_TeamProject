<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pumpkin.css">
<div id="header">
	<nav class='navbar'>
		<!-- 중고거래 / 인기거래 / 동네이야기 / 공지사항 / 마이페이지  -->
		<nav class='nav_div'>
			<div class="container-btn">
				<button type="button" class="nav_right_button" onclick="/join')">회원가입</button>
				<button type="button" class="nav_right_button" onclick="login')">로그인</button>
				<button type="button" class="nav_right_button" onclick="/mypage')">마이페이지</button>
			</div>
			<div class='nav_content'>
				<ul>
					<li class='nav_content_in'><a href="${pageContext.request.contextPath}/index.jsp"><img alt="로고"
							src="${pageContext.request.contextPath}/assets/images/pumpkin.jpg" width="70px" height="auto"></a>
					</li>
					<li class='nav_content_in'><a href="${pageContext.request.contextPath}/sale/sale.jsp"><button
								class='nav_button'>중고거래</button></a></li>
					<li class='nav_content_in'><a href=""><button
								class='nav_button'>인기거래</button></a></li>
					<li class='nav_content_in'><a href="${pageContext.request.contextPath}/community/list.jsp"><button
								class='nav_button'>동네 이야기</button></a></li>
					<li class='nav_content_in'><a href="${pageContext.request.contextPath}/notice/list.jsp"><button
								class='nav_button'>공지사항</button></a></li>
					<li class='nav_content_in'><a href="${pageContext.request.contextPath}/mypage/mypage.jsp"><button
								class='nav_button'>마이페이지</button></a></li>
				</ul>
			</div>
		</nav>
	</nav>
</div>
<style>

</style>