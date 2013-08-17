<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<% String CONTEXT_NAME = request.getContextPath(); %>
<script type="text/javascript">
	function openWin(imgAddr) {
		var f = document.view;
		//var url = "image123.jsp?addr=" + imgAddr;	
		//보안상 컨트롤러 이용하자
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
/* $(document).ready(function() { 
	
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
}); */
</script>
	<form id="htmlForm" action="./p_imageView.jsp" enctype="multipart/form-data" method="post">
		사진 업로드 : <input type="text" name="imgName" size="5"> 
		<input type="file" name="uploadImg" value="파일찾기">
		<input type="submit" value="올리기">
	</form>
	<div id = "htmlExampleTarget">여기에나와요</div>	
	