<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="list.ListDAO" %>
<%@ page import="list.ListDTO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("UTF-8");
 	String uploadDir = "C:/Users/WISA/Desktop/team_project/LGP/webContent/gameImage";
	int maxSize = 1024 * 1024 * 5;
	
	try{
		MultipartRequest multi = new MultipartRequest(request, uploadDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		ListDAO dao = new ListDAO();
		ListDTO dto = new ListDTO();
		dto.setImage(multi.getFilesystemName("gameImage"));
		dto.setG_name(multi.getParameter("g_name"));
		dto.setExplanation(multi.getParameter("explanation"));
		dto.setUrl(multi.getParameter("url"));
		dto.setId(session.getAttribute("sid").toString());
		dao.addGame(dto);
		
		response.sendRedirect("index.jsp");
		
	}catch(Exception e){
		out.write("업로드 용량 오류"+e.getMessage());
	}
%>