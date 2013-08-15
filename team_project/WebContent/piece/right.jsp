<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String CONTEXT_NAME = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>right menu</title>
<script>
	function loginSubmit(){
		alert("test");
		document.getElementById("loginForm").submit();
		return true;		
	}
</script>
<script>
	var myVar = setInterval(function() {
		myTimer()
	}, 1000);

	function myTimer() {
		var d = new Date();
		var t = d.toLocaleTimeString();
		document.getElementById("timmer").innerHTML = (d.getMonth() + 1) + "월"
				+ d.getDate() + "일" + t;
	}
</script>
</head>
<body>
 <!--// 로그인 후 시작 -->
 <c:choose>
 <c:when test="${sessionScope.userId != null}">
     <c:choose>
      <%-- 관리자 --%>
      	<c:when test='${sessionScope.userGrade=="A"}'>
		  	회원전부조회		    
 		</c:when>
 		<c:otherwise> 
 		<%-- 회원 --%>
 		<div class="login">
		<form action="<%=CONTEXT_NAME %>/CustomerController?action=logout" method="post" id="logoutForm" name="logoutForm">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="loginform" >
				<tr>
					<td height="122" align="center" bgcolor="#FAFFD1">
						<table width="270" border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="50px" height="31" align="center">별명</td>
								<td>
								${sessionScope.userNick}
								</td>
								<td width="70px" rowspan="2" align="center"><a href='#' id='btn' class='button' onclick='document.logoutForm.submit(); return true;'>로그아웃</a></td>
							</tr>
							<tr>
								<td width="50px" height="31" align="center">등급</td>
								<td>
								${sessionScope.userGrade}
								</td>
							</tr>
							<tr>
								<td width="40px" height="27" colspan="3" align="center"><font size="2"><a href="<%=CONTEXT_NAME %>/customer/myInfo.jsp">내 정보</a>
										&nbsp;&nbsp; <a href="#">즐겨찾기</a>/<a href="#">랭킹보기</a></font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			</div>
		  	
 		</c:otherwise>
 	</c:choose>
 </c:when>
 <c:otherwise>
 	<%-- 비회원 --%>
 	<div class="login">
		<form action="<%=CONTEXT_NAME %>/CustomerController?action=login" method="post" id="loginForm" name="loginForm">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="loginform" >
				<tr>
					<td height="122" align="center" bgcolor="#FAFFD1">
						<table width="270" border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="50px" height="31" align="center">ID</td>
								<td>
								<input name="userId" type="text" class="id_pw" size="24" /></td>
								<td width="70px" rowspan="2" align="center"><a href='#' class='button' onclick='document.loginForm.submit(); return true;'>로그인</a></td>
							</tr>
							<tr>
								<td width="50px" height="31" align="center">password</td>
								<td><input name="userPw" type="password"
									class="id_pw" size="24" /></td>
							</tr>
							<tr>
								<td width="40px" height="27" colspan="3" align="center"><font size="2"><a href="<%=CONTEXT_NAME%>/customer/join.jsp">회원가입</a>
										&nbsp;&nbsp; <a href="#">아이디찾기</a>/<a href="#">비밀번호찾기</a></font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			</div>
	   
 </c:otherwise>
 </c:choose>
  <!-- 로그인 후 종료 // -->
	
	<!-- 검색 -->
			<div class="search">
				<input name="searchmenu" type="text" /> &nbsp;<a href='#' class='button' >검색</a>
			</div>
		<!-- 인기검색어 -->
			<div class="hotsearch" style="background-color:#FAED7D">
			존나안바껴
				<table border="0" align="left" width="250px">
					<tr>
						<td width="140px">
							<font type="맑은 고딕" color="#DA3E34"><b>인기 검색어 메뉴</b></font>
						</td>
						<td align="right">
							<font size="2" color="gray"><span id="timmer"></span></font>
													  

						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank1.png"> &nbsp; <a href="#">빠네파스타</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank2.png"> &nbsp; <a href="#">김밥</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank3.png"> &nbsp; <a href="#">김치부침개</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank4.png"> &nbsp; <a href="#">육개장</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank5.png"> &nbsp; <a href="#">미역국</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank6.png"> &nbsp; <a href="#">계란후라이</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank7.png"> &nbsp; <a href="#">김치라면</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank8.png"> &nbsp; <a href="#">샐러드]파스타</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank9.png"> &nbsp; <a href="#">참치돌솥비빔밥</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank10.png"> &nbsp; <a href="#">배고파</a></td>
					</tr>
				</table>
			</div>
</body>
</html>