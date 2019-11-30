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
	<div>회원가입</div>
	<div>
		<form:form modelAttribute="member" action="../login/doRegi.html" method="post">
			
			<table>
				<tr>
					<td>
						<form:input path="email" value="${authEmail }" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:password path="password" placeholder="비밀번호" id="pwd"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="password"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:password path="rePwd" placeholder="비밀번호 확인" />
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="rePwd"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="nickname" placeholder="닉네임" />
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="nickname"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="phone" placeholder="휴대전화"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="phone"/></font>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입" id="reg_submit"/></td>
				</tr>
			</table>
			
		</form:form>
	</div>
	
</body>
</html>