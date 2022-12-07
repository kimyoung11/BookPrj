	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
        rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/content/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/content/slick/slick-theme.css" />
</head>
<style>
    * {
        font-family: 'Noto Sans KR', sans-serif;

    }

    #header {
        height: 100px;
    }
/* 
    .carousel-item {
        height: 400px;
    } */

    .bestphoto {
        width: 200px;
        height: 250px;
    }

    #bestSeller {
        /* height: 300px; */
        /* text-align: center; */
        justify-content: center;
        /* display: flex; */
        padding: 10px;
    }

    /* #newBook-container {
        height: 400px;
        background-color: lightgray;
    } */

    #steadySeller {
        height: 600px;
        background-color: white;
    }

    #bestQuestion {
        background-color: lightgray;
        justify-content: center;
    }

    .accordion-item {

        width: 700px;
        background-color: gray;
        margin: auto;
    }

    .accordion-button {
        border-radius: 30px;
        background-color: gray;
    }

    .accordion-body {
        background-color: white;

    }

    .titles {
        margin-top: 30px;
        font-size: large;
        font-weight: bold;
    }


    .carousel-container {
            padding: 50px;
        }
/* 
        #slider-div .img-wrapper {
            padding: 15px;
        } */

        .slick-arrow:before {
            color: black;
            
        }


    #footer {
        background-color: black;
        color: white;
        height: 100px;
        clear: both;
    }

.card-list {
  display: flex;
  padding: 3rem;
  overflow-x: scroll;
}
.card {
  display: flex;
  position: relative;
  flex-direction: column;
  height: 350px;
  width: 400px;
  min-width: 250px;
  padding: 1.5rem;
  border-radius: 16px;
  background: white;
  box-shadow: -1rem 0 3rem lightgray;
  transition: 0.2s;
}

.card-list::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}
.card-list::-webkit-scrollbar-thumb {
  background-color: white;
  border-radius: 9px;
  box-shadow: inset 2px 2px 2px hsla(0, 0%, 100%, 0.25),
    inset -2px -2px 2px rgba(0, 0, 0, 0.25);
}
.card-list::-webkit-scrollbar-track {
  background: linear-gradient(90deg, white, white 1px, white 0, white);
}

.card:hover {
  cursor: pointer;
  transform: translateY(-1rem);
}
.card:hover ~ .card {
  transform: translateX(130px);
}
.card:not(:first-child) {
  margin-left: -130px;
}

.card-author {
  position: relative;
  display: grid;
  grid-template-columns: 75px 1fr;
  align-items: center;
  margin: 2rem 0 0;
}
.author-avatar img {
  display: block;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  filter: grayscale(100%);
  margin: 16px 10px;
  overflow: hidden;
}

.author-name-prefix {
  font-style: normal;
  font-weight: 700;
  color: white;
}

.card-header h2:hover {
  background: linear-gradient(90deg, lightgray, lightgray);
  text-shadow: none;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.accordion-item{
    border-radius: 10px;
}

#faq {
  max-width: 700px;
  margin: auto;
  padding: 0 15px;
  text-align: center;
}

section.faq {
  padding-top: 2em;
  padding-bottom: 3em;
}

#faq ul {
  text-align: left;
}
.transition, p, ul li i:before, ul li i:after {
  transition: all 0.3s;
}

#faq .no-select, #faq h2 {
  -webkit-tap-highlight-color: transparent;
  -webkit-touch-callout: none;
  user-select: none;
}

#faq h1 {
  color: #000;
  margin-bottom: 30px;
  margin-top: 0;
}

#faq h2 {
  color: black;
  font-size: 18px;
  line-height: 34px;
  text-align: left;
  padding: 15px 15px 0;
  text-transform: none;
  font-weight: 300;
  letter-spacing: 1px;
  display: block;
  margin: 0;
  cursor: pointer;
  transition: .2s;
}

#faq p {
  color: black;
  text-align: left;
  font-size: 14px;
  line-height: 1.45;
  position: relative;
  overflow: hidden;
  max-height: 250px;
  will-change: max-height;
  contain: layout;
  display: inline-block;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 5px;
  margin-bottom: 15px;
  padding: 0 50px 0 15px;
  transition: .3s opacity, .6s max-height;
  hyphens: auto;
  z-index: 2;
}

#faq ul {
  list-style: none;
  perspective: 900;
  padding: 0;
  margin: 0;
}
#faq ul li {
  position: relative;
  overflow: hidden;
  padding: 0;
  margin: 0;
  /*padding-bottom: 4px;*/
  /*padding-top: 18px;*/
  background: #fff;
  box-shadow: 0 3px 10px -2px rgba(0,0,0,0.1);
  -webkit-tap-highlight-color: transparent;
}
#faq ul li + li {
  margin-top: 15px;
}
#faq ul li:last-of-type {
  padding-bottom: 0;
}
#faq ul li i {
  position: absolute;
  transform: translate(-6px, 0);
  margin-top: 28px;
  right: 15px;
}
#faq ul li i:before, ul li i:after {
  content: "";
  position: absolute;
  background-color: lightgray;
  width: 3px;
  height: 9px;
}
#faq ul li i:before {
  transform: translate(-2px, 0) rotate(45deg);
}
#faq ul li i:after {
  transform: translate(2px, 0) rotate(-45deg);
}
#faq ul li input[type=checkbox] {
  position: absolute;
  cursor: pointer;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
  touch-action: manipulation;
}
#faq ul li input[type=checkbox]:checked ~ h2 {
  color: #000;
}
#faq ul li input[type=checkbox]:checked ~ p {
  /*margin-top: 0;*/
  max-height: 0;
  transition: .3s;
  opacity: 0;
  /*transform: translate(0, 50%);*/
}
#faq ul li input[type=checkbox]:checked ~ i:before {
  transform: translate(2px, 0) rotate(45deg);
}
#faq ul li input[type=checkbox]:checked ~ i:after {
  transform: translate(-2px, 0) rotate(-45deg);
}

#btn-back-to-top {
  position: fixed;
  bottom: 20px;
  right: 20px;
  display: none;
}
</style>
<body>
	<my:headerBar></my:headerBar>
    <div class="container-fluid" style="width: 100%">
        <div id="carousel-section">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/content/head1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/content/head2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/content/head3.jpg" class="d-block w-100" alt="...">
                </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
       
        <section class="card-list" style="width: 62.5%; margin: 0 auto;">
            <article class="card">
              <header class="card-header">
                <div class="img-wrapper"><img src="https://picsum.photos/200/150"></div>
              </header>
              <div class="card-author">
                <div>책제목</div>
                <div class="author-name">
                  <div class="author-name-prefix">저자</div>
                  Hanibal Girmay
                </div>
              </div>
            </article>
            <article class="card">
                <header class="card-header">
                  <div class="img-wrapper"><img src="https://picsum.photos/200/150"></div>
                </header>
                <div class="card-author">
                  <div>책제목</div>
                  <div class="author-name">
                    <div class="author-name-prefix">저자</div>
                    Hanibal Girmay
                  </div>
                </div>
              </article>
              <article class="card">
                <header class="card-header">
                  <div class="img-wrapper"><img src="https://picsum.photos/200/150"></div>
                </header>
                <div class="card-author">
                  <div>책제목</div>
                  <div class="author-name">
                    <div class="author-name-prefix">저자</div>
                    Hanibal Girmay
                  </div>
                </div>
              </article>
              <article class="card">
                <header class="card-header">
                  <div class="img-wrapper"><img src="https://picsum.photos/200/150"></div>
                </header>
                <div class="card-author">
                  <div>책제목</div>
                  <div class="author-name">
                    <div class="author-name-prefix">저자</div>
                    Hanibal Girmay
                  </div>
                </div>
              </article>
          </section>
        <div class="new-section-wrapper" style="width: 100%; background-color: lightgray;">
            <div id="new-section" style="width: 62.5%; margin: 0 auto;">
                <!-- stlye 은 slick 영역 확인용 -->
                <div class="carousel-container">
                    <h6>NEW 주목받는 신작</h6>
                    <div id="slider-div">
	                    <div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/01.png"></div>
	                	<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/02.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/03.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/04.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/05.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/01.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/02.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/03.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/04.png"></div>
	               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/05.png"></div>
                    </div>
                </div>
            </div>
         </div>
        
        <div id="new-section" style="width: 62.5%; margin: 0 auto;">
            <!-- stlye 은 slick 영역 확인용 -->
            <div class="carousel-container">
                <h6>스테디셀러</h6>
                <div id="slider-div2">
                	<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/04.png"></div>
                	<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/03.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/02.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/01.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/02.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/05.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/04.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/03.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/02.png"></div>
               		<div class="img-wrapper"><img src="${pageContext.request.contextPath}/content/small_size/01.png"></div>
               </div>
           </div>
       </div>

       <div id="event-section">
        <div class="container d-flex justify-content-center mb-5">
            <div class="row mt-3">
                <div class="col"><img src="https://picsum.photos/520/250" style="border-radius: 15px;"></div>
                <div class="col"><img src="https://picsum.photos/520/250" style="border-radius: 15px;"></div>
            </div>
        </div>
      </div>

        <div class="container-fluid align-items-center" id="bestQuestion">
            <div id="faq">
                <br>
                <br>
                <h3 style="padding: 20px;">자주 묻는 질문을 확인해보세요.</h3>
                <ul>
                  <li>
                    <input type="checkbox" checked> 
                    <i></i>
                    <h2 style="font-weight: 500;">환불요청</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae debitis iusto voluptatum doloribus rem, qui nesciunt labore tempore fugit iste deserunt incidunt error provident repudiandae laudantium quo ipsa unde perspiciatis, nihil autem distinctio! Deserunt, aspernatur.</p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">환불요청</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente quasi, quia provident facere recusandae itaque assumenda fuga veniam dicta earum dolorem architecto facilis nisi pariatur.</p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">환불요청</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam quas placeat assumenda mollitia magni consequatur dolorum, quod nihil distinctio aperiam officia alias! Voluptate dolore ex officiis sit, magnam non a, eligendi pariatur aut, earum dolores tenetur ipsam id illo deleniti. Laudantium deserunt eaque ipsam voluptatum consequuntur voluptatibus sed minima ad accusamus debitis eos similique laboriosam, molestiae? Consequatur neque tempore quis. Eligendi, in ut aspernatur esse nesciunt libero.</p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">환불요청</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam quas placeat assumenda mollitia magni consequatur dolorum, quod nihil distinctio aperiam officia alias! Voluptate dolore ex officiis sit, magnam non a, eligendi pariatur aut, earum dolores tenetur ipsam id illo deleniti. Laudantium deserunt eaque ipsam voluptatum consequuntur voluptatibus sed minima ad accusamus debitis eos similique laboriosam, molestiae? Consequatur neque tempore quis. Eligendi, in ut aspernatur esse nesciunt libero.</p>
                  </li>
                  <br>
                  <br>
                  <br>
                </ul>
              </div>
              <button type="button" class="btn btn-secondary btn-floating btn-lg" id="btn-back-to-top"><i class="fas fa-arrow-up"></i></button>
        </div>
        <div id="footer">
            <my:footer></my:footer>
        </div>

	<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/content/slick/slick.min.js"></script>
      
        <script>
            $(function () {
                $('#slider-div').slick({
                    infinite: true,
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    arrows: true, 		// 옆으로 이동하는 화살표 표시 여부
    
                });
            })
            
            $(function () {
                $('#slider-div2').slick({
                    infinite: true,
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    arrows: true, 		// 옆으로 이동하는 화살표 표시 여부
    
                });
            })


            let mybutton = document.getElementById("btn-back-to-top");

            window.onscroll = function () {
            scrollFunction();
            };

            function scrollFunction() {
            if (
                document.body.scrollTop > 20 ||
                document.documentElement.scrollTop > 20
            ) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
            }

            mybutton.addEventListener("click", backToTop);

            function backToTop() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
            }

        </script>
</body>

</html>