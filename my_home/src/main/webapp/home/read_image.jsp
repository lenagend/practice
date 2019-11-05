<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goDelete() {
	document.move.action = "../write/delete.html";
	document.move.submit();
}


function goMod() {
	
	document.move.action="../write/modify.html";
	document.move.submit();
	
}
function goReply() {
	document.move.action="../write/writeReplyForm.html";
	document.move.submit();
}

</script>

</head>
<body>
<c:if test="${empty writing }">
존재하지 않는 글입니다
</c:if>
<c:if test="${! empty writing }">
<table  border="1">
<tr><th>글제목</th><td>${writing.title }</td></tr>
<tr><th>작성자</th><td>${writing.writer_name }</td></tr>
<tr><td colspan="2" align="center">
<img alt="" src="${pageContext.request.contextPath }/upload/${writing.image_name }" width="350" height="300"
border="0"></td></tr>
<tr><th>글내용</th><td>${writing.content }</td></tr>
<tr><td colspan="2">
<a href="javascript:goReply()">[답글]</a>
<a href="javascript:goMod()">[수정]</a>
<a href="javascript:goDelete()">[삭제]</a>
<a href="../write/writeList.html">[목록]</a>
</td></tr>
</table>
</c:if>

<form name="move" method="post">
	<input type="hidden" name="id" value="${writing.writing_id}"/>
	<input type="hidden" name="parentid" value="${writing.writing_id }">
	<input type="hidden" name="groupid" value="${writing.group_id }"/>
</form>







</body>
</html>