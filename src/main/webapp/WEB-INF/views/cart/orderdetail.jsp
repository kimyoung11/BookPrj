<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        #hr_line {
            height: 3px;
            padding: 0;
            background-color: green;
            color: green;
            opacity: 1;
        }
        
        th {
        	vertical-align: middle;
        }
        
        p {
        	text-align: left;
        }
        
        #tit:hover {
		color: #4EAC27;
		}
		.trcolor{
        background-color: #F5FAF3;
        }
</style>
</head>
<body>
	<div style="margin-top: 100px"></div>
    <div class="container-md" style="text-align: center;">
        <a href="/cart/orderdetail?o_number=${orderDetailList[0].o_number }"><h2 id="tit">주문상세</h2></a>
        <p>주문번호 : ${orderDetailList[0].o_number}</p>
        <p>주문일시 : ${orderDetailList[0].o_date }</p>
        <p>결제금액 : <span id="price">${orderDetailList[0].o_total }</span></p>
        <table class="table" style="vertical-align: middle;">
        	<thead>
				<tr class="trcolor">
					<th>상품 정보</th>
					<th>상품명</th>
					<th>수량</th>
					<th>합계금액</th>
				</tr>
				<tbody>
				<c:forEach items="${orderDetailList}" var="orderDetailList">
				<tr>
					<td><a href="/book/detail/${orderDetailList.b_code }" target="_blank"><img src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/${orderDetailList.b_code }/${URLEncoder.encode(orderDetailList.b_img,'utf-8')}" alt="제품 사진" style="width: 100px; height: 150px;" class="product_img"/></a></td>
					<td>${orderDetailList.b_title }</td>
					<td>${orderDetailList.od_count }</td>
					<td id="bookPrice">${orderDetailList.b_price * orderDetailList.od_count}</td>
				</tr>       	
				</c:forEach>
				</tbody>
        	</thead>
        </table>
    </div>
<script>
	// 결제금액에 , 원 붙임
	const a = document.querySelector("#price").innerText
	document.querySelector("#price").innerText = Number(a).toLocaleString() + "원";
	
	// 각 책별 합계금액에 , 원 붙임
	const b = document.querySelectorAll("#bookPrice")
	const size = document.querySelectorAll("#bookPrice").length;
	for(var i = 0; i < size; i++){
		let c = b[i].innerText;
		b[i].innerText = Number(c).toLocaleString() + "원";
	}
</script>
</body>
</html>