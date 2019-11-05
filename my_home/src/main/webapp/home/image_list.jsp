<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty LIST }">
등록된 게시글이 없습니다.
</c:if>
<c:if test="${ ! empty LIST }">
<table width="100%">
	<tr><td align="right">
	<b>${startRow } ~ ${endRow } / ${count }</b></td></tr>
</table>

<table border="1" width="100%">
	<tr><th>이미지</th><th>글제목</th><th>작성자</th>
	<th>작성일</th><th>다운로드</th></tr>
<c:forEach var="w" items="${LIST }">
	<tr><td><img alt="" 
	src="${pageContext.request.contextPath }/upload/${w.image_name }"
				width="50" height="50"></td>
	<td><a href="javascript:goView(${w.writing_id })">
	${w.title }</a>
	</td><td>${w.writer_name }</td>
	<td>${w.register_date }</td>
	<td>${w.image_name }
	<a href="javascript:goDown('${w.image_name }')">
	다운로드</a></td>
	</tr>
</c:forEach>
</table><br/>
<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>

<c:if test="${startPage > 10 }">
<a href="javascript:goPage(${startPage -1 })">[이전]</a>
</c:if>
<c:forEach var="pageNo" begin="${startPage}" 
						end="${endPage }">
	<c:if test="${pageNo == currentPage }">
		<font size="6">
	</c:if>
	<a href="javascript:goPage(${pageNo })">${pageNo }</a>
	<c:if test="${pageNo == currentPage }">
		</font>
	</c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
<a href="javascript:goPage(${endPage + 1 })">[다음]</a>
</c:if>

</c:if>
<script type="text/javascript">
function goPage(page){
	document.move.action="image-list";
	document.move.page.value=page;
	document.move.submit();
}
function goDown(name){
	document.move.name.value = name;
	document.move.action="download.do";
	document.move.submit();
}
function goView(id){
	document.move.id.value = id;
	document.move.action="../read/readImage.html";
	document.move.submit();
}
</script>
<form name="move" method="post">
	<input type="hidden" name="name"/>
	<input type="hidden" name="id"/>
	<input type="hidden" name="page" />
</form>
</body>
</html>












