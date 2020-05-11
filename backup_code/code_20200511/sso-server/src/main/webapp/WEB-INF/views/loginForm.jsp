<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta charset="EUC-KR">
<title>Insert title here</title>


<!-- START :: JS import -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- END :: JS import -->

<!-- START :: CSS -->
	<!-- �̰Ŵ� -�Ǵ�- �̰Ŷ� ����.. -->
<style type="text/css">
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}
   
.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>
<!-- END :: CSS -->

</head>
<body>
	<section>
	 	
		
		<div>
			<h1>DEVS</h1>
			
			<div>				
				<form action="/loginProcess" method="post">			
					<!-- �̸��� -->
					<input type="text" name="member_id" required="required" placeholder="��ȭ��ȣ, ����� �̸� �Ǵ� �̸���">
					
					<!-- ��й�ȣ -->
					<input type="password" name="member_password" required="required" placeholder="��й�ȣ">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<!-- �α��� ��ư -->
					<input type="submit" value="LOGIN">
				</form>
				
			</div>
			
			<div class="hr-sect">�Ǵ�</div>
			
			<div>
				<span>
					<a id="custom-login-btn" href="javascript:loginWithKakaoRest()">
						<img src="/resources/images/social/kakao/kakaolink_btn_medium.png" width="100px;"/> 
					</a>
				</span>
				<span>
					<a id="naver_id_login"></a>
				</span>
								
				<div>
					<a href="#">��й�ȣ�� �����̳���?</a>
				</div>
			</div>			
			
		</div>

	 	<div>
			������ �����Ű���?
			<a href="/signup">&nbsp;�����ϱ� </a>
		</div>
	</section>

	
	<section>
		<h1>����Ʈ�Ұ�</h1>
		
		<div>
	
		</div>
	</section>	
	
</body>

<%-- <spring:eval expression="@property('social.kakao-login-link')" var="kakaoLoginLink"/> --%>

<!-- START :: KAKAO LOGIN -->
	<script type="text/javascript">
		function loginWithKakaoRest(){	
			/* location.href='${kakaoLoginLink}' */
			location.href='https://kauth.kakao.com/oauth/authorize?client_id=4be0db1fcb83bc9cf8c11a9fbca76507&redirect_uri=http://localhost:8585/kakaoOauth&response_type=code';
		}
	</script>
<!-- END :: KAKAO LOGIN -->

</html>