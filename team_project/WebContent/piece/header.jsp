<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<body>
<% String CONTEXT_NAME = request.getContextPath(); %>
<!-- ·Î°í -->
	<table border="0" width="1350px">
		<tr>
			<td rowspan="2"><div style="margin-top: 20px;">
					<a href="<%=CONTEXT_NAME%>/index.jsp" >
					<img src="<%=CONTEXT_NAME%>/images/main/syorry3.png" class="logo" border="0"></a>
				</div></td>
		</tr>
		<!-- ¸Þ´ºÅÇ -->
		<tr>
			<td>
				<div class="menu">
					<ul class="nav">
						<li><a href="#" class="menua">Recipe</a></li>
						<li><a href="#" class="menua"><span></span>BestRecipe</a>
						</li>
						<li><a href="#" class="menua"><span></span>MyTip</a>
						</li>
						<li><a href="#" class="menua"><span></span>Community</a>
							<ul>
								<li><a href="#" class="menua">Meet
										Here</a></li>
								<li><a href="#" class="menua">Free
										Board</a></li>
								<li><a href="<%=CONTEXT_NAME%>/qna/qnamain.jsp" class="menua">Q&A</a></li>
							</ul></li>
					</ul>
				</div>
			</td>
		</tr>
	</table>


</body>
</html>