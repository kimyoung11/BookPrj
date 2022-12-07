<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:url value="/book/list/all" var="listAll"/> --%>


<c:url value="/book/list" var="listAll" />
<c:url value="/book/list/new" var="listNew" />
<c:url value="/book/list" var="listBest" />
<c:url value="/cart/cart" var="cartView"></c:url>
<c:url value="/user/login" var="loginView"></c:url>
<c:url value="/customer/asked" var="customerView"></c:url>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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


<header>
	<div class="wrapper">
		<div class="header-wrapper">
			<div class="row pt-4">
				<div class="col-3">
					<a href="${pageContext.request.contextPath}/book/main">
					<img style="float: right;"
						src="${pageContext.request.contextPath}/content/logo.png" alt="로고사진" />
					</a>
				</div>
				<div class="col-sm-6">
						<form id="submitForm" class="input-group">
							<span class="input-group-text" id="basic-addon1" >도서검색</span> 
							<input
								type="text" class="form-control" placeholder="검색어 입력..."
								id="autocomplete"
								/>
							<button class="btn btn-outline-secondary" type="submit"
								id="button-search">
								<i class="fa fa-search"></i>
							</button>
						</form>
				</div>
				<div class="col-sm-3 d-flex justify-content-end">
					<span class="icons"> <a href="${cartView }" class="icon-size"> <i
							class="fa-solid fa-basket-shopping fa-fw icon-cart" title="Back"></i>
					</a>
					</span> <span class="icons"> <a href="${loginView }" class="icon-size"> <i
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
							<a href="${listAll}"><h6>전체도서</h6></a>
						</div>
						<div class="col">
							<a href="${listNew}"><h6>최신신작</h6></a>
						</div>
						<div class="col">
							<h6>베스트</h6>
						</div>
						<div class="col">
							<h6>이벤트</h6>
						</div>
						<div class="col">
							<a href="${customerView }"><h6>고객센터</h6></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3 d-flex justify-content-end">
					<div class="login-btn">
						<a href="#">로그인</a>
					</div>
					<div class="register-btn">
						<a href="#">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		const ctx2 = "${pageContext.request.contextPath}";
		let bookCode;
		
      	document.querySelector("#basic-addon1").addEventListener("click",()=>{
      		console.log("클릭되었습니다");
      	})
      	
   		$(function(){
   			$("#autocomplete").autocomplete({
   				source : function(request, response) {
					$.ajax({
						 url : `\${ctx2}/book/autoComplete`,
						 data : {value: request.term},
						 success : function(data){
							 console.log(data);
							 response(
								$.map(data.resultList, function(item){
									return {
										label : item.b_title,
										value : item.b_title,
										value2 : item.b_code
									};
								}) 
							 );
						 }
						 ,error : function(){
							 alert("오류");
						 }
					});
   				},
   				minLength:1,
   				select: function(event,ui){
   					bookCode = ui.item.value2;
   					console.log("****",bookCode);
   					document.querySelector("#submitForm").setAttribute("action",`\${ctx2}/book/detail/\${bookCode}`);
   				},
   				focus: function(event,ui){
   					return false;
   				},
   				autofocus : true,
   				delay : 100
   			});
   		});

      	
      </script>
</header>

