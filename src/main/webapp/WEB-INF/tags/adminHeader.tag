<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <li><a class="dropdown-item" href="#">공지사항 작성</a></li>
            <li><a class="dropdown-item" href="#">공지사항 수정</a></li>
          </ul>
        <a class="nav-link" href="#">문의 관리</a>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            책 관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">책 등록</a></li>
            <li><a class="dropdown-item" href="#">책 목록</a></li>
          </ul>
      </div>
    </div>
  </div>
</nav>