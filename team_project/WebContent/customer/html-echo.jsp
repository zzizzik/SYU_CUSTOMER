<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("html/text charset=utf-8");
	String msg = request.getParameter("message");
	
	out.write("<div style='background-color:#ffa; padding:20px'>"+msg+"</div>");
%>
