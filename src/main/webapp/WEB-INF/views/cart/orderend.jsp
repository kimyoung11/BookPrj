<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<div>
		<h1 style="text-align: center;">주문이 완료되었습니다!</h1>
	</div>
	
<form>
  <label for="fruit"> 좋아하는 과일 </label>
  <select id="fruit" name="fruit">
    <option value="">-- 선택하세요 --</option>
    <optgroup label="여름">
      <option value="strawberry">딸기</option>
      <option value="banana">바나나</option>
    </optgroup>
    <optgroup label="여름">
      <option value="mango">망고</option>
      <option value="melon">멜론</option>
      <option value="grape">포도</option>
      <option value="watermelon">수박</option>
    </optgroup>
    <optgroup label="가을">
      <option value="apple">사과</option>
      <option value="pear">배</option>
    </optgroup>
    <optgroup label="겨울">
      <option value="mandarine">귤</option>
    </optgroup>
  </select>
</form>
   
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>