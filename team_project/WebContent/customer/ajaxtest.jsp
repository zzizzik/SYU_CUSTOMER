<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<form id="htmlForm" action="html-echo.jsp" method="post"> 
    Message: <input type="text" name="message" value="Hello HTML" /> 
    <input type="submit" value="Echo as HTML" /> 
    </form>
    <br>
	<div id = "htmlExampleTarget"></div>

</body>
</html>