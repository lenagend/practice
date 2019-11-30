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
	<c:if test="${! empty LOGINMEMBER }">
	이미 로그인 되어있습니다. 새로고침해 보세요
	</c:if>
	<c:if test="${ empty LOGINMEMBER }">
	<div>로그인</div>
	<div>
		<form:form modelAttribute="member" action="../login/login.html">
			
			<table>
				<tr>
					<td>
						<form:input path="email"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="email"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:password path="password"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="password"/></font>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"/></td>
				</tr>
			</table>
			<table>
				<tr>
					<td></td>
					<td><a href="../home/loadEmail.html">회원가입</a></td>
					<td><a href="../home/loadFindEmail.html">계정찾기</a></td>
				</tr>
			</table>
		</form:form>
	</div>
	</c:if>
</body>
</html>