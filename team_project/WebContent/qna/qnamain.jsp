<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나만의 팁을 확인하세요</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="../css/main/main.css">
<link type="text/css" rel="stylesheet" href="../css/qna.css">
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
			<h2><font class="subfont" size="30">Q&A</font></h2>
			<table border="0" width="80%" align="center">
				<tr>
					<td class="multi">
						<input type="text" id="search"/> <a href='#' class="button"><font size="2pt">검색</font></a>
					</td>
					<td class="insert">
						<a href="insertqna.jsp" class="button">글쓰기</a>
					</td>
				</tr>
			</table>
			<div class="qna">
				<table width="80%" align="center" border="0" style="border-collapse:collapse; border:1px gray solid">
					<colgroup>
						<col width="50" />
						<col width="*" />
						<col width="*" />
						<col width="90" />
						<col width="60" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="cel01">번호</th>
							<th scope="col" class="cel02">제목</th>
							<th scope="col" class="cel03">닉네임</th>
							<th scope="col" class="cel04">작성일</th>
							<th scope="col" class="cel05">조회수</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<th scope="row" class="cel01"><img src="../images/qna/ic_fix.gif"
								alt="공지" /></th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a></td>
							<td class="cel03"><img src="../images/qna/manager.gif">관리자</td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
						<tr>
							<th scope="row" class="cel01">번호</th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a>
							<font class="reply">[1]</font></td>
							<td class="cel03"><a href="#" class="menua">
							<img src="../images/qna/begginer.gif">요리초보</a></td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
						<tr>
							<th scope="row" class="cel01">번호</th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a>
							<font class="reply">[1]</font></td>
							<td class="cel03"><a href="#" class="menua">
							<img src="../images/qna/ennui.gif">요리권태기</a></td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
						<tr>
							<th scope="row" class="cel01">번호</th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a></td>
							<td class="cel03"><img src="../images/qna/intermediate.gif"><a href="#" class="menua">요리중급</a></td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
						<tr>
							<th scope="row" class="cel01">번호</th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a></td>
							<td class="cel03"><img src="../images/qna/high.gif"><a href="#" class="menua">요리고급</a></td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
						<tr>
							<th scope="row" class="cel01">번호</th>
							<td class="cel02"><a href="#">게시판 제목이 들어가는 부분입니다.</a></td>		
							<td class="cel03"><img src="../images/qna/master.gif"><a href="#" class="menua">마스터</a></td>
							<td class="cel04">2013/08/13</td>
							<td class="cel05">999</td>
						</tr>
					</tbody>
					
						<tfoot>
						<!-- 요기 페이지는 숫자 페이징 넣어요 -->
						<tr>
							<td colspan="5">
								<div class="paging">
									<a href="#" class="qnaBtn">
									<img src="../images/qna/page_first.gif" alt="첫 페이지로" border="0"/></a>
									<a href="#" class="qnaBtn">
									<img src="../images/qna/page_pre.gif" alt="이전 페이지로" border="0" /></a>
									<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
										href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
									<a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
									<a href="#" class="qnaBtn">
									<img src="../images/qna/page_next.gif" alt="다음 페이지로" border="0"/></a> 
									<a href="#" class="qnaBtn"><img src="../images/qna/page_end.gif" alt="마지막 페이지로" border="0"/></a>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- // bbs -->

		</div>
		<!-- // content -->

	</div>


	<div class="footer">
		<div class="foot" align="center">
			<jsp:include page="/piece/footer.jsp" />
		</div>
	</div>
	</div>

</body>
</html>