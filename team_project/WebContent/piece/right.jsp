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
		document.getElementById("timmer").innerHTML = (d.getMonth() + 1) + "��"
				+ d.getDate() + "��" + t;
	}
</script>
</head>
<body>
 <!--// �α��� �� ���� -->
 <c:choose>
 <c:when test="${sessionScope.userId != null}">
     <c:choose>
      <%-- ������ --%>
      	<c:when test='${sessionScope.userGrade=="A"}'>
		  	ȸ��������ȸ		    
 		</c:when>
 		<c:otherwise> 
 		<%-- ȸ�� --%>
 		<div class="login">
		<form action="<%=CONTEXT_NAME %>/CustomerController?action=logout" method="post" id="logoutForm" name="logoutForm">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="loginform" >
				<tr>
					<td height="122" align="center" bgcolor="#FAFFD1">
						<table width="270" border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="50px" height="31" align="center">����</td>
								<td>
								${sessionScope.userNick}
								</td>
								<td width="70px" rowspan="2" align="center"><a href='#' id='btn' class='button' onclick='document.logoutForm.submit(); return true;'>�α׾ƿ�</a></td>
							</tr>
							<tr>
								<td width="50px" height="31" align="center">���</td>
								<td>
								${sessionScope.userGrade}
								</td>
							</tr>
							<tr>
								<td width="40px" height="27" colspan="3" align="center"><font size="2"><a href="<%=CONTEXT_NAME %>/customer/myInfo.jsp">�� ����</a>
										&nbsp;&nbsp; <a href="#">���ã��</a>/<a href="#">��ŷ����</a></font></td>
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
 	<%-- ��ȸ�� --%>
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
								<td width="70px" rowspan="2" align="center"><a href='#' class='button' onclick='document.loginForm.submit(); return true;'>�α���</a></td>
							</tr>
							<tr>
								<td width="50px" height="31" align="center">password</td>
								<td><input name="userPw" type="password"
									class="id_pw" size="24" /></td>
							</tr>
							<tr>
								<td width="40px" height="27" colspan="3" align="center"><font size="2"><a href="<%=CONTEXT_NAME%>/customer/join.jsp">ȸ������</a>
										&nbsp;&nbsp; <a href="#">���̵�ã��</a>/<a href="#">��й�ȣã��</a></font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			</div>
	   
 </c:otherwise>
 </c:choose>
  <!-- �α��� �� ���� // -->
	
	<!-- �˻� -->
			<div class="search">
				<input name="searchmenu" type="text" /> &nbsp;<a href='#' class='button' >�˻�</a>
			</div>
		<!-- �α�˻��� -->
			<div class="hotsearch" style="background-color:#FAED7D">
			�����ȹٲ�
				<table border="0" align="left" width="250px">
					<tr>
						<td width="140px">
							<font type="���� ���" color="#DA3E34"><b>�α� �˻��� �޴�</b></font>
						</td>
						<td align="right">
							<font size="2" color="gray"><span id="timmer"></span></font>
													  

						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank1.png"> &nbsp; <a href="#">�����Ľ�Ÿ</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank2.png"> &nbsp; <a href="#">���</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank3.png"> &nbsp; <a href="#">��ġ��ħ��</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank4.png"> &nbsp; <a href="#">������</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank5.png"> &nbsp; <a href="#">�̿���</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank6.png"> &nbsp; <a href="#">����Ķ���</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank7.png"> &nbsp; <a href="#">��ġ���</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank8.png"> &nbsp; <a href="#">������]�Ľ�Ÿ</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank9.png"> &nbsp; <a href="#">��ġ���ܺ����</a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%= CONTEXT_NAME %>/images/main/rank10.png"> &nbsp; <a href="#">�����</a></td>
					</tr>
				</table>
			</div>
</body>
</html>