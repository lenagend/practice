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

function check(frm) {

	if(confirm("정말로 올리겠습니까?")){
		
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<h3 align="center">게시판 글쓰기</h3>
	
	
	<form:form action="../home/write.html" method="post" modelAttribute="bbs" onsubmit="return check(this);">
	<h4>제목 <form:input path="title" placeholder="제목을 작성해 주세요"/></h4>
	<font color="red"><form:errors path="title"/></font>
	<br/><br/>
	<form:textarea rows="5" cols="30" path="content" placeholder="글 내용을 입력하세요"></form:textarea><br/>
	<font color="red"><form:errors path="content"/></font>
	<br/><br/>
	<input type="submit" value="글 올리기"/>
	<input type="reset" value="취소"/>
	
	
	
	</form:form>
</body>
</html>