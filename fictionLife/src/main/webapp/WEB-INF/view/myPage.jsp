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

</head>
<body>
<a href="../home/loadModifyMember.html">개인정보수정</a>
<a href="../home/loadMyPage.html">내 작품</a>
<a href="../home/loadMyPage2.html">관심작품</a>


<c:if test="${CONTENTNAME == 'MYFAVORITE' }">


<c:if test="${empty NOVEL_LIST }">
<a href="../home/loadRegiNovel.html">#선호작이 없습니다.</a>
</c:if>

<c:if test="${!empty NOVEL_LIST }">


<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>


	<table>
		<tr>
			<td>
				<c:if test="${currentPage > 1 }">
						<a href="../home/loadMyPage2.html?pageNo=${currentPage -1 }">[이전]</a>
				</c:if>
			</td>
				<td>
					<table>
		<c:forEach items="${NOVEL_LIST }" var="cnt">
			<tr>
				<td>${cnt.type }</td>
				<td>
					<img alt="" src="../upload/${cnt.image }" width="100"	height="150">
				</td>
				<td>
					<table>
						<tr>
							<td>
								<a href="../home/loadSeries.html?novelId=${cnt.id }">${cnt.title }</a>
							</td>
						</tr>
						<tr>
							<td>
								${cnt.nickname } 작가님
							</td>
						</tr>
					</table>
				</td>
				<td>${cnt.episode }화 업로드!!</td>
				<td><a href="../novel/deleteFavorite.html?novelId=${cnt.id }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
				</td>
				<td>
				<c:if test="${currentPage < pageCount }">
						<a href="../home/loadMyPage2.html?pageNo=${currentPage +1 }">[다음]</a>
				</c:if>
				</td>
			</tr>

	</table>


		<br/>

<c:if test="${startPage > 10 }">
<a href="../home/loadMyPage2.html?pageNo=${startPage -1 }">[10전]</a>
</c:if>

<c:forEach var="pageNo" begin="${startPage}" 
						end="${endPage }">
	<c:if test="${pageNo == currentPage }">
		<font size="110%">
		<a href="../home/loadMyPage2.html?pageNo=${pageNo }">${pageNo }</a>
		</font>
	</c:if>
	
	<c:if test="${pageNo != currentPage }">
		<a href="../home/loadMyPage2.html?pageNo=${pageNo }">${pageNo }</a>
	</c:if>
</c:forEach>




<c:if test="${endPage < pageCount }">
<a href="../home/loadMyPage2.html?pageNo=${endPage +1 }">[10후]</a>
</c:if>


<a href="../home/loadMyPage2.html?pageNo=${pageCount}">[마지막]</a>

<br/>











</c:if>

</c:if>











<c:if test="${CONTENTNAME == 'MYNOVEL' }">

<c:if test="${empty NOVEL_LIST }">
<a href="../home/loadRegiNovel.html">#작품이 없습니다 새로 작품을 동록하세요</a>
</c:if>

<c:if test="${!empty NOVEL_LIST }">



<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>


	<table>
		<tr>
			<td>
				<c:if test="${currentPage > 1 }">
						<a href="../home/loadMyPage.html?pageNo=${currentPage -1 }">[이전]</a>
				</c:if>
			</td>
				<td>
					<table>
		<c:forEach items="${NOVEL_LIST }" var="cnt">
			<tr>
				<td>${cnt.type }</td>
				<td><img alt="" src="../upload/${cnt.image }" width="100"
					height="150"></td>
				<td>
					<table>
						<tr>
							<td><a href="../home/loadEpisodeForm.html?novelId=${cnt.id }&novelTitle=${cnt.title}">#연재하러 가기</a></td>
						</tr>
						<tr>
							<td><a href="../home/loadSeries.html?novelId=${cnt.id }">${cnt.title }</a></td>
						</tr>
							<tr>
							<td>선호작 ${cnt.favorite_num }회 등록!</td>
						</tr>
					</table>

				</td>
				<td>${cnt.regi_date }</td>
				<td><a
					href="../home/loadModiNovel.html?novelId=${cnt.id }&novelImage=${cnt.image}">수정</a>
					<br /> <a href="../home/loadDeleteNovel.html?novelId=${cnt.id }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
				</td>
				<td>
				<c:if test="${currentPage < pageCount }">
						<a href="../home/loadMyPage.html?pageNo=${currentPage +1 }">[다음]</a>
				</c:if>
				</td>
			</tr>

	</table>


		<br/>

<c:if test="${startPage > 10 }">
<a href="../home/loadMyPage.html?pageNo=${startPage -1 }">[10전]</a>
</c:if>

<c:forEach var="pageNo" begin="${startPage}" 
						end="${endPage }">
	<c:if test="${pageNo == currentPage }">
		<font size="110%">
		<a href="../home/loadMyPage.html?pageNo=${pageNo }">${pageNo }</a>
		</font>
	</c:if>
	
	<c:if test="${pageNo != currentPage }">
		<a href="../home/loadMyPage.html?pageNo=${pageNo }">${pageNo }</a>
	</c:if>
</c:forEach>




<c:if test="${endPage < pageCount }">
<a href="../home/loadMyPage.html?pageNo=${endPage +1 }">[10후]</a>
</c:if>


<a href="../home/loadMyPage.html?pageNo=${pageCount}">[마지막]</a>

<br/>
<a href="../home/loadRegiNovel.html">#작품 더 등록하기</a>

</c:if>
</c:if>
</body>
</html>