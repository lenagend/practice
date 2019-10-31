<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${RESULT =='nobody' }">
		<h3 align="center">글을 올리려면 로그인 해야 합니다</h3>
	</c:when>
		<c:when test="${RESULT =='product_nobody' }">
		<h3 align="center">상품을 올리려면 로그인 해야 합니다</h3>
	</c:when>
</c:choose>
<form:form modelAttribute="user" method="post" action="../login/frame.html">
아이디 : <form:input path="user_id" size="12"/>
<font color="red"><form:errors path="user_id"/></font>
패스워드: <form:password path="password" size="12"/>
<font color="red"><form:errors path="password"/></font>
<br/>
<input type="submit" value="로그인"/>
</form:form>
<div align="right"><a href="../home/userEntry.html">가입하기</a></div>
</body>
</html>