<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="list.ListDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/main.css" rel="stylesheet">
<title>LGP</title>
<%	
	String signUp = request.getParameter("signUp");
	String signIn = request.getParameter("signIn");
	String addGame = request.getParameter("addGame");
	String idx = request.getParameter("idx");
	String search = request.getParameter("search");
	String populer = request.getParameter("populer");
	String newer = request.getParameter("newer");
	Object sid = session.getAttribute("sid");
%>
</head>
<body>
	<header>
		<img alt="title" src="../image/joistic.png">
		<a href="index.jsp">Light Game Player</a>
		<div class="sign">
		<%if(sid==null){ %>
			<a href="index.jsp?signIn"><span class="signIn">Sign In</span></a>
			<a href="index.jsp?signUp"><span class="signUp">Sign Up</span></a>
		<%}else if(sid.toString().equals("crswd38")){ %>
			<a href="index.jsp?addGame"><span class="signIn">Add Game</span></a>
			<a href="index.jsp" onclick="location.href='logout.jsp'"><span class="signUp">Sign Out</span></a>
		<%}else{ %>
			<a href="index.jsp" onclick="location.href='logout.jsp'"><span class="signUp">Sign Out</span></a>
		<%} %>
		</div>
	</header>
	
	<nav>
		<a href="index.jsp?populer" class="populer">Populer</a>
		<a href="index.jsp?newer" class="new">New</a>
		<form action="index.jsp" method="get" class="search">
			<input type="text" name="search" class="text">
			<input type="submit" value="search" class="btn">
		</form>
	</nav>
	
	<section>
		<div class="sideA"><img alt="상미로고" src="../image/logoBlue.png"></div>
		<div class="main">
		
		<%if(signUp != null){ %>
			<div class="center"><span class="title">회원가입</span></div>
			<form action="signUpAction.jsp" method="post" class="signUp" enctype="multipart/form-data">
				<div class="profile">
					<input type="file" name="profile">
				</div>
				<div class="input">
					<label>&nbsp;&nbsp;아이디를 적어주세요.<br>
					<input type="text" name="id" required maxlength="20"></label>
					<label>&nbsp;&nbsp;닉네임을 적어주세요.<br>
					<input type="text" name="name" required maxlength="10"></label>
					<label>&nbsp;&nbsp;비밀번호를 적어주세요.<br>
					<input type="password" name="pw" required maxlength="100"></label>
				</div>
				<input type="submit" value="회원가입" class="btn">
			</form>
			
		<%}else if(signIn != null){ %>
			<div class="center"><span class="title">로그인</span></div>
			<form action="signInAction.jsp" method="post" class="signIn">
			<%if(signIn.equals("1")){ %>
				<div class="center"><span class="wrongSignIn">아이디나 비밀번호가 맞지 않습니다.</span></div>
			<%} %>
				<label>&nbsp;&nbsp;아이디를 적어주세요.<br>
				<input type="text" name="id" required></label>
				<label>&nbsp;&nbsp;비밀번호를 적어주세요.<br>
				<input type="password" name="pw" required></label>
				<input type="submit" value="로그인" class="btn">
			</form>
			
		<%}else if(addGame != null){ %>
			<form action="addGameAction.jsp" method="post" class="addGame" enctype="multipart/form-data">
				<div class="gameImage">
					<input type="file" name="gameImage">
				</div>
				<div class="input">
					<input type="text" name="g_name" required maxlength="20" placeholder="이름">
					<textarea rows="" cols="" name="explanation" placeholder="게임 설명" required></textarea>
					<input type="text" name="url" required maxlength="100" placeholder="URL">
					<input type="submit" value="게임추가" class="btn">
				</div>
			</form>
		
		<%}else if(idx != null){
			ListDAO dao = new ListDAO();
			dao.visitCount(idx);
			ResultSet rs = dao.getGameInfo(idx);
			rs.next();
		%>
			<div class="gameInfo">
				<img alt="gameImage" src="../gameImage/<%=rs.getString(7)%>" class="gameImage">
				<div class="input">
					<span class="g_name"><%=rs.getString(2)%></span>
					<span class="explanation"><%=rs.getString(3)%></span>
					<a class="url" href="../game/<%=rs.getString(6)%>">게임 들어가기-></a>
				</div>
			</div>
			
		<%}else if(search != null){
			ResultSet rs = new ListDAO().getSearchList(search);
			if(rs != null){%>
				<ul class="searchList">
				<%
				rs = new ListDAO().getSearchList(search);
				while(rs.next()){ %>
					<li>
						<a href="index.jsp?idx=<%=rs.getString(1)%>">
							<img alt="gameImage" src="../gameImage/<%=rs.getString(7)%>">
							<%=rs.getString(2)%>
						</a>
					</li>
				<%} %>
				</ul>
		<%	}else{%>
			<span>not found</span>
		<%	}
			   
		}else if(populer != null){
			ResultSet rs = new ListDAO().getPopulerList();
		%>
			<ul class="list">
			<%while(rs.next()){ %>
				<li>
					<a href="index.jsp?idx=<%=rs.getString(1)%>">
						<img alt="gameImage" src="../gameImage/<%=rs.getString(7)%>">
						<%=rs.getString(2)%>
					</a>
				</li>
			<%} %>
			</ul>
			
		<%}else if(newer != null){
			ResultSet rs = new ListDAO().getNewerList();
		%>
			<ul class="list">
			<%while(rs.next()){ %>
				<li>
					<a href="index.jsp?idx=<%=rs.getString(1)%>">
						<img alt="gameImage" src="../gameImage/<%=rs.getString(7)%>">
						<%=rs.getString(2)%>
					</a>
				</li>
			<%} %>
			</ul>
			
		<%}else{
			ResultSet rs = new ListDAO().getList();
		%>
			<ul class="list">
			<%while(rs.next()){ %>
				<li>
					<a href="index.jsp?idx=<%=rs.getString(1)%>">
						<img alt="gameImage" src="../gameImage/<%=rs.getString(7)%>">
						<%=rs.getString(2)%>
					</a>
				</li>
			<%} %>
			</ul>
		<%} %>
		</div>
		<div class="sideB"><img alt="상미로고" src="../image/logoBlue.png"></div>
	</section>
</body>
</html>