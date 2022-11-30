<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="header"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet" />
<title>header</title>
</head>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
}

.wrapper {
	box-shadow: 0px 0px 20px grey;
}

.header-wrapper {
	width: 1200px;
	margin: 0 auto;
	z-index: 10000;
}

h6 {
	font-weight: 600;
}

a {
	color: #333;
	text-decoration: none;
}

.main-menu {
	margin-left: 74px;
}

.login-btn {
	margin-right: 20px;
}

.icons {
	border: 1px solid silver;
	border-radius: 50px;
	padding: 15px;
	box-shadow: 0 0 5px gray;
	margin-right: 15px;
}

.icon-size {
	width: 20px;
	height: 20px;
	display: block;
}

.icon-cart .icon-mypage {
	width: 20px;
	height: 20px;
}
</style>
<body>
	<header>
		<div class="wrapper">
			<div class="header-wrapper">
				<div class="row pt-4">
					<div class="col-3">
						<img style="float: right" src="../mainImg.png" alt="" />
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1">도서검색</span> <input
								type="text" class="form-control" placeholder="검색어 입력..." />
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<div class="col-sm-3 d-flex justify-content-end">
						<span class="icons"> <a href="#" class="icon-size"> <i
								class="fa-solid fa-basket-shopping fa-fw icon-cart" title="Back"></i>
						</a>
						</span> <span class="icons"> <a href="#" class="icon-size"> <i
								class="fa-solid fa-user fa-fw icon-mypage" title="Back"></i>
						</a>
						</span>
					</div>
				</div>

				<div class="row mt-1 pt-2 pb-3">
					<div class="col-2"></div>
					<div class="col-6 main-menu">
						<div class="row text-end">
							<div class="col">
								<h6>전체도서</h6>
							</div>
							<div class="col">
								<h6>최신신작</h6>
							</div>
							<div class="col">
								<h6>베스트</h6>
							</div>
							<div class="col">
								<h6>이벤트</h6>
							</div>
							<div class="col">
								<h6>고객센터</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-3 d-flex justify-content-end">
						<div class="login-btn">
							<a href="#">로그인</a>
						</div>
						<div class="">
							<a href="#">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>