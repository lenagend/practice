<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" 	prefix="c" %>   
   <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#loginFormDiv{
   width:35%;
	    height:100%;
	    margin-top:5%;
	    margin-bottom: 30%;
  		padding-top: 20%;
  		padding-bottom: 5%;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}

.input{

  width:300px;
  height:50px;
  font-size:150%;
  font-family: Malgun Gothic;
 
}

.button{
 width:300px;
  height:50px;
  font-family: Malgun Gothic;
 background-color: #66CCFF;
 font-size:150%;
 color: #003399;
}
</style>
<title>이메일 인증</title>
</head>
<body>
	<div id="loginFormDiv">
		우선, 이메일 인증이 필요합니다
		
			<form:form modelAttribute="emailCondition"
				action="../login/emailAuth.html">

				<table>
					<tr>
						<td><form:input class="input" path="email" placeholder="이메일 주소를 입력하세요" /></td>
					</tr>
					<tr>
						<td><font color="red"><form:errors path="email" /></font></td>
					</tr>
					<tr>
						<td><input class="button" type="submit" value="인증받기" /></td>
					</tr>
				</table>
			</form:form>
		

	</div>
</body>
</html>