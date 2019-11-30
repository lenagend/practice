<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>계정 찾기</div>
	<div>
		<form action="../login/findEmail.html" method="post">
			<input type="hidden" name="findEmailTokken" id="findEmailTokken" value="${findEmailTokkenMsg }"/>
			<table>
				<tr>
					<td><input type="number" name="phone" /></td>
				</tr>
				<tr>
					<td><font color="gray">비밀번호는 가입 이메일로 자동 전송됩니다</font></td>
				</tr>

				<tr>
					<td><input type="submit" value="확인" /></td>
				</tr>


			</table>

		</form>
	</div>


</body>
</html>