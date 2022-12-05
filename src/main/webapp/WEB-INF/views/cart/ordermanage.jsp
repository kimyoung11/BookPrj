<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    </style>
</head>
<body>
	<h1>관리자 Navber</h1>
    <div class="container-md" style="text-align: center;">
        <h2>주문관리</h2>
        <hr id="hr_line">
        <div style="text-align: left;">
            <select name="" id="">
                <option value="0">상태</option>
                <option value="1">입금확인</option>
                <option value="2">배송중</option>
                <option value="3">배송완료</option>
                <option value="4">판매완료</option>
                <option value="5">기타</option>
            </select>
            <button style="border-color: black; background-color: white;">조회</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문일시</th>
                    <th>주문상품</th>
                    <th>회원명</th>
                    <th>주문수량</th>
                    <th>주문금액</th>
                    <th>진행상태</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <c:forEach items="${orders }" var="order">
                   		<tr>
                   			<td>${order.o_number }</td>
                   			<td>${order.o_date }</td>
                   			<td>${order.b_title }</td>
                   			<td>${order.u_name}</td>
                   			<td>${order.o_count}</td>
                   			<td>${order.b_price * order.o_count }</td>
                   			<td>${order.o_status}</td>
                   			<td></td>
                   		</tr>
                   </c:forEach>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>