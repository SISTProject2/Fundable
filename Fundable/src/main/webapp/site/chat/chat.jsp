<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row1{
	width: 800px;
	height: 750px;
}
#chatArea{
	height: 250px;
	overflow-y: auto;
	border: 1px solid black;
}
.container{
	margin-top: 130px;
}
.row{
	margin: 0px auto;
	width: 100%;
}
.ballon{
	position: relative;
	margin-left: 40px;
	width: fit-content;
	height: auto;
	background: white;
	border-radius: 10px;
	padding: 8px;
}
.ballon:after{
	content: "";
	border-top: 16px solid white;
	border-left: 16px solid transparent;
	border-right: 0px solid transparent;
	border-bottom: 0px solid transparent;
	position: absolute;
	top: 0px;
	left: -10px;
}
body {
	font-family: 'Nanum Gothic';
}

.join_container {
    width: 100%;
    max-width: 600px;
    margin: 0px auto;
}

.join_title {
    text-align: center;
    margin: 50px 0 20px 0;
}

.joinmember {
    font-size: 38px;
    padding: 10px 0;
    display: inline;
    margin-right: 75px;
    padding: 10px;
    text-decoration: underline;
    text-underline-position: under;
    text-decoration-color: #a3030a;
}

.join_logo {
    font-family: SBAggroL;
    letter-spacing: 7px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
function connection(){		// 연결
	// websocket => 웹에서 연결이 되게 만드는 소프트웨어
	websocket=new WebSocket("ws://localhost:8080/web/site/chat/chat-ws");	// ChatServer 클래스의 @ServerEndpoint("/chat/chat-ws")
	websocket.onopen=onOpen;	// callback(시스템에 의해 자동으로 실행) => 연결되었을 때 자동으로 onOpen 함수 호출
	websocket.onclose=onClose;
	websocket.onmessage=onMessage;
}
function onOpen(event){		// 연결되었을 때 처리
	alert("채팅 서버와 연결되었습니다");
}
function onClose(event){	// 퇴장시 처리
	alert("채팅 서버와 연결이 종료되었습니다")
}
function onMessage(event){	// 채팅 메세지 전송시
	let data=event.data;
	console.log("1:"+data);
	if(data.substring(0,5)=="name:"){
		appendMessage2(data.substring(5));
		console.log(data.substring(5));
	}
	if(data.substring(0,4)=="msg:"){
		appendMessage(data.substring(4));
		console.log(data.substring(4))
	}
}
function disconnection(){	// 퇴장 버튼 클릭시
	websocket.close();	// onclose 함수 호출 (websocket.onclose)
}
function send(){
	let name=$('#name').val();
	if(name.trim()==""){
		$('name').focus();
		return;
	}
	
	let msg=$('#sendMsg').val();
	if(msg.trim()==""){
		$('#sendMsg').focus();
		return;
	}
	
	websocket.send("name:"+name);	// onmessage 함수 호출
	websocket.send("msg:"+msg);	// onmessage 함수 호출
	$('#sendMsg').val("");	// 채팅 전송 후 채팅 입력 창 공백
	$('#sendMsg').focus();
}
function appendMessage2(name){	// 채팅 문자열 추가
	$('#recvMsg').append("<div style=\"width: fit-content; max-width: 70%; margin-left: 39px; margin-top: 10px; height: auto; word-break: break-all; margin-bottom: 5px;\">"+name+"</div>");
	let ch=$('#chatArea').height();
	let m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);	// 스크롤 위치 지정 => 스크롤 위로 올라가는 것 막기(스크롤 제일 밑으로)
} 
function appendMessage(msg){	// 채팅 문자열 추가
	console.log("appendmsg:"+msg);
	$('#recvMsg').append("<div class=\"ballon\">"+msg+"</div>");
	let ch=$('#chatArea').height();
	let m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);	// 스크롤 위치 지정 => 스크롤 위로 올라가는 것 막기(스크롤 제일 밑으로)
}
$(function(){
	$('#startBtn').click(function(){
		connection();		
	})
	
	$('#endBtn').click(function(){
		disconnection();
		location.href="../funding/home.do"
	})

	$('#sendBtn').click(function(){
		send();
	})
	
	$('#sendMsg').keydown(function(key){
		if(key.keyCode==13){	// 엔터키 눌렀을 때
			send();
		}
	})
}) 
</script>
</head>
<body>
  <div class="container">
    <div class="row row1">
     <div class="wrapper">
     <div class="join_container">
			<div class="join_title">
				<!-- <div class="join_logo" style="font-size: 18px; letter-spacing: 10px; margin-left:15px;">FUNDABLE</div> -->
			</div>
      <table class="table">
        <tr>
          <td style="border-top: none; text-align: center; font-size: 16px;">
            <div class="joinmember" style="display: inline; margin-right: 50px;">CHATTING</div>
            <input type=text id="name" size=15 class="input-sm">
            <input type=button id="startBtn" value="입장" class="btn btn-sm btn-danger" style="background-color: #111111; border-color: #111111;"> 
            <input type=button id="endBtn" value="퇴장" class="btn btn-sm btn-primary" style="background-color: #a3030a; border-color: #a3030a;"> 
          </td>
        </tr> 
        <tr>
          <td style="text-align: -webkit-center; padding-bottom: 0px; border-top: none;">
            <div id="chatArea" style="width: 520px; height: 400px; text-align: left; background-color: #f0f2f5;">
              <div id="recvMsg" style="font-size: 14px;">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align: center; padding: 0px; border-top: none;">
            <input type="text" id="sendMsg" size=80 class="input-sm" style="width: 475px; border-top: none; height: 40px;">
            <input type="image" src="../css/img/send2.png" id="sendBtn" class="btn btn-sm btn-success" style="width: 45px; margin: 0px; height: 40px; border-width: 2px; border-style: inset; border-color: rgb(118 118 118); background-color: #ffffff; border-top: none; border-left: none;">
          </td>
        </tr>
      </table>
      </div>
      </div>
    </div>
  </div>
</body>
</html>