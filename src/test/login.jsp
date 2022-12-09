<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
}

ul {
	padding: 0;
}

li {
	list-style: none;
}

a {
	color: #333;
	text-decoration: none;
}

li {
	display: inline;
}

.clearfix::before, .clearfix::after {
	content: '';
	display: block;
	clear: both;
}

#form {
	margin-top: 200px;
}

.logo {
	text-align: center;
	margin-bottom: 30px;
}

#login_button {
	margin-top: 20;
}

.link {
	text-align: center;
}

#test li:nth-child(n+2) {
	position: relative;
	margin-left: 5px;
	padding-left: 10px;
}

#test li:nth-child(n+2)::after {
	position: absolute;
	left: 0;
	top: 3px;
	content: "";
	width: 1px;
	height: 15px;
	background-color: black;
}
</style>
</head>
<body>
	<div class="container-md">
		<div class="box justify-content-center">
			<div id="form" class="row justify-content-center">
				<div class="col-12 col-md-5">
					<div class="logo">
						<img src="../image/logo.png" alt="logo">
					</div>
					<form action="">
						<label for="inputPassword5" class="form-label">ID 로그인</label><br>
						<div class="input-group flex-nowrap ">
							<span class="input-group-text" id="addon-wrapping"
								style="background-color: #fff;"><i
								class="fa-solid fa-user"></i></span> <input type="text"
								class="form-control pt-3 pb-3" placeholder="아이디"
								aria-label="Username" name="userID">
						</div>
						<div class="input-group flex-nowrap">
							<span class="input-group-text" style="background-color: #fff;"><i
								class="fa-solid fa-lock"></i></span> <input type="text"
								class="form-control pt-3 pb-3" placeholder="비밀번호"
								aria-label="Username" name="userPassword">
						</div>
						<div id="login_button " class="d-grid gap-2 mt-5 mb-2">
							<button class="btn btn-primary pt-3 pb-3" type="button" value="로그인">로그인</button>
							<div class="link mt-2">
								<ul id="test">
									<li><a href="">비밀번호 찾기</a></li>
									<li><a href="">아이디 찾기</a></li>
									<li><a href="">회원가입</a></li>
								</ul>

							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>