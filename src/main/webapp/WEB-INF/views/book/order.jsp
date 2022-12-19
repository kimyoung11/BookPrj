<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
        rel="stylesheet">
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        ul {
            padding: 0;
        }

        a {
            color: #333;
            text-decoration: none;
        }

        h2 {
            font-size: 22px;
        }

        .product_img {
            width: 100px;
        }

        #address_button {
            background-color: white;
            color: black;
            border-color: grey;
        }

        #hr_line {
            opacity: 1;
            margin: 0;
        }

        thead{

            line-height: 50px;
        }

        .form-control {
            width: 300px;
            display: inline;
        }

        .input-group {
            width: 500px;
        }
        .adress-input{
            margin: 10px 187px;
        
        }
        .order-btn{
            padding: 6px 36px;
            font-size: 18px;
            margin-bottom: 40px;
            margin-top: 20px;
        }
        .content{
            width: 1100px;
            margin: 0 auto;
            margin-top: 30px;}
    </style>
</head>

<body>
	<my:headerBar></my:headerBar>
    <div class="container-md">
        <h2>주문 / 결제</h2>
        <hr id="hr_line">
        <table class="table" style="text-align: center;">
            <thead>
                <tr>
                    <th>상품이미지</th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>책 가격</th>
                    <th>수량 X 각 책권 가격</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                    <img src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/${book.b_code }/${URLEncoder.encode(book.b_img,'utf-8')}" alt="제품 사진" style="width: 100px; height: 150px;" class="product_img"/>
                    </td>
                    <td class="align-middle">${book.b_title }</td>
                    <td class="align-middle">${cnt }</td>
                    <td class="align-middle">${book.b_price }원</td>
                    <td class="align-middle">${book.b_price * cnt }</td>
                </tr>
            </tbody>
        </table>


        <!-- 배송지정보 -->

        <h2 style="margin-top: 80px;">배송지 정보</h2>
        <hr id="hr_line">
        <div class="content">
        <div class="mb-3 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>

            <div class="col-sm-3 input-group">
                <input type="text" class="form-control" aria-label="Recipient's username"
                    aria-describedby="button-addon2" readonly="readonly" value="${user.u_email }">
            </div>
            <div class="row adress-input">
            <input class="form-control" type="text" placeholder="주소" aria-label="readonly input example"
            readonly style="margin-right: 10px;" value="${user.u_address }">
            <input class="form-control" type="text" placeholder="상세주소">
        </div>
        </div>
    


    <div class="mb-3 row">
        <label for="inputPassword" class="col-sm-2 col-form-label">수령인</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="inputPassword1" readonly="readonly" value="${user.u_name }">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="inputPassword2"  readonly="readonly" value="${user.u_phone }">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="inputPassword" class="col-sm-2 col-form-label">배송요청사항</label>
        <div class="col-sm-10">
          <input type="password" class="form-control" id="inputPassword3">
        </div>
      </div>
      
      <div style="text-align: center; font-size: 20px; border-top: 1px solid; blue">
	    <br>
	    	최종 결제 금액	: ${book.b_price * cnt }원 <br>
	    </div>

     <div style="text-align: center;">
    	<form action="/cart/orderdetail" method="post">
    		<input type="hidden" name="u_id" value="${user.u_id}">
    		<input type="hidden" name="o_count" value="${cnt}">
    		<input type="hidden" name="b_code" value="${book.b_code }">
    		<input type="hidden" name="od_count" value="${cnt}">
    		<input type="hidden" name="o_total" value="${book.b_price * cnt }">
        	<button type="submit" class="btn btn-primary order-btn">결제하기</button>
    	</form>

    </div> 
    </tbody>
    </table>
    </div>
</div>
</div>

    <div id="footer">
        <footer class="text-center text-lg-start bg-light text-muted">


            <!-- Section: Links  -->
            <section class="" style="background-color: black;">
                <div class="row w-50 ms-auto mx-auto">
                    <div class="col">개인정보취급</div>
                    <div class="col">개인정보취급</div>
                    <div class="col">개인정보취급</div>
                    <div class="col">개인정보취급</div>
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="background-color: black;">
                © 2022 Copyright:
                <a class="text-reset fw-bold" href="#">사이트 홈페이지</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </div>
</body>

</html>