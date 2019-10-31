<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">게시글 목록</h3>

	<table border="1">
		<tr>
			<th width="60">글번호</th>
			<th width="300">글제목</th>
			<th width="80">작성자</th>
			<th width="110">작성일</th>
		</tr>

		<c:forEach items="${BBS_LIST }" var="cnt">
		<tr><td>${cnt.seqno }</td>
		<td><a href="../read/readDetail.html?SEQNO=${cnt.seqno} ">${cnt.title }</a></td>
		<td>${cnt.id }</td>
		<td>${cnt.bbs_date }</td>
		</tr>
		</c:forEach>


	</table>

	<c:forEach var="page" begin="1" end="${COUNT }">
		<a href="../read/read.html?pageNo=${page }">${page }</a>
	</c:forEach>


</body>
</html>