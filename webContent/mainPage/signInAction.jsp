<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="list.MemberDAO" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	id = new MemberDAO().signIn(id, pw);
	if(id!=null){
		session.setAttribute("sid", id);
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("index.jsp?signIn=1");
	}
%>