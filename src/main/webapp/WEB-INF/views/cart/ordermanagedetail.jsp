<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 관리 상세</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
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
        
        select {
        width: 100px;
        border-radius: 5px;
        border-width: 1px;
        height: 40px;
        margin: 0;
        padding: 0;
        }
        
        #selectButton{
        width: 50px;
        border-radius: 5px;
        border: 0.5px;
        height: 40px;
        margin: 0;
        padding: 0;
        color: white;
        background-color: #0d6efd;
        }
        
        h3 {
        text-align: left;
        }
    </style>
</head>
<body>
	<div style="margin-top: 100px"></div>
    <div class="container-md" style="text-align: center;">
        <a href="/cart/ordermanagedetail"><h2>주문상세</h2></a>
        <hr id="hr_line">
        <h3>주문번호 : </h3>
        <h3>주문일 : </h3>
        <table class="table">
	        <thead>
	        	<tr>
		        	<th>이미지</th>
		        	<th>상품명</th>
		        	<th>주문수량</th>
		        	<th>금액</th>
	        	</tr>
	        </thead>
	        <tbody>
	        	<tr>
		        	<th>이미지</th>
		        	<th>책1</th>
		        	<th>3</th>
		        	<th>6000</th>
	        	</tr>
	        </tbody>
        
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>