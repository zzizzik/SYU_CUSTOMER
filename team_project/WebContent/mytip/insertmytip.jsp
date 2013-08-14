<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 팁을 확인하세요</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="css/main/main.css">
<style type="text/css">
body {
	width: 100%;
	background-image: url(images/main/background.png);
	background-repeat: repeat repeat;
}
</style>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script'
	rel='stylesheet' type='text/css'>
</head>
<body style="overflow-y: scroll; overflow-x: auto;">
<% String CONTEXT_NAME = request.getContextPath(); %>
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
			<!-- 게시판 -->
			<form method="post" name="boardInsert"
				action="<%=CONTEXT_NAME%>/FrontController?action=insert">
				<table border="0" width="700px" bgcolor="#FFFFFF" align="center">
					<tr>
						<td colspan="2"><img src="<%=CONTEXT_NAME%>/images/naver/write_bi.gif"></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<!-- 상단 -->
					<tr>
						<th align="left">카테고리</th>
						<td><select name="myTipCategory" style="width: 156px">
								<option>삼육대학교</option>
								<option>사진게시판</option>
								<option>자료게시판</option>
								<option>공부게시판</option>
						</select> </td>
					</tr>
					<tr>
						<th align="left">제목</th>
						<td><input type="text" name="boardTitle" value="포스트 제목을 입력하세요"
							class="text400" /></td>
					</tr>
					<tr>
						<th align="left">닉네임</th>
						<td><input type="text" name="userNick" value=""
							class="text400" /></td>
					</tr>
					<!-- 내용입력 -->
					<tr>
						<td colspan="2" align="center"><textarea id="textbox"
								name="boardContent" cols="93" rows="28"></textarea></td>
					</tr>
					<tr>
					<tr>
						<td align="center" colspan="2"><input type="image"
							src="<%=CONTEXT_NAME%>/images/naver/btn_btemporarysave.gif" /> <input
							type="image" src="<%=CONTEXT_NAME%>/images/naver/btn_bpreview.gif" />
							<input type="image"
							src="<%=CONTEXT_NAME%>/images/naver/btn_bconfirm.gif" /></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="/piece/footer.jsp" />
			</div>
		</div>
	</div>

</body>
</html>