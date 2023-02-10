<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>
	
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-color: #1BBC9B;
}

.center {
	margin: auto;
	width: 60%; 
	border-radius : 10px;
	padding: 20px;
	text-align: center;
	background-color: #EEEFF1;
}

input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	border: none;
}

.in {
	margin-bottom: 10px
}

.sub {
	width : 30%;
	background-color: #1BBC9B;
	margin-bottom: 30px;
	color: white;
	font-size: 16px;
	cursor: pointer;
}


</style>

</head>
<body>

<h2>회원가입</h2>


<div class="center">

<form action="reifAf.jsp" method="post">


		<input type="text" name = "id" id = "id" size="20" class="in" placeholder="ID"><br>
		<p id="idcheck" style="font-size: 8px" ></p>
		<input type="button" id = "idChkBtn" value="id확인" class = "sub">



		<input type="text" name="pwd" id = "pwd" size="20" class="in" placeholder="PASSWORD">




	<input type="text" name="name" size="20" class="in" placeholder="NAME">


		<input type="email" name= "email" size="20" class="in" placeholder="ex)email@gmail.com">


	<input type="submit" value="회원가입" class = "sub">


</form>


</div>


<script type="text/javascript">
$(document).ready(function() {
	$("#idChkBtn").click(function() {
			
		// id의 빈칸을 조사 !
		
		$.ajax({
			type:"post",
			url:"idcheck.jsp",
			data:{ "id": $("#id").val() },
			
			success : function(msg){
				// alert("suc");
				//alert(msg.trim());
				
				if(msg.trim() == "yes"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다");
					
				} else {
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val("");
				}
			},
			error : function(){
				alert("fail");
			}
			
			
		});
		
		
	});
});



</script>

</body>
</html>