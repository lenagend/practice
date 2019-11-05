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
<script type="text/javascript">
 function validate(f) {
	if(f.title.value==''){
		alert("제목을 입력하세요"); return false;
	}
	if(f.name.value==''){
		alert("작성자를 입력하세요") return false;
	}
	if(f.password.value==''){
		alert("암호를 입력하세요") return false;
	}if(f.content.value==''){
		alert("내용을 입력하세요") return false;
	}
	var rusult = confirm("정말로 변경하시겠습니까?");
	if(result == false) return false;
	
	
	
}

</script>
</head>
<body>
<form:form action="../write/updateDo.html" method="post" modelAttribute="writing"
enctype="multipart/form-data" onsubmit="return validate(this)">
	<form:hidden path="writing_id" value="${writing.writing_id }" />
	<table border="1" width="100%">
		<tr><th>글제목</th><td><form:input path="title" value="${writing.title }"/></td></tr>
		<tr><th>작성자</th><td><form:input path="writer_name" value="${writing.writer_name }"/></td></tr>	
		<tr><th>이메일</th><td><form:input path="email" value="${writing.email }"/></td></tr>
		<tr><th>암호</th><td><form:password path="password"/></td></tr>
		<tr><th>이미지</th><td><input type="file" name="image">
		<br/><img alt="" width="350" border="0" src="${pageContext.request.contextPath }/upload/${writing.image_name}"></td></tr>	
		<tr><th>글내용</th><td><form:textarea path="content" value="${writing.content }"/></td></tr>
		<tr><td colspan="2"><input type="submit">
		<input type="button" value="취 소" onclick="javascript:history.go(-1)"/></td></tr>
	
	
	</table>
</form:form>
</body>
</html>