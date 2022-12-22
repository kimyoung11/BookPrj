<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업 공지사항</title>
</head>
<style>
.mainPopup img{
	margin-bottom: 20px;
}
.mainPopup:before {
	display:block; 
	content:""; 
	position:fixed; 
	left:0; 
	top:0; 
	width:100%; 
	height:100%; 
	background:rgba(0,0,0,.5); 
	z-index:9000;
}
.mainPopup .mainBox{
	z-index:10000;   
	position:fixed; 
	left:50%; 
	top:50%; 
	transform:translate(-50%, -50%);
	 padding:10px; 
	 background:#f5faf3; 
	 border-radius:5px;
}
.mainPopup .mainBox .popup-title{
	margin-bottom:10px; 
	padding-bottom:10px; 
	font-weight:600; 
	border-bottom:1px solid #d9d9d9;
}
.mainPopup .mainBox #todayClose{
	margin-left: -8px;
}
.mainPopup div{
	display: inline;
}
.mainPopup form{
	margin-top : 5px;
	font-size:14px; 
	font-weight:600;
	weight: 100%;
	height : 30px;
	line-height:30px;
	float: right;
}
.mainPopup #popup_close{
	font-size:20px; 
	font-weight:600; 
	width: 40px; 
	height : 30px;
	color:black; 
	float: right; 
	line-height:30px; 
	text-align : center;
	text-decoration:underline;
}
.mainPopup a{
	text-decoration : none;
	color : black;
	width: 50px;
	height : 40px;
}
.mainPopup #popupClose{
	border: none;
    background: none;
}
</style>
<body>
	<div class="mainPopup" id="main_popup" style="visibility: visible;">
		<div class="mainBox">
			<div id="popup_close">
					<button type="button" class="btn_close" id="popupClose"><i class="fa-solid fa-xmark"></i></button>
				</div>
			<div class="popup-content">
				<p>
					<img src="${pageContext.request.contextPath}/content/popup.png" width=350 height=500 usemap="#popup" alt="popup_image">
				</p>
			</div>
			<form name="popup_form">
				<div id="check">
					<input type="checkbox" name="popupCheck" value="checkbox" id="popupCheck">
					<label for="popupCheck" id="todayClose">&nbsp&nbsp오늘 하루 열지 않기</label>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
function setCookie(name, value, expiredays){
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
function closePop(){
	if(document.popup_form.popupCheck.checked){
		setCookie("maindiv", "done", 1);
	}
	document.all['main_popup'].style.visibility = "hidden";
}
var cookiedata = document.cookie;
if(cookiedata.indexOf("maindiv=done") < 0) {
	document.all['main_popup'].style.visibility = "visible";
} else {
	document.all['main_popup'].style.visibility = "hidden";
}
document.querySelector("#popupClose").addEventListener("click", function(){
	closePop();
});
</script>
</html>