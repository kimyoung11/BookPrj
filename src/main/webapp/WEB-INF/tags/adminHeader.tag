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
        <a class="nav-link active" aria-current="page" href="${ordermanage}">관리자 메인</a>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            공지사항
          </a>
          <a class="nav-link" href="${registerNotice }">공지사항 작성</a>
          <a class="nav-link" href="${noticeList }">공지사항 관리</a>

        <a class="nav-link" href="${questionList }">문의 관리</a>
        <a class="nav-link" href="${ordermanage }">주문 관리</a>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            책관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${registerBook }">책 등록</a></li>
            <li><a class="dropdown-item" href="${bookList }">책 목록</a></li>
          </ul>
          <a type="button" class="nav-link active" id="btn-back-to-top" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">관리자 채팅</a>
      </div>
  </div>
</nav>

 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <iframe src="${pageContext.request.contextPath}/book/chat" width="480" height="500" frameborder="0" allowtransparency="true"></iframe> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
  </div>
</div>
    </div>