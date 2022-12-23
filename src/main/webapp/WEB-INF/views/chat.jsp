<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
        rel="stylesheet">
<style>
	 * {
        font-family: 'Noto Sans KR', sans-serif;

    }
</style>
<body>

		

    	문의사항
    	<div class="">
	        <textarea id="messageWindow" rows="10" cols="50" readonly="readonly"></textarea>
	        <br/>
	        <input id="inputMessage" type="text" onkeyup="if(window.event.keyCode==13){send()}"/>
	        <input type="submit" value="send" onclick="send()"/>
    	</div>
</body>
    <script type="text/javascript">
    
    	const ctx = "${pageContext.request.contextPath}";
        var textarea = document.getElementById("messageWindow");
        //endpoint로 데이터 넘어가
        var webSocket = new WebSocket('${ctx}/book/websocket');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    
    //메시지 받기
    function onMessage(event) {
    	console.log(event);
        textarea.value += event.data + "\n";
    }
    
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value); //데이터를 큐에 등록
        inputMessage.value = "";
    }
    
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
  </html>