<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트페이지x</title>    
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
        }
        .main-img{
            border-radius: 8px; 
        }
        .col{width: 287px;}

    </style>
</head>
<body>
	<my:headerBar></my:headerBar>
    <div class="container-md" style="margin-top: 30px">
        <div style="text-align: center; margin-top:20px;" class="mb-5">
            <h1 style="font-size: 34px">진행중인 이벤트를 확인해보세요.</h1>
          </div>

            <div class="row mt-5 justify-content-center">
                <div class="col">
                        <a href="">
                            <img class="main-img" src="../image/event-01.png" alt="상단1">
                        </a>
                </div>
                
                <div class="col">
                        <a href="">
                            <img class="main-img" src="../image/event-01.png" alt="상단2">
                        </a>
                </div>
            </div>


        <hr>

            <div class="row mt-5 ">
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            멤버스 온라인 청구할인!
                        </p>
                        <span>2022.01.01~</span>
                        
                </div>
                
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            &lt;&lt;당신의 이해를 돕기 위하여 1권 출간&gt;&gt; <br>
                            2022.01.01~
                        </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;흑뢰성&gt;요네자와 호노부 친필 사인본 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;와빌의 그재무지 그리스 로마신화 출간 이벤트&gt; <br>
                        2022.01.01~
                    </p>
                </div>
            </div>
        
            <div class="row mt-5">
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            멤버스 온라인 청구할인! <br>
                            2022.01.01~
                        </p>
                        
                </div>
                
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            &lt;&lt;당신의 이해를 돕기 위하여 1권 출간&gt;&gt; <br>
                            2022.01.01~
                        </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;흑뢰성&gt;요네자와 호노부 친필 사인본 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;와빌의 그재무지 그리스 로마신화 출간 이벤트&gt; <br>
                        2022.01.01~
                    </p>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            멤버스 온라인 청구할인! <br>
                            2022.01.01~
                        </p>
                        
                </div>
                
                <div class="col">
                        <a href="">
                            <img id="eventImg" src="../image/event-02.png" alt="">
                        </a>
                        <p style="margin-top: 10px;">
                            &lt;&lt;당신의 이해를 돕기 위하여 1권 출간&gt;&gt; <br>
                            2022.01.01~
                        </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                        &lt;흑뢰성&gt;요네자와 호노부 친필 사인본 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>

                <div class="col">
                    <a href="">
                        <img id="eventImg" src="../image/event-02.png" alt="">
                    </a>
                    <p style="margin-top: 10px;">
                      와빌의 그재무지 그리스 로마신화 출간 이벤트 <br>
                        2022.01.01~
                    </p>
                </div>
            </div>
            <!-- pagination -->
            <div class="row">
                <div class="col">
                    <nav class="mt-3" aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                          <li class="page-item">
                            <a class="page-link" href="#"><i class="fa-solid fa-angles-left"></i></a>
                        </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a>
                        </li>
                        </ul>
                      </nav>
                </div>
            </div>
    </div>
    <my:footer></my:footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>