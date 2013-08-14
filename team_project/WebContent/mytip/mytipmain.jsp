<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 팁을 확인하세요</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="../css/main/main.css">
<style type="text/css">
body {
	width: 100%;
	background-image: url(../images/main/background.png);
	background-repeat: repeat repeat;
}
</style>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
</head>
<body style="overflow-y: scroll; overflow-x: auto;">
<% String CONTEXT_NAME = request.getContextPath(); %>
	<!--  전체영역 -->
	<div class="wrap">
		<!-- 헤더영역 -->
		<div class="header">
			<jsp:include page="../piece/header.jsp" />
		</div>
		<div class="headspace">
		</div>
		
		<!-- 오른쪽 메뉴영역 : 로그인 검색 인기검색어 -->
		<div class="right">
			<jsp:include page="../piece/right.jsp"/>
		</div>
		
		
		<!-- 바디영역 -->
		<div class="content">
			<form method="post" name="boardList" action="<%=CONTEXT_NAME %>/mytip/insertmytip.jsp">
					<table border="0" width="800px" bgcolor="#FFFFFF">
						<tr>
							<th width="40">번호</th>
							<th width="300">제목</th>
							<th width="80">작성자</th>
							<th width="100">등록 일시</th>
							<th width="80">조회수</th>
						</tr>
						<tr>
							<!-- 게시글의 숫자만큼 반복 -->
							<c:forEach var="list" items="${requestScope.list}">
								<tr bgcolor="#F6F6D7">
									<td>${list.boardSEQ}</td>
									<td><a href="<%= CONTEXT_NAME %>/FrontController?action=printViewView&boardSEQ=${list.boardSEQ}">${list.boardTitle}</a></td>
									<td>${list.userid}</td>
									<td>${list.boardDate}</td>
									<td>${list.boardHit}</td>
								</tr>
							</c:forEach>
						</tr>
						<tr>
							<td align="center" colspan="5">1</td>
						</tr>
						<tr>
							<td align="right" colspan="5">
							<a href="insertmytip.jsp"><input type="image"
							src="<%=CONTEXT_NAME%>/images/naver/ico-btn-write.gif"></a></td>
						</tr>
						<tr>
							<td colspan="5">
								<hr>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="5">
							<form method="post" name="multiSearch" action="#">
								<table>
									<tr>
										<td><select name="searchTerm">
												<option>전체기간</option>
												<option>1일</option>
												<option>1주</option>
												<option>1개월</option>
												<option>6개월</option>
												<option>1년</option>
										</select> <select name="searchType">
												<option value="ticon">제목+내용</option>
												<option value="title">제목만</option>
												<option value="writer">글작성자</option>
												<option value="recontnet">댓글내용</option>
												<option value="rewriter">댓글작성자</option>
										</select> <input type="image"
											src="<%=CONTEXT_NAME%>/images/naver/btn_srch.gif" align="bottom">
								</table>
								</form>
							</td>
						</tr>
					</table>
				</form>
		</div>
		
		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="../piece/footer.jsp"/>
			</div>
		</div>			
	</div>
	
</body>
</html>