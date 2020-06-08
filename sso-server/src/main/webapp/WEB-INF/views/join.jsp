<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<!-- START :: js import -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- END :: js import -->

</head>
<body>
	<section>
	 	
		
		<div>
			<h1>
				DEVS
			</h1>
			<h3>
				ģ������ ������ �������� ������ �����ϼ���.
			</h3>
			
			<div>
				<span>
					<a id="custom-login-btn" href="javascript:loginWithKakaoRest()">
						<img src="/resources/images/social/kakao/kakaolink_btn_medium.png" width="100px;"/> 
					</a>
				</span>

				<a href="javascript:loginWithNaverRest()">
					<img src="/resources/images/social/naver/naver_login.PNG" width="223" />
				</a>
			</div>		
			
			<div>
				<hr>
			</div>
			
			<div>		
				<form id="joinForm" action="/join" method="post" name="MemberVo">
				
					<fieldset>
						<legend>optional</legend>
						
						<!-- �̸��� -->
						<input type="text" name="memberaccount" placeholder="�޴��� ��ȣ �Ǵ� �̸��� �ּ�">
						<div id="emailchk"></div>
						
						<!-- ���� -->
						<input type="text" name="membername" placeholder="����� �̸�">
					</fieldset>
					
					<fieldset>
						<legend>essential</legend>
						
						<!-- ���̵� -->
						<input type="text" name="memberid" required="required" placeholder="����� ���̵�">
						<div id="idchk"></div>
						
						<!-- ��й�ȣ -->
						<input type="password" name="memberpassword" required="required" placeholder="��й�ȣ">
					</fieldset>
					
					<!-- ȸ������ ��ư -->					
					<input type="submit" value="JOIN">
					<!-- ��ȿ������ ��ºκ� -->
					
				</form>

			</div>		
			
		</div>

	 
 		<div>
			������ �����Ű���?
			<a href="/loginForm">&nbsp;�α��� </a>
		</div>
	</section>
</body>

<!-- START :: submit ��ư disabled handler -->
<script type="text/javascript">

	var memberaccount;	// email �Ǵ� phone�� input name ����

	// null �� ���� üũ, ��ȿ�� üũ
	var memberaccountBool = true;
	var membernameBool = true;
	var memberidBool = false;
	var memberpasswordBool = false;

	$(function() {
		$("input[type='submit']").attr("disabled", "disabled");

		// input name�� �±װ� ����ʿ� ���� �����ϴ��� ����
		if($("input[name='memberaccount']").length > 0) {	memberaccount = $("input[name='memberaccount']");}
		if($("input[name='memberemail']").length > 0) {	memberaccount = $("input[name='memberemail']");	}
		if($("input[name='memberphone']").length > 0) { memberaccount = $("input[name='memberphone']");}
		
		// ��ȿ�� ���� �� submit ��ư disable handler ȣ��
		memberaccount.keyup(function() {disableHandler();});
		$("input[name='membername']").keyup(function(){disableHandler()});
		$("input[name='memberid']").keyup(function() {disableHandler();});
		$("input[name='memberpassword']").keyup(function() {disableHandler();});
	});
	
	// submit ��ư disable handler
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
<!-- END :: submit ��ư disabled handler -->

<!-- START :: id �ߺ��˻� -->
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
							$("#idchk").text("�̹� �����ϴ� ID �Դϴ�.").css("color","red");
							memberidBool = false;
						} else {
							$("#idchk").text("��밡���� ID �Դϴ�.").css("color","green");
							memberidBool = true;
						}
						
						disableHandler(); // submit ��ư disabled handler
					},
					
					error: function(){
						alert("��Ž���");
					}
				});
				
			} else {
				memberidBool = false;
				disableHandler(); // submit ��ư disabled handler
			}
			
		});
		
	})
</script>
<!-- END :: id �ߺ��˻� -->

<!-- START :: email, phone Ÿ��üũ, �ߺ��˻� -->
<script type="text/javascript">

	$(function() {

		// �̸��� ���Խ�
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// �ڵ�����ȣ ���Խ� (010-1234-1234)
		var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
		
		memberaccount.keyup(function() {
			$("#emailchk").text("");
			
			accountValue = memberaccount.val();
			
			if(accountValue != null && accountValue != "") {
				
				if(regExpEmail.test(accountValue)) { // �̸��� �����̶��
					memberaccount.attr({
						"name" : "memberemail"
					});
				
					var joinVal = {
						"memberemail" : accountValue
					}
				
					// �̸��� �ߺ� �˻�
					$.ajax({
						type: "post",
						url: "/emailCheck",
						data: JSON.stringify(joinVal),
						contentType: "application/json",
						dataType: "json",
						
						success: function(msg){
							
							if (msg.check == true) {
								$("#emailchk").text("�̹� �����ϴ� EMAIL �Դϴ�.").css("color","red");
								memberaccountBool = false;
							} else {
								$("#emailchk").text("��밡���� EMAIL �Դϴ�.").css("color","green");
								memberaccountBool = true;
							}
							
							disableHandler(); // submit ��ư disabled handler
						},
						
						error: function(){
							alert("��Ž���");
						}
					});
				
				} else if(regExpPhone.test(accountValue)) {	// �ڵ�����ȣ �����̶��
					$("#joinchk").hide();
				
					memberaccount.attr({                                                                                                                                                                                                                                                                               
						"name" : "memberphone"
					})
				}
				
			} else {
				memberaccountBool = true;
				disableHandler(); // submit ��ư disabled handler
			}
			
		});
		
	});
	
</script>
<!-- END :: email, phone Ÿ��üũ, �ߺ��˻� -->

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

<!-- START :: application.yml ���� -->
	<spring:eval expression="@environment.getProperty('server.port')" var="serverPort"/>
	<spring:eval expression="@environment.getProperty('ssoDomain')" var="ssoDomain"/>
	
	<spring:eval expression="@environment.getProperty('social-link.kakao-login-link')" var="kakaoLoginLink"/>
	<spring:eval expression="@environment.getProperty('social-link.kakao-rest-api-key')" var="kakaoRestApiKey"/>
	
	<spring:eval expression="@environment.getProperty('social-link.naver-login-link')" var="naverLoginLink"/>
	<spring:eval expression="@environment.getProperty('social-link.naver-rest-api-key')" var="naverRestApiKey"/>
	<spring:eval expression="@environment.getProperty('social-link.naver-oauth-state')" var="naverOauthState"/>
<!-- END :: application.yml ���� -->

<!-- START :: KAKAO LOGIN -->
	<script type="text/javascript">
		function loginWithKakaoRest(){	
			const url = '${kakaoLoginLink}?client_id=${kakaoRestApiKey}&redirect_uri=http://${ssoDomain}:${serverPort}/kakaoOauth&response_type=code';
// 			const url = 'https://kauth.kakao.com/oauth/authorize?client_id=4be0db1fcb83bc9cf8c11a9fbca76507&redirect_uri=http://3.136.253.121:8585/kakaoOauth&response_type=code';
			location.href=url;
		}
	</script>
<!-- END :: KAKAO LOGIN -->

<!-- START :: NAVER LOGIN -->
	<script type="text/javascript">
		function loginWithNaverRest(){
			const url = '${naverLoginLink}?response_type=code&client_id=${naverRestApiKey}&redirect_uri=http://${ssoDomain}:${serverPort}/naverOauth&state=${naverOauthState}';
// 			const url = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ZnB1hkTBDYaRrVgb5rpz&redirect_uri=http://3.136.253.121:8585/naverOauth&state=550e8400-e29b-41d4-a716-446655440000';
			location.href=url;
		}
	</script>
<!-- END :: NAVER LOGIN -->

</html>