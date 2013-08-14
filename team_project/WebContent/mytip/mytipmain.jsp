<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ ���� Ȯ���ϼ���</title>
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
	<!--  ��ü���� -->
	<div class="wrap">
		<!-- ������� -->
		<div class="header">
			<jsp:include page="../piece/header.jsp" />
		</div>
		<div class="headspace">
		</div>
		
		<!-- ������ �޴����� : �α��� �˻� �α�˻��� -->
		<div class="right">
			<jsp:include page="../piece/right.jsp"/>
		</div>
		
		
		<!-- �ٵ𿵿� -->
		<div class="content">
			<form method="post" name="boardList" action="<%=CONTEXT_NAME %>/mytip/insertmytip.jsp">
					<table border="0" width="800px" bgcolor="#FFFFFF">
						<tr>
							<th width="40">��ȣ</th>
							<th width="300">����</th>
							<th width="80">�ۼ���</th>
							<th width="100">��� �Ͻ�</th>
							<th width="80">��ȸ��</th>
						</tr>
						<tr>
							<!-- �Խñ��� ���ڸ�ŭ �ݺ� -->
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
												<option>��ü�Ⱓ</option>
												<option>1��</option>
												<option>1��</option>
												<option>1����</option>
												<option>6����</option>
												<option>1��</option>
										</select> <select name="searchType">
												<option value="ticon">����+����</option>
												<option value="title">����</option>
												<option value="writer">���ۼ���</option>
												<option value="recontnet">��۳���</option>
												<option value="rewriter">����ۼ���</option>
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