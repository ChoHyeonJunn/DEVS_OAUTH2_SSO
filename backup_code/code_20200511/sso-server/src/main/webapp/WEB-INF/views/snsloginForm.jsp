<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html xmlns:th="http://www.thymeleaf.org">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>Insert title here</title>

<!-- START :: JS import -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- END :: JS import -->


</head>
<body>
			
	<form id="snsloginform" action="/loginProcess" method="post">			
		<input type="hidden" name="member_id">
		<input type="hidden" name="member_password">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
</body>

<!-- START :: KAKAO LOGIN -->
	<script type="text/javascript">
		$(function(){
			$("input[name='member_id']").val('${member_id}');
			$("input[name='member_password']").val('${member_password}');
			
			$("#snsloginform").submit();
		})
	</script>
<!-- END :: KAKAO LOGIN -->

</html>