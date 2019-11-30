<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty NOTICE_LIST }">
 공지사항이 없습니다
</c:if>

<c:if test="${!empty NOTICE_LIST }">



<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>


	
					<table>
					<tr>
						<td>제목</td>
						<td>운영자</td>
						<td>작성일</td>
					</tr>
		<c:forEach items="${NOTICE_LIST }" var="cnt">
			<c:if test="${cnt.blind != 'yes' }">			
			<tr>
			
				<td>${cnt.title }</td>
				<td>${cnt.nickname }</td>
				<td>${cnt.regi_date }</td>
			
				<td>
					<c:if test="${LOGINMEMBER.nickname == cnt.nickname }">
					<a href="../admin/loadModifyNoticeForm.html?bno=${cnt.bno }&title=${cnt.title}&content=${cnt.content}">수정</a>
					<br /> <a href="../admin/deleteNotice.html?bno=${cnt.bno }">삭제</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<div id="${cnt.bno }">
					<textarea readonly="readonly">${cnt.content }</textarea>
					</div>
				</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>

		<br/>

<c:if test="${startPage > 10 }">
<a href="../home/loadNotice.html?pageNo=${startPage -1 }">[10전]</a>
</c:if>

<c:forEach var="pageNo" begin="${startPage}" 
						end="${endPage }">
	<c:if test="${pageNo == currentPage }">
		<font size="110%">
		<a href="../home/loadNotice.html?pageNo=${pageNo }">${pageNo }</a>
		</font>
	</c:if>
	
	<c:if test="${pageNo != currentPage }">
		<a href="../home/loadNotice.html?pageNo=${pageNo }">${pageNo }</a>
	</c:if>
</c:forEach>




<c:if test="${endPage < pageCount }">
<a href="../home/loadNotice.html?pageNo=${endPage +1 }">[10후]</a>
</c:if>


<a href="../home/loadMyPage.html?pageNo=${pageCount}">[마지막]</a>


</c:if>
</body>
</html>