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
	
	.img-wrapper > img {
				width: 268.02px;
				height: 150px;
	}
	

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
 margin:0 auto;
 width:1200px;
 margin-top:50px;
 margin-bottom: 50px;
}
.card {
  display: flex;
  position: relative;
  flex-direction: column;
  height: 350px;
  width: 350px;
  min-width: 250px;
  padding: 1.5rem;
  border-radius: 16px;
  background: white;
  box-shadow: -1rem 0 2rem rgba(0, 0, 0, 0.1);
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
  max-width: 900px;
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
  padding: 26px 30px 0;
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
 /*  line-height: 1.45; */
  position: relative;
  overflow: hidden;
  max-height: 250px;
  will-change: max-height;
  contain: layout;
  display: inline-block;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 10px;
  margin-bottom: 15px;
  padding: 0 25px;
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
  margin-bottom: 10px;
  /*padding-bottom: 4px;*/
  /*padding-top: 18px;*/
  background: #fff;
  box-shadow: 0 3px 8px rgba(0,0,0,0.1);
  -webkit-tap-highlight-color: transparent;
}
#faq ul li + li {
  margin-top: 20px;
}
#faq ul li:last-of-type {
  padding-bottom: 0;
}
#faq ul li i {
  position: absolute;
  transform: translate(-20px, 0);
  margin-top: 40px;
  right: 15px;
}
#faq ul li i:before, ul li i:after {
  content: "";
  position: absolute;
  background-color: lightgray;
  width: 4px;
  height: 10px;
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

#btn-back-to-top2 {
  position: fixed;
  bottom: 70px;
  right: 20px;
  display: inline;
  height: 50px;
}

.container-fluid{
--bs-gutter-x:0;	
}

.subTitle{
	font-size:24px;
}

.new-section{
width:1200px;
}

.new-section-wrapper{
	background-color: #f5faf3;
}

#bestQuestion{
	background-color: #f5faf3;
}

.question-head{
padding-top:70px;
padding-bottom: 40px;

}

</style>
<body>
	<my:headerBar></my:headerBar>
    <div class="container-fluid">
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
       
        <section class="card-list">
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
        <div class="new-section-wrapper" >
            <div id="new-section">
                <!-- stlye 은 slick 영역 확인용 -->
                <div class="carousel-container">
                    <h6 class="subTitle">NEW 주목받는 신작</h6>
                    <div id="slider-div">
                    	<c:forEach begin="0" end="9" items="${newBookList }" var="book">
	                    <div class="img-wrapper"><a href="/book/detail/${book.b_code }"><img src="${book.b_img }" alt=""></a></div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
         </div>
        
        <div id="new-section">
            <!-- stlye 은 slick 영역 확인용 -->
            <div class="carousel-container">
                <h6 class="subTitle">스테디셀러</h6>
                <div id="slider-div2">
                	<c:forEach items="${ranBookList }" var="book">
	                	<div class="img-wrapper"><a href="/book/detail/${book.b_code }"><img src="${book.b_img }" alt=""></a></div>
                	</c:forEach>
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
                <h3 class="question-head">자주 묻는 질문을 확인해보세요.</h3>
                <ul>
                  <li>
                    <input type="checkbox" checked> 
                    <i></i>
                    <h2 style="font-weight: 500;">Q. 주문취소시 환불은 어떻게 되나요?</h2>
                    <p> 결제수단별 환불 안내 <br>
						(1) 신용카드 (간편결제 포함) <br>
						- 전체 취소 : 카드사 매입전은 당일 취소되며, 카드사 매입 후는 카드사에 따라 2일~ 최대 2주(공휴일 제외) 소요됩니다. <br>
						- 부분 취소 : 카드사 매입 후 취소 처리되며, 카드사에 따라 2일~ 최대 2주(공휴일 제외) 소요됩니다. (당일 부분취소한 경우도 동일함) <br>
						<br>
						(2) 실시간 계좌이체 <br>  
						- 전체 취소 : 승인한 당일 실시간 계좌이체 시, 결제한 본인 계좌로 입금됩니다.  <br>
						- 부분 취소 : 익일에 실시간 계좌이체 시, 결제한 본인 계좌로 입금됩니다.
						</p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">Q. 주문하면 얼마 만에 받아볼 수 있나요?</h2>
                    <p>
                    고객님께서 주문하신 상품을 실제 받으시는 날은 "예상출고일 + 배송일"입니다. <br>
					'예상출고일'이란 근무일 기준으로 도서가 준비되는 시간 만을 안내하는 것이며, 배송시간은 예상출고일 외 택배를 통해 고객님께 실제 배달되는 기간을 말합니다. <br>
					'출고예정일'은 상품에 따라 준비기간이 다르며 배송 시간은 지역에 따라 약간씩 다르나 보통 1~3일정도 소요됩니다. (도서산간지역은 최대 7일 소요) <br> 
					<br>
					* 예상출고일은 영업일 기준으로 산정되며, 일요일과 공휴일 및 기타 휴무일에는 배송되지 않습니다. (우체국 배송은 토요일 휴무로 배송 불가함) <br>	
					* 주문한 상품의 당사에 재고가 없을 때는 거래처로 다시 주문 요청한 후 출고되므로 3∼7일내외 정도 더 소요됩니다. <br>
					* 천재지변 등의 불가항력적 사유로 인한 배송 지연은 그 해당기간 동안의 배송소요 기간에서 제외됩니다. <br>
                    </p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">Q. 인터넷 주문도서의 반품이 가능한가요?</h2>
                    <p>
                    	1.고객님의 변심 또는 주문오류로 인한 반품신청일때,
                    	타 도서로의 교환이 불가하며, <br>
						교보문고에서 주문하신 상품의 경우, 반품 교환이 가능한 종류에 한해 상품을 수령하신 날로부터 <br>7일 이내 반품신청이 가능합니다.
						반송료는 고객님께서 부담하시게 됩니다.  <br>
						단, 반품하실 도서는 사용하지 않고, 상품 자체의 비닐 래핑이 되어있는 책은 비닐 래핑은 벗기지 않으며, <br>
						음반의 경우 비닐개봉을 하지 않은 상태로 재생하지 않는 상태일 때 가능합니다. <br>
						<br>
						2. 주문하신 상품의 결함 및 계약내용과 다를 경우, 문제점 발견 후 30일 이내 반품신청이 가능합니다. <br>
					</p>
                  </li>
                  <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <h2 style="font-weight: 500;">Q. 현금영수증은 어떻게 신청할 수 있나요?</h2>
                    <p>
                    인터넷으로 현금성결제수단(온라인송금,실시간계좌이체,예치금 결제)으로 주문하실 경우 주문과정의 결제 화면에서 결제방법 선택 하시면 휴대폰번호나 카드번호,사업자등록번호를 입력하시는 것으로 직접 신청하실 수 있습니다. <br> 
                    ※ 현금영수증의 경우 현금영수증 발급시기는 금권이 오고간 시기 혹은 현금을 입금한 시기에 발생되어야 하며, 발급없이 지나간 건에 대해서는 발급받으실 수 없습니다. <br>
                    인터넷 주문시에는 결제한 익일 국세청에 신고되어 2~3일 내에 발행내역을 확인할 수 있습니다. *현금영수증을 발행한 경우 계산서 발급이 안되오니 이 점 참고하시길 바랍니다.
                    </p>
                  </li>
                  <br>
                  <br>
                  <br>
                </ul>
              </div>
              <button type="button" class="btn btn-secondary btn-floating btn-lg" id="btn-back-to-top"><i class="fas fa-arrow-up"></i></button>
              <button type="button" class="btn btn-secondary" id="btn-back-to-top2" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"><i class="fas fa-regular fa-comment fa-xl"></i></button>
        </div>
        <div>
        </div>
        	

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <iframe src="${pageContext.request.contextPath}/book/chat" width="480" height="500" frameborder="0" allowtransparency="true"></iframe> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
  </div>
</div>
        
        </div>
        <div id="footer">
            <my:footer></my:footer>
        </div>
        
        
        
    
<!-- script  -->	
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