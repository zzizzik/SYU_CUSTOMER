<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% String CONTEXT_NAME = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="<%=CONTEXT_NAME %>/css/main/main.css">
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
	<!--  ��ü���� -->
	<div class="wrap">
		<!-- ������� -->
		<div class="header">
			<jsp:include page="/piece/header.jsp" />
		</div>
		<div class="headspace"></div>

			<!-- ������ �޴����� : �α��� �˻� �α�˻��� -->
			<div class="right">
				<jsp:include page="/piece/right.jsp" />
			</div>

			<!-- �ٵ𿵿� -->
			<div class="content"><jsp:include page="p_join.jsp" />
			</div>

		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="/piece/footer.jsp" />
			</div>
		</div>
	</div>

</body>
</html>