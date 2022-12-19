<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
<style>
</style>
<head>
</head>
<body>
	<form method="post" action="findID" name="findID">
	
		<div>
			<label for="name">이름</label>
			<input type="text" id="u_name" name="u_name" /> 	
		</div>

		<div class="form-label-group">
			<label for="phone">전화번호</label>
			<input type="text" id="u_phone" name="u_phone" /> 
		</div>

		<div>
			<input type="submit">
		</div>

		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0}">
			<label>찾으시는 아이디는 &lt;${u_id}&gt; 입니다.</label>
			<div>
				<input type="button" value="OK" onclick="closethewindow()">
			</div>
		</c:if>
	</form>
	
	<script>
		function closethewindow() {
			self.close();
		}
	</script>
</body>
</html>