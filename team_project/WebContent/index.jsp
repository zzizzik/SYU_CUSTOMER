<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<% String CONTEXT_NAME = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SYORRY</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="css/main/main.css">
<link type="text/css" rel="stylesheet" href="css/main/jquery.galleryview-3.0-dev.css" />
<style type="text/css">
body {
	width: 100%;
	background-image: url(images/main/background.png);
	background-repeat: repeat repeat;
}
</style>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
<!-- �̹��� �����ִ� �ڹٽ�ũ��Ʈ -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- �̹��� �̵� �ð� -->
<script type="text/javascript" src="js/main/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="js/main/jquery.galleryview-3.0-dev.js"></script>
<script type="text/javascript" src="js/main/main.js"></script>
</head>

<body style="overflow-y: scroll; overflow-x: auto;">
	<!--  ��ü���� -->
	<div class="wrap">
		<!-- ������� -->
		<div class="header">
			<jsp:include page="piece/header.jsp" />
		</div>
		<div class="headspace">
		</div>
		
	
		<!-- ������ �޴����� : �α��� �˻� �α�˻��� -->
		<div class="right">
			<jsp:include page="piece/right.jsp"/>
		</div>


		<!-- �ٵ𿵿� -->
		<div class="content">
			<!-- ����Ʈ�丮 ����ֱ� -->
			<div class="images">
				<table border="0" align="center" width="90%">
					<tr>
						<td colspan="3" align="center">
							<ul id="myGallery">
								<li><img data-frame="images/main/main.jpg" src="images/main/main.jpg"
									title="Best1" data-description="�����Ľ�Ÿ" />
								<li><img data-frame="images/main/main2.jpg" src="images/main/main2.jpg"
									title="Best2" />
								<li><img data-frame="images/main/main3.jpg" src="images/main/main3.jpg"
									title="Best3" />
								<li><img data-frame="images/main/main4.jpg" src="images/main/main4.jpg"
									title="Best4" />
								<li><img data-frame="images/main/main5.jpg" src="images/main/main5.jpg"
									title="Best5" />
							</ul>
						</td>
					</tr>
					<tr style='height: 35px;'>
						<td>&nbsp;</td>
					</tr>
					<!-- Ŀ�´�Ƽ �Խ��� ��� -->
					<tr align="center">
						<td>
							<table border="0" width="280px">
								<tr>
									<td><font class="subfont">Meet Here!</font></td>
								</tr>
								<tr>
									<td><img src="images/main/fork.png"></td>
								</tr>
								<tr>
									<td><a href="#">���⿡ �ֽű��� �ۿðſ���</a></td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0" width="280px">
								<tr>
									<td><font class="subfont">Free board</font></td>
								</tr>
								<tr>
									<td><img src="images/main/shaker.png"></td>
								</tr>
								<tr>
									<td><a href="#">���⿡ �ֽű��� �ۿðſ���</a></td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0" width="280px">
								<tr>
									<td><font class="subfont">Q&A</font></td>
								</tr>
								<tr>
									<td><img src="images/main/spoon.png"></td>
								</tr>
								<tr>
									<td><a href="#">���⿡ �ֽű��� �ۿðſ���</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- footer���� -->
		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="piece/footer.jsp"/>
			</div>
		</div>
			
	</div>
</body>
</html>