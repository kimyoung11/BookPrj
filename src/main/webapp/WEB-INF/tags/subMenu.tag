<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="active" %>


<c:url value="/customer/asked" var="askLink" />
<c:url value="/customer/notice" var="listLink" />
<c:url value="/customer/question" var="questLink" />

<div class="mb-5">
	<ul class="nav nav-pills">
		<li class="nav-item col-2">
			<a class="nav-link ${active eq 'asked' ? 'active' : '' }" href="${askLink }">자주묻는질문</a>
		</li>
		<li class="nav-item col-2">
			<a class="nav-link ${active eq 'notice' ? 'active' : '' }" href="${listLink }">공지사항</a>
		</li>
		<li class="nav-item col-2">
			<a class="nav-link ${active eq 'question' ? 'active' : '' }" href="${questLink }">1:1문의</a>
		</li>
	</ul>
</div>


				