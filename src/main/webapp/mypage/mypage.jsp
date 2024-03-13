<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link rel="stylesheet" href="css/mypage.css">
</head>
	<h2>내정보</h2>
	<%@ include file="../layout/header.jsp" %>
<body>

<hr>
<div class="My">
	<div class="Profile">
	<button onclick="location.href='member/modify'" type="button" class="Profile">정보수정</button>
	</div>
	<div class="logout">
	<button onclick="location.href='member/logout'" type="button" class="logout">로그아웃</button>
</div>
</div>
<div class="container">
    <h3 onclick="toggleSection('community')">커뮤니티</h3>
    <div id="community" class="hidden">
	<h4><a href="">나의 글 보러가기</a></h4>
	<h4><a href="">나의 댓글 보러가기</a></h4>
	</div>
    <h3 onclick="toggleSection('transactions')" class="open">나의 거래</h3>
    <div id="transactions">
        <h4><a href="">관심목록</a></h4>
        <h4><a href="">판매내역</a></h4>
        <h4><a href="">구매내역</a></h4>
</div>
</div>

<script>

function toggleSection(sectionId) {
    var section = document.getElementById(sectionId);
    if (section.classList.contains('hidden')) {
        section.classList.remove('hidden');
        section.previousElementSibling.classList.add('open');
    } else {
        section.classList.add('hidden');
        section.previousElementSibling.classList.remove('open');
    }
}
</script>
</body>

</html>