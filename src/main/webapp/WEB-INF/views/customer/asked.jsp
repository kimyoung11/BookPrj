<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>자주묻는질</title>
<style>
	
	<%@include file="/WEB-INF/views/css/asked.css"%>
	
</style>
</head>
<body>
	<my:headerBar></my:headerBar>
	<my:subMenu active="asked"></my:subMenu>
	
<div class="align-items-center" id="bestQuestion">
        <div id="faq">
            	<div style="text-align: center;" class="mb-5">
					<h1 class="headTitle">자주 묻는 질문 TOP 5</h1>
				</div>
				

            <ul>
                <li>
                    <input type="checkbox" checked />
					<i></i>
                    <h2 class="question">Q. 사용 가능한 결제 수단은 어떤것들이 있나요?</h2>
                    <p>
                       당사에서는 회원님들께 다양한 결제 수단을 제공하고 있습니다.<br>
                       <br>
						1. 기본 결제수단<br>
						신용카드, 무통장 입금(은행송금), 계좌이체, 휴대폰결제, 간편결제(카카오페이, 페이코, 시럽페이, 네이버페이, 삼성페이)<br>
						<br>
						2. 할인/적립 결제수단<br>
						쿠폰, 가족계좌, 예치금, YES머니, YES24상품권<br>
						<br>
						※ 외부상품권은 각각 사용 방법이 다르니 자세한 안내를 확인 후 이용하시기 바랍니다.<br>
						<br>
						※ 기본 결제수단과 할인/적립 결제수단 및 외부상품권/포인트는 같이 사용 가능합니다.<br>
                    </p>
                </li>
                <li>
                    <input type="checkbox" checked />
                    <i></i>
                    <h2 class="question">Q. 주문한 상품에 대해 배송 조회는 어디서 하나요?</h2>
                    <p>
						PC<br>
 						[마이페이지]>[주문내역/배송조회] 에서 해당 주문번호 버튼을 클릭하면 배송추적이 가능합니다.

                    </p>
                </li>
                <li>
                    <input type="checkbox" checked />
                    <i></i>
                    <h2 class="question">Q. 반품이 가능한 경우는 어떤 것이 있나요?</h2>
                    <p>
                        반품이 가능한 경우
						<br>
						1) 파본/오발송/배송지연 으로 인한 반품의 경우
						<br>
						2) 변심으로 인한 반품의 경우 출고 완료 후 10일 이내 접수하실 수 있으며 훼손되지 않은 경우 가능합니다. 이때 발생되는 택배비용은 고객님께서 부담 하셔야 합니다.
						<br>
						3) 오발송/파본의 경우 (문제점 발견이 단기간에 어려운 파본의 경우,  30일(늦어도 수령일로부터 3개월) 이내에만 접수 가능합니다.
						<br>
						4) 직수입양서/직수입일서는 취소 수수료(20%)를 부담해야 합니다.
                    </p>
                </li>
                <li>
                    <input type="checkbox" checked />
                    <i></i>
                    <h2 class="question">Q. 주문확인, 배송확인, 교환 반품 방법 안내해주세요.</h2>
                    <p>
                       가장 많이 궁금해하시는 아래 문의를 요약하여 안내드리오니 문의 전 참고 부탁드립니다.
						<br>
						1. 주문 : 마이페이지 주문내역에서 확인이 가능합니다.
						<br>
						2. 배송 : 마이페이지 주문내역 항목에서 배송 조회가 가능합니다.
						<br>
						3. 교환 : 마이페이지 1:1문의 항목에서 직접 접수 및 접수내역 조회가 가능합니다.
						<br>
						4. 반품 : 마이페이지 주문내역 항목에서 출고 후 10일 이내 직접 접수 및 접수 내역 조회가 가능합니다.
						<br>
						감사합니다.
                    </p>
                </li>
                <li>
                    <input type="checkbox" checked />
                    <i></i>
                    <h2 class="question">Q. 아이디, 비밀번호를 잃어버렸어요. 어떻게 하나요?</h2>
                    <p>
                       	1) 아이디 찾기
						<br>
						회원 로그인 화면에서 [아이디 찾기]를 클릭 하여 간편찾기(이메일, 전화번호) 휴대폰 인증 통해 확인이 가능합니다.
						<br>
						2) 비밀번호 찾기
						<br>
						회원 로그인 화면에서 [비밀번호 찾기]를 클릭 하여 아이디와 가입 시 기입한 이메일 주소 또는 휴대폰번호를 입력 하여 임시비밀번호 발급이 가능합니다.
						<br>
						위의 정보로 받을 수 없는 경우 본인인증 후 새 비밀번호로 변경해주세요.
						<br>
						※ 위 경로로 ID 및 비밀번호를 찾을 수 없는 경우에는 고객센터로 문의하시기 바랍니다.
                    </p>
                </li>
            </ul>
        </div>
    </div>
    
</body>
</html>