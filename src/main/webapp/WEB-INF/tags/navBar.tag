<%@ tag language="java" pageEncoding="UTF-8"%>


<!-- header --> 
	<style>
    .wrap-1 {
      box-shadow: 0px 0px 20px grey;
      margin-bottom:40px;
    }
    
    .header-wrapper {
      width: 1200px;
      margin: 0 auto;
      z-index: 10000;
    }
   
    .main-menu {
      margin-left: 74px;
    }
    
    .login-btn {
      margin-right: 20px;
    }
    
    .icons {
      border: 1px solid silver;
      border-radius: 50px;
      padding: 15px;
      box-shadow: 0 0 5px gray;
      margin-right: 15px;
    }
    
    .icon-size {
      width: 20px;
      height: 20px;
      display: block;
    }
    
    .icon-cart,
    .icon-mypage {
      width: 20px;
      height: 20px;
    }
    .input-group-text{
    background-color: #fff;}
    </style>


<!-- header -->
      <header>
        <div class="wrap-1">
          <div class="header-wrapper">
            <div class="row pt-4">
              <div class="col-2">
                <img style="margin: auto; float: right;" src="${request.getContextPath() }/content/logo.png" alt="logo" />
              </div>
              <div class="col-sm-6">
                <div class="input-group">
                  <span class="input-group-text" id="basic-addon1"
                    >도서검색</span
                  >
                  <input
                    type="text"
                    class="form-control"
                    placeholder="검색어 입력..."
                  />
                  <button
                    class="btn btn-outline-secondary"
                    type="button"
                    id="button-addon2"
                  >
                    <i class="fa fa-search"></i>
                  </button>
                </div>
              </div>
              <div class="col-sm-3 d-flex justify-content-end">
                <span class="icons">
                  <a href="#" class="icon-size">
                    <i
                      class="fa-solid fa-basket-shopping fa-fw icon-cart"
                      title="Back"
                    ></i>
                  </a>
                </span>
                <span class="icons">
                  <a href="#" class="icon-size">
                    <i
                      class="fa-solid fa-user fa-fw icon-mypage"
                      title="Back"
                    ></i>
                  </a>
                </span>
              </div>
            </div>

            <div class="row mt-1 pt-2 pb-3">
              <div class="col-1"></div>
              <div class="col-6 main-menu">
                <div class="row text-end">
                  <div class="col"><h5>전체도서</h5></div>
                  <div class="col"><h5>최신신작</h5></div>
                  <div class="col"><h5>베스트</h5></div>
                  <div class="col"><h5>이벤트</h5></div>
                  <div class="col"><h5>고객센터</h5></div>
                </div>
              </div>
              <div class="col-sm-3 d-flex justify-content-end">
                <div class="login-btn"><a href="#">로그인</a></div>
                <div class=""><a href="#">회원가입</a></div>
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- header-end -->