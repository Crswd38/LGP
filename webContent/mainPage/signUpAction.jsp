<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="list.MemberDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("UTF-8");
 	String uploadDir = "C:/Users/WISA/Desktop/team_project/LGP/webContent/profileImage";
 	
	int maxSize = 1024 * 1024 * 5;
	
	try{
		MultipartRequest multi = new MultipartRequest(request, uploadDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		String id = multi.getParameter("id");
		String name = multi.getParameter("name");
		String pw = multi.getParameter("pw");
		String profile = multi.getFilesystemName("profile");
		
		new MemberDAO().signUp(id, name, pw, profile);
		response.sendRedirect("index.jsp");
		
	}catch(Exception e){
		out.write("업로드 용량 오류"+e.getMessage());
	}
%>