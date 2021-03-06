<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<!-- START :: js import -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- END :: js import -->

	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>

	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
									
				<span class="login100-form-title p-b-49">
					Devs <img src="/resources/images/logo.png" width="15%;"></img> ${snsType } Join
                </span>
                <p>친구들의 사진과 동영상을 보려면 가입해주세요.</p><br>
										
				<form id="joinForm" action="/snsjoin" method="post" name="MemberVo" class="login100-form validate-form">
				
					<!-- 이메일 -->
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">휴대폰 번호 또는 이메일 주소</span>
						<input class="input100" type="text" name="memberaccount" value="${email}" placeholder="Type your phone or email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
                    </div>	
					<div id="emailchk"></div>
					
					<!-- 성명 -->
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">사용자 이름</span>
						<input class="input100" type="text" name="membername" value="${nickname}" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					<!-- 아이디 -->
					<div class="wrap-input100 validate-input m-b-23" data-validate="Password is required">
						<span class="label-input100">사용자 아이디</span>
						<input class="input100" type="text" name="memberid" required="required" placeholder="Type your ID">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
                    </div>	
					<div id="idchk"></div>
						
					<!-- 비밀번호 -->
					<input type="hidden" name="memberpassword" value="${sns_id }">
					<!-- snsid -->
					<input type="hidden" name="snsid" value="${sns_id }">
					<!-- snstye -->
					<input type="hidden" name="snstype" value="${snsType }">
					
					<div class="text-right p-t-8 p-b-31"></div>
					
					<!-- 회원가입 버튼 -->					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit" value="JOIN">
								Join
							</button>
						</div>
					</div>
					
				</form>
				
		 		<div class="flex-col-c p-t-155">
					<span class="txt1 p-b-17">
						계정이 있으신가요?
					</span>
	
					<a href="/loginForm" class="txt2">
						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn">
									Login
								</button>
							</div>
						</div>
					</a>
				</div>
				
			</div>
			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	
	<script src="/resources/js/main.js"></script>
	
</body>

<!-- START :: submit 버튼 disabled handler -->
<script type="text/javascript">
	$(function(){
		$("input[name='memberaccount']").focus();
	})
	var memberaccount;	// email 또는 phone의 input name 설정

	// null 및 공백 체크, 유효성 체크
	var memberaccountBool = true;
	var membernameBool = true;
	var memberidBool = false;
	var memberpasswordBool = false;

	$(function() {
		$("input[type='submit']").attr("disabled", "disabled");

		// input name의 태그가 변경됨에 따라 존재하는지 여부
		if($("input[name='memberaccount']").length > 0) {	memberaccount = $("input[name='memberaccount']");}
		if($("input[name='memberemail']").length > 0) {	memberaccount = $("input[name='memberemail']");	}
		if($("input[name='memberphone']").length > 0) { memberaccount = $("input[name='memberphone']");}
		
		// 유효성 검증 후 submit 버튼 disable handler 호출
		memberaccount.keyup(function() {disableHandler();});
		$("input[name='membername']").keyup(function(){disableHandler()});
		$("input[name='memberid']").keyup(function() {disableHandler();});
		$("input[name='memberpassword']").keyup(function() {disableHandler();});
	});
	
	// submit 버튼 disable handler
	function disableHandler() {
		
		if($("input[name='memberpassword']").val() != null && $("input[name='memberpassword']").val() != "") {
			memberpasswordBool = true;
		} else {
			memberpasswordBool = false;
		}
		
		if(memberaccountBool && membernameBool && memberidBool && memberpasswordBool) {
			console.log(memberaccountBool + ":" + membernameBool + ":" + memberidBool + ":" + memberpasswordBool);
			$("input[type='submit']").removeAttr("disabled");

		} else {
			console.log(memberaccountBool + ":" + membernameBool + ":" + memberidBool + ":" + memberpasswordBool)
			$("input[type='submit']").attr("disabled", "disabled");
		}
	}		                                                             

</script>
<!-- END :: submit 버튼 disabled handler -->

<!-- START :: id 중복검사 -->
<script type="text/javascript">

	$(function(){

		$("input[name='memberid']").keyup(function(){
			$("#idchk").text("");
			
			if($("input[name='memberid']").val() != null && $("input[name='memberid']").val() != "") {
				
				var memberid = $("input[name='memberid']").val().trim();
				
				var joinVal = {
					"memberid" : memberid
				}
				
				$.ajax({
					type: "post",
					url: "/idCheck",
					data: JSON.stringify(joinVal),
					contentType: "application/json",
					dataType: "json",
					
					success: function(msg){
						
						if (msg.check == true) {
							$("#idchk").text("이미 존재하는 ID 입니다.").css("color","red");
							memberidBool = false;
						} else {
							$("#idchk").text("사용가능한 ID 입니다.").css("color","green");
							memberidBool = true;
						}
						
						disableHandler(); // submit 버튼 disabled handler
					},
					
					error: function(){
						alert("통신실패");
					}
				});
				
			} else {
				memberidBool = false;
				disableHandler(); // submit 버튼 disabled handler
			}
			
		});
		
	});
</script>
<!-- END :: id 중복검사 -->

<!-- START :: email, phone 타입체크, 중복검사 -->
<script type="text/javascript">

	$(function() {

		accountKeyUpAndFocus();
		
		memberaccount.on({
			keyup: function(){
				accountKeyUpAndFocus();
			}
		})
		
	});
	
	function accountKeyUpAndFocus(){
		// 이메일 정규식
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 핸드폰번호 정규식 (010-1234-1234)
		var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
		
		$("#emailchk").text("");		
		accountValue = memberaccount.val();
		
		if(accountValue != null && accountValue != "") {
			
			if(regExpEmail.test(accountValue)) { // 이메일 형식이라면
				memberaccount.attr({
					"name" : "memberemail"
				});
			
				var joinVal = {
					"memberemail" : accountValue
				}
			
				// 이메일 중복 검사
				$.ajax({
					type: "post",
					url: "/emailCheck",
					data: JSON.stringify(joinVal),
					contentType: "application/json",
					dataType: "json",
					
					success: function(msg){
						
						if (msg.check == true) {
							$("#emailchk").text("이미 존재하는 EMAIL 입니다.").css("color","red");
							memberaccountBool = false;
						} else {
							$("#emailchk").text("사용가능한 EMAIL 입니다.").css("color","green");
							memberaccountBool = true;
						}
						
						disableHandler(); // submit 버튼 disabled handler
					},
					
					error: function(){
						alert("통신실패");
					}
				});
			
			} else if(regExpPhone.test(accountValue)) {	// 핸드폰번호 형식이라면
				$("#joinchk").hide();
			
				memberaccount.attr({                                                                                                                                                                                                                                                                               
					"name" : "memberphone"
				})
			}
			
		} else {
			memberaccountBool = true;
			disableHandler(); // submit 버튼 disabled handler
		}
	}
	
</script>
<!-- END :: email, phone 타입체크, 중복검사 -->

<!-- START :: form submit -->
<script type="text/javascript">

	$(function() {
		
		$("#joinForm").submit(function(e) {
			
			if($("input[name='memberphone']").length > 0) {
				var phoneValue = $("input[name='memberphone']").val();
				 $("input[name='memberphone']").val(phoneValue.split("-").join(""));
			}
			
			return true;
		});
		
	});

</script>
<!-- END :: form submit -->

</html>