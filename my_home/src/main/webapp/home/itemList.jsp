<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">상품 목록</h2>
<table border="1">
	<tr><td width="40">상품코드</td>
	<td width="150">상품이름</td>
	<td width="100">상품가격</td>
	<td width="100">원산지</td></tr>
	<c:forEach var="item" items="${ITEM_LIST }">
		<tr>
		<td>${item.code }</td>
		<td><a href="../read/readItem.html?CODE=${item.code }">${item.name }</a></td>
		<td>
		<fmt:formatNumber groupingUsed="true">
		 ${item.price }
		</fmt:formatNumber> 
		</td>
		<td>${item.origin }</td>
		<td>
		<a href="#" onclick="window.open('../cart/addCart.html?CODE=${item.code}','cart','width=400, height=250').focus()">장바구니 담기</a>
		</td></tr>
	</c:forEach>

	
</table>
	
	<c:forEach var="page" begin="1" end="${COUNT }">
		<a href="../read/read.html?pageNo=${page }">${page }</a>
	</c:forEach>
	
</body>
</html>