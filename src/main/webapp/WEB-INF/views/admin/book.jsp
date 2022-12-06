<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	책등록 페이지
	<form action="" method="post">
		책 제목<input type="text" name="b_title"><br>
		책 글쓴이<input type="text" name="b_writer"><br>
		책 출판일<input type="text" name="b_pubDate"><br>
		책 가격<input type="number" name="b_price"><br>
		책 장르<input type="text" name="b_genre"><br>
		책 이미지<input type="file" name="b_img" accept="image/png, image/jpg"><br>
		
		<input type="submit" value="책 등록하기">
	</form>
</body>
</html>