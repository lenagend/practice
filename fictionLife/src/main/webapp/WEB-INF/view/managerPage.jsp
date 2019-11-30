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
관리자 페이지
<div>
유저신고글

<c:if test="${empty REPORTS }">
신고글이 없습니다
</c:if>


<c:if test="${!empty REPORTS }">

<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>


			<table>
				<tr>
					<td><c:if test="${currentPage > 1 }">
							<a href="../admin/loadAdminPage.html?pageNo=${currentPage -1 }">[이전]</a>
						</c:if></td>
					<td>
						<table>
							<c:forEach items="${REPORTS }" var="cnt">
								<tr>
									<td>글 번호: ${cnt.seqno }</td>
									<td>제목: ${cnt.title }</td>
									<td>신고자: ${cnt.email }</td>
									<td>등록일: ${cnt.regi_date }</td>

								</tr>
								<tr>
									<td><p>
											<font color="red">${cnt.content }</font>
										</p></td>
								</tr>
							</c:forEach>
						</table>
					</td>
					<td><c:if test="${currentPage < pageCount }">
							<a href="../admin/loadAdminPage.html?pageNo=${currentPage +1 }">[다음]</a>
						</c:if></td>
				</tr>

			</table>


			<br />

			<c:if test="${startPage > 10 }">
				<a href="../admin/loadAdminPage.html?pageNo=${startPage -1 }">[10전]</a>
			</c:if>

			<c:forEach var="pageNo" begin="${startPage}" end="${endPage }">
				<c:if test="${pageNo == currentPage }">
					<font size="110%"> <a
						href="../admin/loadAdminPage.html?pageNo=${pageNo }">${pageNo }</a>
					</font>
				</c:if>

				<c:if test="${pageNo != currentPage }">
					<a href="../admin/loadAdminPage.html?pageNo=${pageNo }">${pageNo }</a>
				</c:if>
			</c:forEach>




			<c:if test="${endPage < pageCount }">
<a href="../admin/loadAdminPage.html?pageNo=${endPage +1 }">[10후]</a>
</c:if>


<a href="../admin/loadAdminPage.html?pageNo=${pageCount}">[마지막]</a>

<br/>


</c:if>

</div>
<div>
공지사항 쓰기
<form action="../admin/notice.html" method="post">
<input type="text" name="title" placeholder="공지 제목"/><br/>
<textarea rows="10" cols="80" name="content">공지 내용</textarea><br/>
<input type="submit" value="확인">
</form>
</div>

<div>
유저 블라인드
<form action="../admin/userBlind.html" method="post">
<input type="text" name="nickname"><input type="submit">
</form>

</div>
<div>
유저 블라인드 풀기
<form action="../admin/userBlind2.html" method="post">
<input type="text" name="nickname"><input type="submit">
</form>

</div>

<div>
작품 블라인드
<form action="../admin/novelBlind.html" method="post">
<input type="text" name="id"><input type="submit">
</form>

</div>
<div>
작품 블라인드 풀기
<form action="../admin/novelBlind2.html" method="post">
<input type="text" name="id"><input type="submit">
</form>

</div>
</body>
</html>