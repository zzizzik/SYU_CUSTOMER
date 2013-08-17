<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR" import="java.util.*,java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<% String CONTEXT_NAME = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
 String encType = "EUC-KR";
 int maxSize = 1024 * 1024 * 5;
 String saveFolder = "ImageFolder";
 ServletContext context = getServletContext();
 String realFolder = context.getRealPath(saveFolder);
 System.out.println(realFolder);
 try {
  MultipartRequest multi = null;
  multi = new MultipartRequest(request, realFolder, maxSize,
    encType, new DefaultFileRenamePolicy());
  
  Enumeration params = multi.getParameterNames();
      
  while (params.hasMoreElements()) {
   String name = (String) params.nextElement();
   String value = multi.getParameter(name);
  }
  
  Enumeration files = multi.getFileNames();
  while (files.hasMoreElements()) {
   String name = (String) files.nextElement();
   String filename = multi.getFilesystemName(name);
   String original = multi.getOriginalFileName(name);
   String type = multi.getContentType(name);
   File file = multi.getFile(name);
   out.println("�Ķ���� �̸� : " + name + "<BR>");
   out.println("���� ���� �̸� : " + original + "<BR>");
   out.println("����� ���� �̸� : " + filename + "<BR>");
   out.println("���� Ÿ�� : " + type + "<BR>");
   if (file != null) {
    out.println("ũ��" + file.length());
    out.println("<BR>");
   }
   
   if(original !=null || filename != null){
    System.out.println("���� �̸� ~~~"+filename);
    StringBuffer sb = new StringBuffer(saveFolder+"/"+filename);
    application.setAttribute("key",sb);
    //response.sendRedirect("upload.jsp"); 
   }
  }  
 } catch (Exception e) {
  System.out.println(e);
 } finally {
 }
%>
 <form name="view">
		<%
			ArrayList<StringBuffer> al = new ArrayList<StringBuffer>();
		%>
		<%
			StringBuffer img = (StringBuffer) application.getAttribute("key");
			System.out.println("�̹������ "+img);
			if (img != null) {
				al.add(img);
		%>
		<table border="1" cellspacing="1" cellpadding="1">
			<tr>
				<%
					int j = 0;
						for (int i = 0; i < al.size(); i++) {
							j++;
							if (i != 0 && j % 6 == 0) {
				%>
			
			<tr>
				<%
					j = 1;
							}
				%>
				<td><a href="javascript:openWin('<%=al.get(i)%>')"> <img
						width="500" height="500" src="<%=CONTEXT_NAME %>/<%=al.get(i)%>">
				</a></td>
				<%
					if (i != 0 && j % 6 == 0) {
				%>
			</tr>
			<%
				j = 1;
						}
					}
			%>
			</tr>
		</table>
		<%
			}
		%>
	</form>
</body>
</html>
 