<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<% String CONTEXT_NAME = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function openWin(imgAddr) {
		var f = document.view;
		//var url = "image123.jsp?addr=" + imgAddr;	
		//���Ȼ� ��Ʈ�ѷ� �̿�����
		alert(imgAddr);
		var url = "<%=CONTEXT_NAME%>/"+imgAddr;
		//http://localhost:8070/upload/ImageFolder/Lighthouse.jpg
		var win = window.open(url, "win",
				"width=570,height=1200,scrollbars=yes,toolbar=yes");
	}
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
//prepare the form when the DOM is ready 
$(document).ready(function() { 
	
    // bind form using ajaxForm 
    $('#htmlForm').ajaxForm({ 
        // target identifies the element(s) to update with the server response 
        target: '#htmlExampleTarget', 
         // success identifies the function to invoke when the server response 
        // has been received; here we apply a fade-in effect to the new content 
        success: function() {
        	
             $('#htmlExampleTarget').fadeIn('slow'); 
        } 
    }); 
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε� ����</title>
</head>
<body>
	
	<form id="htmlForm" action="./p_imageView.jsp" enctype="multipart/form-data" method="post">
		�̹��� �ø��� : <input type="text" name="imgName" size="5"> 
		<input type="file" name="uploadImg" value="����ã��">
		<input type="submit" value="�ø���">
	</form>
	<div id = "htmlExampleTarget">���⿡���Ϳ�</div>
		
	


</body>
</html>