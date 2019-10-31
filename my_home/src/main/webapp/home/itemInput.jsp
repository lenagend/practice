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
<h2 align="center">상품정보 등록</h2>
<form:form action="../product/entry.html" method="post" modelAttribute="item" >

상품코드: <form:input path="code" maxlength="20"/><br/>
<font color="red"><form:errors path="code"></form:errors></font>
<br/>
상품이름: <form:input path="name" maxlength="20"/><br/>
<font color="red"><form:errors path="name"></form:errors></font><br/>
상품가격: <form:input path="price" maxlength="20"/><br/>
<font color="red"><form:errors path="price"></form:errors></font><br/>
상품설명: <form:textarea path="info" rows="5" cols="30"/>
<br/>
원산지: <form:input path="origin" maxlength="20"/><br/>

<input type="submit" value="등 록"/>
<input type="reset" value="취 소"/>
</form:form>
</body>
</html>