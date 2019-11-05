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
<h3 align="center">장바구니 관리</h3>
<c:choose>
	<c:when test="${CART_LIST ==null ||SIZE=='NO'}">
		장바구니가 비었습니다
	</c:when>
	<c:otherwise>
		<table border="2">
			<tr><th width="70">상품코드</th><th width="250">상품이름</th>
			<th width="80">상품가격</th><th width="50">상품갯수</th>
			<th width="100">가격</th><th width="80">수정/삭제</th></tr>
			<c:forEach var="cnt" items="${CART_LIST }">
			<form action="../cart/modify.html" method="post">
			<input type="hidden" name="CODE"  value="${cnt.code}">
			<tr><td>${cnt.code}</td>
			<td>${cnt.name}</td>
			<td><fmt:formatNumber groupingUsed="true">
			${cnt.price}
			</fmt:formatNumber>
			</td>
			<td><input type="text" name="NUMBER" value="${cnt.num}" size="3"> </td>
			<td><fmt:formatNumber groupingUsed="true">
			${cnt.price * cnt.num }
			</fmt:formatNumber></td>
			<td><input type="submit" value="수정" name="BTN"/>
			<input type="submit" value="삭제" name="BTN"/></td>
			</tr>
			</form>
			</c:forEach>
			
		</table>
		<!-- 총액, 결제, 취소버튼 만든다 -->
		<form action="" method="post">
		총 합 : <fmt:formatNumber groupingUsed="true">
		${totalAmount }
		</fmt:formatNumber>
		<input type="submit" value="결제하기"> 
		<input type="reset" value="취 소">
		</form>
	</c:otherwise>

</c:choose>

</body>
</html>