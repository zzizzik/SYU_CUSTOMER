<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/customer/contextPath.jsp" %>
<% String CONTEXT_NAME = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sign UP Page</title>

<script type="text/javascript" src="<%=JS %>/join.js"></script>
<script type="text/javascript" src="<%=JS %>/ajax.js"></script>
<script>
	var idcheck="f";
	var nickcheck="f";
	var emailcheck="f";
	var allcheck="f";
	

	function userCheck(e) {
			
		//alert(e.name);
		if(e.name=="userId"){
			//alert("1");
			var userId = document.joinForm.userId;
			var url = "<%=HOME%>/CustomerController";
			var params = "action=userCheck&keyword=userId&userId="+userId.value;
		}
		if(e.name=="userNick"){
			//alert("2");
			var userNick = document.joinForm.userNick;
			var url = "<%=HOME%>/CustomerController";
			var params = "action=userCheck&keyword=userNick&userNick="+userNick.value;
		}
		if(e.name=="email_c"){
			//alert("3");
			var userEmail = document.joinForm.userEmail.value +"@"+ document.joinForm.userEmail_s.value;
			alert(userEmail);
			var url = "<%=HOME%>/CustomerController";
			var params = "action=userCheck&keyword=userEmail&userEmail="+userEmail;
		}
		
		//var userid = document.joinForm.userId;
		//var url = "<%=HOME%>/CustomerController";
		//var params = "action=isUserId&userId="+userid.value;
	
		var httpMethod = "GET";
				
		// 3. http 요청 방식 설정 : get, post
				
		// 5. ajax 요청처리를 위한 ajax 객체 생성 (ajax.js)
			new ajax.xhr.Request(url, params, callback, httpMethod);
	   }

		// 4. 응답처리를 위한 콜백함수 설정
	function callback(xhr) {	// xhr => 현재 요청처리를 담당하는 ajax 객체
		/*
		1. 응답이 완료되고, 성공 status 이면 
		2. 응답 데이터 추출해서 : text, xml 
		3. 응답 결과에 따라 중복검색 메세지 영역에 엘리먼트 가져와서
		4. 메세지 영역에 결과 메세지 출력
		*/
		
		//성공상태 상태 성공
		if(xhr.readyState == 4 && xhr.status == 200) {
			// 응답 가져오기
			var responseData = new String(xhr.responseText);
			
			
			//응답처리
			if(responseData == "userIdno"){
				document.getElementById("displayUserIdCheck").innerHTML = "중복됨";
				allcheck="아이디";
			}
			if(responseData == "userIdyes"){
				document.getElementById("displayUserIdCheck").innerHTML = "괜찮음";
				idcheck="t";
				allcheck="t";
			}
			
			if(responseData == "userNickno"){
				document.getElementById("displayUserNickCheck").innerHTML = "중복됨";
				allcheck="닉네임";
			}
			if(responseData == "userNickyes"){
				document.getElementById("displayUserNickCheck").innerHTML = "괜찮음";
				nickcheck="t"; 
				allcheck="t";
			}
			
			if(responseData == "userEmailno"){
				document.getElementById("displayUserEmailCheck").innerHTML = "중복됨";
				allcheck="이메일"
			}
			if(responseData == "userEmailyes"){
				document.getElementById("displayUserEmailCheck").innerHTML = "괜찮음";
				emailcheck="t";
				allcheck="t";
			}
			
		
	
		}
	}
</script>
<script type="text/javascript">
function select_box(){
			var select_btn = document.getElementById("userEmail_o").value;
			var box = document.getElementById("userEmail_s");
			
			//inperson 은 직접선택
			if("inPerson"==select_btn){
				box.value="";
				box.readOnly=false;
				box.focus();
			} else{
				box.value=select_btn;
				box.readOnly=true;
			}
}
	
function check_password(){
	var userpw1 = document.getElementById("userPw");
	var userpw2 = document.getElementById("userPw_c");
	
	if(userpw1.value != userpw2.value){
		document.getElementById("check_userPw").innerHTML = "<span style='color:red;'>NOT MATCH</span>";
	} else{
		document.getElementById("check_userPw").innerHTML = "<span style='color:green;'>OK</span>";
	}
}
</script>
</head>
<body>

<form method="post" action="<%=HOME%>/CustomerController?action=joinSaveAction" name=joinForm id=joinForm>
	<div class="userinfo1">
		<fieldset>
			<legend><strong>회원가입</strong></legend>
			<p>
				<label for="userId">아이디 : </label>
				<input name="userId" id="userId" type="text" onKeyUp="userCheck(this)" />
				<span id="displayUserIdCheck" style="color:navy;font-size:11px;">ajax</span> </p>
			<p>
				<label for="userName">이름 : </label>
				<input name="userName" id="userName" type="text" />
			</p>
			<p>
				<label for="userNick">별명 : </label>
				<input name="userNick" id="userNick" type="text" onKeyUp="userCheck(this)" />
				<span id="displayUserNickCheck" style="color:navy;font-size:11px;">ajax</span> </p>
			<p>
				<label for="userPw">비밀번호 : </label>
				<input name="userPw" id="userPw" type="password" />
			</p>
			<p>
				<label for="userPw_c">비밀번호확인 : </label>
				<input name="userPw_c" id="userPw_c" type="password" onKeyUp="check_password()" onKeyDown="check_password()"/>
				<span id="check_userPw">ajax</span></p>
			<p>
				<label for="phone">전화번호 : </label>
				<input name="userPhone" id="userPhone" type="text" />
			</p>
			<p>
				<label for="userEmail">이메일 : </label>
				<input name="userEmail" id="userEmail" type="text" value=""/>
				@
				<input name="userEmail_s" id="userEmail_s" type="text" value=""/>
				<select name="userEmail_o" id="userEmail_o" onchange="select_box()">
					<option>메일선택</option>
					<option value="naver.com" id="naver">네이버</option>
					<option value="gmail.com" id="gmail">구글</option>
					<option value="hotmail.com" id="hotmail">핫메일</option>
					<option value="inPerson" id="inPerson">직접입력</option>
				</select>
				<button type="button" onclick="userCheck(this)" value="email" id="email_c" name="email_c">중복검사</button>
				<br><span id="displayUserEmailCheck" style="color:navy;font-size:11px;">ajax</span>
			</p>
		</fieldset>
	</div>
	<div class="sign-up-d">
		<fieldset>
			<input name="sign-up" id="sign-up" type="submit" value="다음단계" onClick="passM(); return false;">
			<input name="sign-up" id="sign-up" type="reset" value="취소" onClick="passM(); return false;">
		</fieldset>
	</div>
</form>
</body>
<!-- ajax json script -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
	function pass(){
		
		if(idcheck=="f"){
			alert("아이디 존재합니다");
			return false;
		}else if(nickcheck=="f"){
			alert("별명 존재합니다");
			return false;
		}else if(emailcheck=="f"){
			alert("이메일 존재합니다");
			return false;
		}else{
			if(idcheck=="t" && nickcheck=="t" && emailcheck=="t"){
				this.submit();
				return true;
			}else{
				alert("중복을 확인하세요");
				return false;	
			}
		}		
	}
	
	
	
/*
	$("#joinForm").ajaxForm({
			success : function(data){			
		    	 alert("성공");
		    	 location.replace("/index.jsp");
		    },
		    error: function(data){
		    	alert("가입오류");
		    }
		});
	*/
	/*
	//prepare the form when the DOM is ready 
	$(document).ready(function() {
		// bind form using ajaxForm 
		$('#joinForm').ajaxForm({
			beforeSubmit : validate
		});
	});
	function validate(formData, jqForm, options) { 
		
	    for (var i=0; i < formData.length; i++) { 
	        if ((!formData[i].value) || formData[i].length < 2) {
	        	
	            alert('Please enter a value for both Username and Password'); 
	            return false; 
	        } 
	    } 
	    alert('Both fields contain values.'); 
	   	   
	    
	}
	*/
	/*
	$("#joinForm").ajaxForm({
		
	    success : function(data){
	    	 if(data.RESULT_KEY=="Fail"){
	             alert('통신 중 에러 ');
	         }else if(data.RESULT_KEY=="Success"){
	            // Ajax 전송 성공 후 처리 로직 삽입
				alert("성공");	            
	             return data.TRANS_RESULT_KEY;
	            
	         }else{
	             alert(data.Message);
	         }        
	    },
	    error: function(e){
	    	alert("가입오류");
	    }
	});
	*/
	
	
	
	/*
	 // wait for the DOM to be loaded 
	 $(document).ready(function() { 

	 // bind 'myForm' and provide a simple callback function 
	 $('#joinForm').ajaxForm(function() {
	
	 alert("가입되셨습니다.");
	
	 }); 
	 });
	 */
</script>
</html>
