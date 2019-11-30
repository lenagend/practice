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
<script type="text/javascript">
$(document).ready(function() {
	$.mobile.ajaxEnabled=false;
});
</script>
</head>
<body>
	<form:form modelAttribute="novel" action="../novel/registerNovel.html"
		method="post" enctype="multipart/form-data">
		
		<table>
			<tr>
				<td><form:input path="title" placeholder="제목" /></td>
			</tr>
			<tr>
				<td><form:errors path="title" /></td>
			</tr>
			<tr>
				<td><form:select path="type">
						<form:option value="판타지" />
						<form:option value="무협" />
						<form:option value="로맨스" />
						<form:option value="기타" />
					</form:select></td>
			</tr>
			<tr>
				<td><form:textarea path="description"  placeholder="작품설명" /></td>
			</tr>
			<tr>
				<td><form:errors path="description" /></td>
			</tr>
			<tr>
				<td>표지이미지: <input type="file" id="imageFile" name="imageFile" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>

			</tr>
		</table>
	</form:form>
</body>
</html>