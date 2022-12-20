<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="active" %>


<c:url value="/customer/asked" var="askLink" />
<c:url value="/customer/notice" var="listLink" />
<c:url value="/customer/question" var="questLink" />

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
 * {
	font-family: "Noto Sans KR", sans-serif;
}

.sub-tab {
	margin-top: 80px;
	text-align: center;
}
.content{
width:1000px;
margin:0 auto;
}
.nav-pills{
--bs-nav-pills-link-active-bg:#4eac27;
}
.nav-link{
color:#333;
}
.nav-link:focus, .nav-link:hover{
color:#333;
background-color: #eee;
}
</style>


<div class="container">
<div class="content">
	<ul class="nav nav-pills sub-tab">
		<li class="nav-item col">
			<a class="nav-link ${active eq 'asked' ? 'active' : '' }" href="${askLink }">자주묻는질문</a>
		</li>
		<li class="nav-item col ">
			<a class="nav-link ${active eq 'notice' ? 'active' : '' }" href="${listLink }">공지사항</a>
		</li>
		<li class="nav-item col">
			<a class="nav-link ${active eq 'question' ? 'active' : '' }" href="${questLink }">1:1문의</a>
		</li>
	</ul>
</div>
</div>

				