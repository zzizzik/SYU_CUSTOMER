<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나만의 팁을 확인하세요</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="../css/main/main.css">
<style type="text/css">
body { width: 100%; 
	background-image: url(../images/main/background.png); background-repeat: repeat repeat;
}
</style>
<!--  자바스크립트 -->
<script type="text/javascript"> 
	function goUrl(url) {
		location.href=url;
	}
</script>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
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
				<input type="hidden" name="mode" value="W" />
				<table border="1" summary="게시판 등록 폼">
					<caption>게시판 등록 폼</caption>
					<colgroup>
						<col width="100" />
						<col width="500" />
					</colgroup>
					<tbody>
						<tr>
							<td>게시판분류</td>
							<td><select style="width:156px">
								<option>만남의 광장</option>
								<option>자유게시판</option>
								<option>Q&A</option>
								</select>
							</td>
						</tr>
						<tr>
							<th align="center">제목</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th align="center">닉네임</th>
							<th align="left">등급</th>
						</tr>
						<tr>
							<td><input type="text" /></td>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<td colspan="2"><textarea cols="93" rows="28"></textarea></td>
						</tr>
					</tbody>
				</table>
				<p>
					<input type="button" value="목록" onclick="goUrl('qnamain.jsp');" class="button"/>
					<input type="submit" value="글등록" class="button"/>
				</p>
		</div>

		<div class="footer">
			<div class="foot" align="center">
				<jsp:include page="/piece/footer.jsp" />
			</div>
		</div>
	</div>

</body>
</html>