<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트페이지</title>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <style>
         *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        #eventImg {
            border-radius: 8px;
            width: 100%;
            height: 100%;
            object-fit: cover;
        } 
        
        .main-img{
            border-radius: 8px; 
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
          
        #evtcol{
        width: 287px;
        height: 200px;
        }
     
        #space {
        margin-top: 100px;
        }

    </style>
</head>
<body>
	<my:headerBar></my:headerBar>
    <div class="container-md" style="margin-top: 30px">
        <div style="text-align: center; margin-top:20px;" class="mb-5">
            <h1 style="font-size: 34px">진행중인 이벤트를 확인해보세요.</h1>
          </div>

            <div class="row mt-5">
                <div id="evtcol" class="col">
                        <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event4.png" target="_blank">
                            <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event4.png" alt="제품 사진"/>
                        </a>
                        
                        <div>&lt;10대는 진심&gt; 시리즈 출간 이벤트</div>
                </div>
                
                <div id="evtcol" class="col">
                        <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event5.png" target="_blank">
                        	<img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event5.png" alt="제품 사진"/>
                        </a>
                        <div>&lt;오늘, 새롭게 살 수 있는 이유&gt; 기대평 이벤트</div>
                </div>
            </div>
            <div id="space"></div>

            <div class="row mt-5 ">
            	<div id="evtcol" class="col">
	                <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event3.png" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event3.png" alt="제품 사진"/>
                    </a>
	                <p style="margin-top: 10px;">
	                    멤버스 온라인 청구할인! <br />
	                    2022.01.01~
	                </p>
	            </div>
                
                <div id="evtcol" class="col">
	                <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event1.jpg" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event1.jpg" alt="제품 사진"/>
                    </a>
	                <p style="margin-top: 10px;">
	                    &lt;&lt;당신의 이해를 돕기 위하여&gt;&gt; 1권 출간 <br>
	                    2022.01.01~
	                </p>
                </div>

                <div id="evtcol" class="col">
                    <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event2.jpg" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event2.jpg" alt="제품 사진"/>
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;흑뢰성&gt;요네자와 호노부 친필 사인본 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>

                <div id="evtcol" class="col">
                    <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event6.png" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event6.png" alt="제품 사진"/>
                   </a>
                    <p style="margin-top: 10px;">
                        &lt;와빌의 그재무지 그리스 로마신화&gt; 출간 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>
            </div>
        	<div id="space"></div>
            <div class="row mt-5">
                <div id="evtcol" class="col">
                        <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event7.png" target="_blank">
                        	<img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event7.png" alt="제품 사진"/>
                        </a>
                        <p style="margin-top: 10px;">
                            &lt;&lt;당신의 뇌는 변화가 필요합니다&gt;&gt; 출간 기념 이벤트<br>
                            2022.01.01~
                        </p>
                        
                </div>
                
                <div id="evtcol" class="col">
                        <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event8.png" target="_blank">
                        	<img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event8.png" alt="제품 사진"/>
                        </a>
                        <p style="margin-top: 10px;">
                            캠브리지 겨울방학 이벤트 <br>
                            2022.01.01~
                        </p>
                </div>

                <div id="evtcol" class="col">
                     <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event9.png" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event9.png" alt="제품 사진"/>
                     </a>
                    <p style="margin-top: 10px;">
                        문장의 리스트 <br>
                        2022.01.01~
                    </p>
                </div>

                <div id="evtcol" class="col">
                     <a href="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event10.png" target="_blank">
                        <img class="main-img" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/event/event10.png" alt="제품 사진"/>
                     </a>
                    <p style="margin-top: 10px;">
                        &lt;큰별 작은별&gt; 출간 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>
                
                <div id="space"></div>
            </div>
    </div>
           
    
    <my:footer></my:footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>