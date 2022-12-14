<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/admin/book" var="registerBook"></c:url>
<c:url value="/admin/bookList" var="bookList"></c:url>
<c:url value="/admin/noticeRegister" var="registerNotice"></c:url>
<c:url value="/admin/notice" var="noticeList"></c:url>
<c:url value="/admin/question" var="questionList"></c:url>
<c:url value="/cart/ordermanage" var="ordermanage"></c:url>



<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">메뉴</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="#">아무거나 컨텐츠</a>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            공지사항
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${registerNotice }">공지사항 작성</a></li>
            <li><a class="dropdown-item" href="${noticeList }">공지사항 관리</a></li>
          </ul>
        <a class="nav-link" href="${questionList }">문의 관리</a>
        <a class="nav-link" href="${ordermanage }">주문 관리</a>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            책관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${registerBook }">책 등록</a></li>
            <li><a class="dropdown-item" href="${bookList }">책 목록</a></li>
          </ul>
      </div>
    </div>
  </div>
</nav>