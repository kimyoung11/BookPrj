<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:url value="/book/list/all" var="listAll"/> --%>


<c:url value="/book/list" var="listAll" />
<c:url value="/book/list/new" var="listNew" />
<c:url value="/book/list" var="listBest" />
<c:url value="/cart/cart" var="cartView" />
<c:url value="/user/login.do" var="loginView" />
<c:url value="/customer/asked" var="customerView" />
<c:url value="/user/signup" var="signUp" />
<c:url value="/user/myPage" var="myPage"></c:url>
<c:url value="/user/logout.do" var="logOut" />
<c:url value="/user/myPage" var="myPage" />
<c:url value="/cart/event" var="event" />



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>


 * {
	font-family: "Noto Sans KR", sans-serif;
}

.wrapper {
	
	/* position: relative;
	top: 0;
	height: 5em;
	width: 1200px; */
	box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
	width: 100%;
	margin: 0 auto;
	z-index: 10000;
	
}

.header-wrapper {
	margin: 0 auto;
	width: 1200px;
	
	
}

h6 {
	font-weight: 500;
}

a {
	color: #333;
	text-decoration: none;
}

.main-menu {
	margin-left: 120px;
}

.login-btn {
margin-right:7px;
}

.icons {
	border-radius: 50px;
	padding: 16px;
	box-shadow: 0 0 3px rgba(0,0,0,0.3);
	margin-right: 10px;
}

.icon-size {
	width: 20px;
	height: 20px;
	display: block;
}

.input-group-text{
	background-color: #fff;
}
.input-group-text{
	border:none;
}

.myPage{
margin-right:50px; 
}

#autocomplete{
height: 42px;
}

/* 로그인버튼 */
.btn-primary{
--bs-btn-bg:#4eac27;
--bs-btn-border-color:#4eac27;
}
.btn:hover{
background-color: #489f23;
border-color:#489f23;
}

.card-header{
background-color:white;

}

.menu-content2{
margin-top: 14px;
margin-bottom: 14px;
padding-bottom: 14px;	
}


.loginIcon{
padding-right: 0;
}

a:hover{
color:#4eac27;
}
</style>


<header>
	<div class="wrapper">
		<div class="header-wrapper">
			<div class="row pt-4">
        
					<div class="col-1">
						<a href="${pageContext.request.contextPath}/book/main">
						<img style="float: right;"
							src="${pageContext.request.contextPath}/content/logo.png" alt="로고사진" />
						</a>
					</div>
					
					<div class="col-sm-6">
							<form id="submitForm" class="d-flex input-group w-auto">
								<span class="input-group-text" id="basic-addon1" ></span> 
						      <input
						      	id="autocomplete"
						        type="text"
						        class="form-control rounded"
						        placeholder="Search"
						        aria-label="Search"
						        aria-describedby="search-addon"
						        onchange="changeFunc(event)"
						        value=""
						        name="b_keyword"
						      />
						      <button class="input-group-text border-0" id="button-search">
						        <i class="fas fa-search"></i>
						      </button>
						    </form>
					</div>

				
				
					<div class="col-sm-5 d-flex justify-content-end">
					<!-- cart -->
						<c:if test="${u_id != null}">
							<span class="icons"> 
								<a href="${cartView}" class="icon-size"> 
									<i class="fa-solid fa-basket-shopping fa-fw icon-cart" title="장바구니"></i>
								</a>	
							</span>
						</c:if>	
						<c:if test="${u_id == null}">
							<span class="icons"> 
								<a href="${loginView}" class="icon-size"> 
									<i class="fa-solid fa-basket-shopping fa-fw icon-cart" title="장바구니"></i>
								</a>	
							</span>
						</c:if>
				
					<!-- mypage -->
						<c:if test="${u_id != null}">
							<span class="icons"> 
								<a href="${myPage}" class="icon-size"> 

									<i class="fa-solid fa-user fa-fw icon-mypage" title="마이 페이지"></i>			
								</a>
							</span>
						</c:if>	
						<c:if test="${u_id == null}">
							<span class="icons"> 
								<a href="${loginView}" class="icon-size"> 
									<i class="fa-solid fa-user fa-fw icon-mypage" title="마이 페이지"></i>
								</a>	
							</span>
						</c:if>	
							
					</div>		
				</div>
				
			
	<div class="row justify-content-evenly menu-content2">
				<div class="col-5 main-menu">
					<div class="row mt-1">
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
							<a href="${event }"><h6>이벤트</h6></a>
						</div>
						<div class="col">
							<a href="${customerView }"><h6>고객센터</h6></a>
						</div>
					</div>
				</div>
				
				
		 		<div class="col-5 d-flex justify-content-end loginIcon "> 
				
					<div class="login-btn">
					<c:if test="${u_id == null}">
						<a class="btn btn-primary btn-sm" href="${loginView}">로그인</a>
					</c:if>
					<c:if test="${u_id != null}">
						<a class="btn btn-primary btn-sm" href="${logOut}">로그아웃</a>
					</c:if>
					</div>
					
					<div class="register-btn">
						<c:if test="${u_id == null}">
							<a class="btn btn-primary btn-sm" href="${signUp}">회원가입</a>
						</c:if>
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
      	
      	let b_keyword;
      	
      	function changeFunc(event){
      		console.log(event.target.value);
      		console.log("change func");
      		document.querySelector("#autocomplete").value=event.target.value;
      	}
      	
      	
      	document.querySelector("#submitForm").setAttribute("action",`\${ctx2}/book/listKeyword?page=1`);
      	
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
   					console.log(ui.item.value);
   					console.log(bookCode);
   					location.assign(`${ctx}/book/detail/\${bookCode}`);
   					//document.querySelector("#submitForm").setAttribute("action",`\${ctx2}/book/detail/\${bookCode}`);
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
