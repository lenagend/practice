<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" 	prefix="c" %>   
   <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>우선, 이메일 인증이 필요합니다</div>
	<div>
		<form:form modelAttribute="emailCondition" action="../login/emailAuth.html">
			
			<table>
				<tr>
					<td>
						<form:input path="email" placeholder="이메일 주소를 입력하세요"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="email"/></font>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="인증받기"/></td>
				</tr>
			</table>
			</form:form>
	</div>
</body>
</html>