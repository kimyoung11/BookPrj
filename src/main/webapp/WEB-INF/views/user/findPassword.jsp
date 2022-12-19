<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="pw_set.me" method="post">
	<input type="hidden" name ="num" value="${num }">
			<div class="textbox">
			<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
			<div class="error"> </div>
		</div><br><br>
			<div>
			<input type="submit">
		</div>
</form>
</form>
</body>
</html>