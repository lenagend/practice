<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
			prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.loginUser != null}">
	로그인 되었습니다.<br/>
	환영합니다. ${sessionScope.loginUser }님~
	</c:when>
	<c:otherwise>
	로그인 되지 않았습니다.<br/>
	계정과 암호를 확인하세요.
		<c:if test="${cartLogin == 'YES' }">
			<a href="../cart/login.html">
			■다시 로그인 하기</a>
		</c:if>
		<c:if test="${MSG1 == 'YES' }">
			<a href="../login/imageLogin.html">
			■다시 로그인 하기</a>
		</c:if>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test=
"${cartLogin == 'SUCCESS' || imageLogin == 'SUCCESS'}">
	<script type="text/javascript">
	self.close();opener.window.location.reload();
	</script>
	</c:when>
</c:choose>
</body>
</body>
</html>












