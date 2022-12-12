<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../member/find_id.do" method="post">
		<h3>아이디 찾기</h3>
		<div>
			<p>
				<label>Email</label>
				<input class="w3-input" type="text" id="email" name="email" required>
			</p>
			<button type="submit" id=findBtn >find</button>
			<button type="button" onclick="history.go(-1);" >Cancel</button>
		</div>
	</form>	
</body>
</html>