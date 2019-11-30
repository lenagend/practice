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

<div>계정 찾기 결과</div>
	<form action="../home/loadFindEmail.html" method="post">
		<table>
			<c:choose>
				<c:when test="${findEmailResult == 'fail'}">
					<tr>
						<td>
							<div id="resultMsg">
								<font color="red">해당 전화번호는 없습니다</font>
							</div>
						</td>
					</tr>
					<tr>
						<td>관리자 문의: 010-7159-2578</td>
					</tr>
					<tr>
						<td><input type="submit" value="다시 찾기" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>이메일 : ${findEmailResult }</td>
					</tr>
					<tr>
						<td><font color="gray">비밀번호가 이메일로 전송되었습니다</font></td>
					</tr>
					<tr>
						<td><a href="../home/goMain.html">홈으로</a></td>
					</tr>
				</c:otherwise>
			</c:choose>


		</table>
	</form>
	
</body>
</html>