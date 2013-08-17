<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String CONTEXT_NAME = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
<!-- CSS -->
<link type ="text/css" rel="stylesheet" href="<%=CONTEXT_NAME %>/css/main/main.css">
	
<style type="text/css">
body {
	width: 100%;
	background-image: url('<%=CONTEXT_NAME %>/images/main/background.png');
	background-repeat: repeat repeat;
}
</style>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script'
	rel='stylesheet' type='text/css'>	
</head>
<body style="overflow-y: scroll; overflow-x: auto;">
	<!--  전체영역 -->
	<div class="wrap">
		<!-- 헤더영역 -->
		<div class="header">
			<jsp:include page="/piece/header.jsp" />
		</div>
		<div class="headspace"></div>

			<!-- 오른쪽 메뉴영역 : 로그인 검색 인기검색어 -->
			<div class="right">
				<jsp:include page="/piece/right.jsp" />
			</div>

			<!-- 바디영역 -->
		<div class="content">
			<jsp:include page="./p_myInfo.jsp"></jsp:include>	

		</div>

		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="/piece/footer.jsp" />
			</div>
		</div>
	</div>

</body>	
</html>