<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���� Ȯ���ϼ���</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="../css/main/main.css">
<style type="text/css">
body { width: 100%; 
	background-image: url(../images/main/background.png); background-repeat: repeat repeat;
}
</style>
<!--  �ڹٽ�ũ��Ʈ -->
<script type="text/javascript"> 
	function goUrl(url) {
		location.href=url;
	}
</script>
<!--  font -->
<link href='http://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
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
		<div class="content">
				<input type="hidden" name="mode" value="W" />
				<table border="1" summary="�Խ��� ��� ��">
					<caption>�Խ��� ��� ��</caption>
					<colgroup>
						<col width="100" />
						<col width="500" />
					</colgroup>
					<tbody>
						<tr>
							<td>�Խ��Ǻз�</td>
							<td><select style="width:156px">
								<option>������ ����</option>
								<option>�����Խ���</option>
								<option>Q&A</option>
								</select>
							</td>
						</tr>
						<tr>
							<th align="center">����</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th align="center">�г���</th>
							<th align="left">���</th>
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
					<input type="button" value="���" onclick="goUrl('qnamain.jsp');" class="button"/>
					<input type="submit" value="�۵��" class="button"/>
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