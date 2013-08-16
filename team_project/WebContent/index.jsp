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
<!-- 이미지 보여주는 자바스크립트 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- 이미지 이동 시간 -->
<script type="text/javascript" src="js/main/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="js/main/jquery.galleryview-3.0-dev.js"></script>
<script type="text/javascript" src="js/main/main.js"></script>
</head>

<body style="overflow-y: scroll; overflow-x: auto;">
	<!--  전체영역 -->
	<div class="wrap">
		<!-- 헤더영역 -->
		<div class="header">
			<jsp:include page="piece/header.jsp" />
		</div>
		<div class="headspace">
		</div>
		
	
		<!-- 오른쪽 메뉴영역 : 로그인 검색 인기검색어 -->
		<div class="right">
			<jsp:include page="piece/right.jsp"/>
		</div>


		<!-- 바디영역 -->
		<div class="content">
			<!-- 베스트요리 띄워주기 -->
			<div class="images">
				<table border="0" align="center" width="90%">
					<tr>
						<td colspan="3" align="center">
							<ul id="myGallery">
								<li><img data-frame="images/main/main.jpg" src="images/main/main.jpg"
									title="Best1" data-description="빠네파스타" />
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
					<!-- 커뮤니티 게시판 출력 -->
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
									<td><a href="#">여기에 최신글을 퍼올거예요</a></td>
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
									<td><a href="#">여기에 최신글을 퍼올거예요</a></td>
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
									<td><a href="#">여기에 최신글을 퍼올거예요</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- footer영역 -->
		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="piece/footer.jsp"/>
			</div>
		</div>
			
	</div>
</body>
</html>