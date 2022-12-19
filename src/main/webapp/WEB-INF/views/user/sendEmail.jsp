<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class = "content" action="findPassword.me" method="post">
 	<div class="textbox">
  		<input id="u_id" name="u_id" type="text" />
  		<label for="text">아이디</label>
   		<div class="error">아이디을 입력하세요</div>
 	</div>
 	
 	<div class="textbox">
  		<input id=u_email name="u_email" type="text" />
  		<label for="text">이메일</label>
   		<div class="error">이메일을 입력하세요</div>
 	</div>
 	
	<br><br>
   	<input type="submit" id="check" value="비밀번호찾기">
</form>
</body>
</html>