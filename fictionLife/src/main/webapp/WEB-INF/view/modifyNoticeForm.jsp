<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../admin/modifyNotice.html" method="post">
공지번호: ${bno }<br/>
<input type="hidden" name="bno" value="${bno }"><br/>
<input type="text" name="title" value="${title }"><br/>
<textarea rows="10" cols="60" name="content">${content }</textarea>
<input type="submit" value="수정">
</form>
</body>
</html>