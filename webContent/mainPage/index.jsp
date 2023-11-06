<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/main.css" rel="stylesheet">
<title>LGP</title>
<%	
	String signUp = request.getParameter("signUp");
	String signIn = request.getParameter("signIn");
%>
</head>
<body>

	<header>
		<img alt="title" src="../image/joistic.png">
		<span>Light Game Player</span>
		
		<div class="sign">
			<a href="index.jsp?signIn"><span class="signIn">sign in</span></a>
			<a href="index.jsp?signUp"><span class="signUp">sign up</span></a>
		</div>
	</header>
	
	<nav>
		<form action="index.jsp" method="get" class="search">
			<input type="text" name="search" class="text">
			<input type="submit" value="search" class="btn">
		</form>
	</nav>
	
	<section>
		<div class="sideA"><span>1</span></div>
		<div class="main">
	<%if(signUp != null){ %>
	
			<form action="signUp.jsp" method="post" class="signUp">
				<span class="title">회원가입</span>
				<label>&nbsp;&nbsp;닉네임을 적어주세요.<br>
				<input type="text" name="name" required></label>
				<label>&nbsp;&nbsp;이메일을 적어주세요.<br>
				<input type="email" name="email" required></label>
				<label>&nbsp;&nbsp;비밀번호를 적어주세요.<br>
				<input type="password" name="pw" required></label>
				<input type="submit" value="회원가입" class="btn">
			</form>
			
	<%}else if(signIn != null){ %>
	
			<div class="signIn">
				<div class="i"></div>
			</div>
			
	<%}//else if(){ %>
	
		<!-- <div class="i"></div>
		<a href="" class="addGameBtn"><span>게임 추가</span></a> -->
	
	<%//} %>
		</div>
		<div class="sideB"><span>1</span></div>
	</section>
	
</body>
</html>