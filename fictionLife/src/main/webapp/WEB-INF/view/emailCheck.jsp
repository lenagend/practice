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
	<div>인증번호를 입력해주세요</div>
	<div>
		
			
			<form:form modelAttribute="emailCondition" action="../login/emailResult.html">
			<form:hidden path="email" />
			<form:hidden path="dice"/>
			<table>
				<tr>
					<td>
						<form:input path="userInput"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="userInput"/></font>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"/></td>
				</tr>
			</table>
			</form:form>
		
	</div>
	
</body>
</html>