<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String CONTEXT_NAME = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  회원정보 폼 -->
<style type="text/css">
	/* UI Object */
	.form_table{margin:1em 0;font-size:12px;font-family:Tahoma, Geneva, sans-serif}
	.form_table input,
	.form_table textarea,
	.form_table select,
	.form_table table,
	.form_table button{font-size:12px}
	.form_table table{width:100%;border:0;border-top:2px solid #999}
	.form_table caption{padding:8px 0;font-weight:bold;text-align:left}
	.form_table th,
	.form_table td{padding:8px;border:0;vertical-align:top}
	.form_table th{color:#333}
	.form_table td{color:#666}
	.form_table thead th{border-bottom:1px solid #ccc;background:#f8f8f8}
	.form_table tbody th{border-bottom:1px solid #ddd;background:#fafafa;text-align:left}
	.form_table tfoot th{border-bottom:1px solid #ddd}
	.form_table tbody td{border-bottom:1px solid #ddd}
	.form_table tfoot td{border-bottom:1px solid #ddd;font-weight:bold;color:#333}
	.form_table .item{position:relative;margin:-4px 0;}
	.form_table .item .i_help{position:absolute;top:4px;right:0}
	.form_table .item .i_label{ top:6px; left:10px}
	.form_table .item .i_dsc{margin:2px 0}
	.form_table .item .i_check,
	.form_table .item .i_radio{width:13px;height:13px;margin:2px 5px 2px 0;padding:0;vertical-align:middle}
	.form_table .item .i_text{position:relative;margin:2px;padding:3px 4px;border:1px solid #b7b7b7;border-right-color:#e1e1e1;border-bottom-color:#e1e1e1;background:transparent}
	.form_table .item .hide{visibility:hidden;position:absolute;top:0;left:0;width:1px;height:1px;font-size:0;line-height:0}
	.form_table .item select{margin:2px}
	.form_table .item label{margin:0 10px 0 0;cursor:pointer}
	/* //UI Object */		
</style>
</head>
<body>

	<!--내정보 목록-->
	<div id="content">
		<h1>My Info</h1>
		<ul>
			<li><a id="inLine1" href="#myInfo" title="내정보조회">My Info</a></li>
			<li><a id="inLine2" href="#" title="내정보변경">Update</a></li>
			<li><a id="inLine3" href="#myPhoto" title="프로필사진">Photo Upload</a></li>
			<li><a id="inLine4" href="#myDelete" title="탈퇴">탈퇴</a></li>
			<li><a id="inLine5" href="#modifyPw" title="비밀번호변경">비밀번호 변경</a></li>
			<li><a id="inLine6" href="#bookmark" title="비밀번호변경">비밀번호 변경</a></li>

			<li><a id="various2" href="./p_imgUpload">Ajax</a></li>
			<li><a id="various3" href="http://google.ca">Iframe</a></li>
			<li><a id="various4" href="http://www.adobe.com/jp/events/cs3_web_edition_tour/swfs/perform.swf">Swf</a></li>
		</ul>
	</div>
	<!--//내정보 목록-->

	<!-- -------------------------------- 내정보 조회 --------------------------------------------- -->
	<div style="display: none;">
		<div id="myInfo" style="width: 600px; height: 600px; overflow: auto;">
			<!-- UI Object -->
			<form
				action="<%=CONTEXT_NAME%>/CustomerController?action=modifyMyInfo"
				method="post">
				<label><span>${sessionScope.userId }</span></label> <label
					for="temp_textarea" class="i_label"
					style="position: absolute; visibility: visible;">귀신</label> <br />
				<fieldset>
					<legend>내 정보</legend>
					<div class="form_table">
						<table border="1" cellspacing="0" summary="표의 요약을 반드시 넣어 주세요">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
											<button type="button" class="i_help">
												<span>?</span>
											</button>
											<span class="i_dsc hide">숨겨둔 설명 입니다. 줄 바꿈 없습니다.</span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
											<button type="button" class="i_help">
												<span>?</span>
											</button>
											<p class="i_dsc hide">숨겨둔 설명 입니다. 줄 바꿈 했습니다.</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호확인</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
											숨겨두지 않은 설명 입니다. 줄 바꿈 없습니다.
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">등급</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">별명</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text"><br>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">@
											<input type="text" name="" title="레이블 텍스트" class="i_text">
											<select name="">
												<option>메일선택</option>
												<option>네이버</option>
												<option>구글</option>
												<option>핫메일</option>
												<option>네이트</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">유저추천수</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">가입일</th>
									<td>
										<div class="item">
											<input type="text" name="" title="레이블 텍스트" class="i_text">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">파일</th>
									<td>
										<div class="item">
											<input name="" type="file" title="레이블 텍스트">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="submit" />
				</fieldset>

			</form>
			<!-- //UI Object -->

		</div>
	</div>
	<!--// -------------------------------- 내정보 조회 종료------------------------------------------- -->

	<!-- 사진업로드 -->
	<div style="display: none;">
		<div id="myPhoto" style="width: 500px; height: 300px; overflow: auto;">
			test photo
			<jsp:include page="./p_imgUpload.jsp"></jsp:include>
			<div id = "htmlExampleTarget"></div>
		</div>
	</div>
	<!-- //사진업로드 -->
	
	<!-- 탈퇴 -->
	<div style="display: none;">
		<div id="myDelete" style="width: 500px; height: 300px; overflow: auto;">
			
			
		</div>
	</div>
	<!-- //탈퇴 -->
	
	<!-- 비밀번호 변경 -->
	<div style="display: none;">
		<div id="modifyPw" style="width: 500px; height: 300px; overflow: auto;">
			
			
		</div>
	</div>
	<!-- //비밀번호 변경 -->
	
	<!-- 즐겨찾기 -->
	<div style="display: none;">
		<div id="bookmark" style="width: 500px; height: 300px; overflow: auto;">
			
			
		</div>
	</div>
	<!-- //즐겨찾기 -->

<jsp:include page="./p_imgUpload.jsp"></jsp:include>
			<div id = "htmlExampleTarget"></div>

</body>

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write('<script src="jquery-1.4.3.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="<%=CONTEXT_NAME%>/js/customer/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="<%=CONTEXT_NAME %>/js/customer/jquery.fancybox-1.3.4.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=CONTEXT_NAME %>/css/customer/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="<%=CONTEXT_NAME %>/css/customer/style.css" />
	<script type="text/javascript">
		$(document).ready(function() {
		/*
			*   Examples - various
			*/
			/* in-line text */
			$("#inLine1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
			$("#inLine2").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
			$("#inLine3").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
			$("#inLine4").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
			$("#inLine5").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
			

			$("#various2").fancybox();

			$("#various3").fancybox({
				'width'				: '75%',
				'height'			: '75%',
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'iframe'
			});

			$("#various4").fancybox({
				'padding'			: 0,
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
		});
	</script>
</html>