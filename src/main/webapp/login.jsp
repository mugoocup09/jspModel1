<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#sub {
	background-color: #1BBC9B;
	margin-bottom: 30px;
	color: white;
	font-size: 25px;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: #9B9B9B;
	font-size: 12px;
}
</style>
<title>Insert title here</title>
</head>
<body>


	<div class="center">
		<form action="loginAf.jsp" method="post">


		<input type="text" id="id" class="in" name="id" size="20" placeholder="ID">
		<input type="password" class="in" id="pwd" size="20" placeholder="PASSWARD">
			<input type="checkbox" id="chk_save_id">id 저장 <br>
			<input type="submit" value="login" id="sub">
			<a href="regi.jsp" style="font-size: 30px">회원가입</a>
				
		</form>
	</div>

	<script type="text/javascript">
		/* 	
		
		 cookie : id저장, pw저장 == String 	    client
		 session : login한 정보 == Object 		server 
		 */

		let user_id = $.cookie("user_id");

		if (user_id != null) { // 저장한 id가 있을때
			$("#id").val(user_id);
			$("#chk_save_id").prop("checked", true);

		}

		$("#chk_save_id").click(function() {
			if ($("#chk_save_id").is(":checked") == true) {

				if ($("#id").val().trim() == "") {
					alert("ID를 입력해주십시오");
					$("#chk_save_id").prop("checked", false);

				} else {
					// cookie를 저장

					$.cookie("user_id", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
				}

			} else {
				$.removeCookie("user_id", {
					path : './'
				});
			}

		});
	</script>



</body>
</html>