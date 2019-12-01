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
<style type="text/css">

#seriesList{
   width:35%;
	    height:100%;
	    
	    margin-bottom: 10%;
  		
  		padding-bottom: 5%;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}

#seriesList2{
   width:35%;
	    height:100%;
	    margin-top:5%;
	
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}
#novelTitle{
font-size: 300%;

}
</style>
</head>
<body>

<c:if test="${empty EPI_LIST }">
아직 에피소드가 없습니다
</c:if>
<c:if test="${ ! empty EPI_LIST }">
<div id="seriesList2">

		<div id="novelTitle" align="left">${parentNovel.title }</div>&nbsp;
		<c:if test="${sessionScope.LOGINMEMBER != null }">
		<a href="../novel/favorite.html?novelId=${parentNovel.id }">선호작 등록</a>
		</c:if>
		<br/>
		글 : <strong>${parentNovel.nickname }</strong><br/>
		총 회차: <strong> ${parentNovel.episode }</strong>회 
		</div>
			
		
		<div id="seriesList">
<%-- 		<c:if test="${parentNovel.finish =='yes' }">완결!!!</c:if> --%>
		<div align="left">
		<table >
			<tr>
				<td><img alt="" src="../upload/${parentNovel.image }" width="100" height="150"></td>
				<td>${parentNovel.description }</td>
			</tr>
		</table>
		</div>
<c:set var="startPage" value="${currentPage-(currentPage%10 == 0?10:(currentPage%10))+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>


		<table>
			<tr>
				<td><c:if test="${currentPage > 1 }">
						<a href="../home/loadSeries.html?pageNo=${currentPage -1 }&novelId=${novelId }">[이전]</a>
					</c:if></td>
				<td>
					<table>
					
						<c:forEach var="epi" items="${EPI_LIST }">


							<tr>
								<td>${epi.epi_number }화-</td>
								<td><font size="6"><a href="../home/loadReader.html?epi_number=${epi.epi_number }&pni=${parentNovel.id}&bno=${epi.bno}">${epi.epi_title }</a></font></td>
								<td>조회수:${epi.view_cnt } </td>
								<td>추천수:${epi.reco_cnt } </td>
								<td>댓글수:${epi.repl_cnt }</td>
								<c:if test="${sessionScope.LOGINMEMBER.email == parentNovel.email }">
								<td><a href="../novel/loadModifyEpiForm.html?epiNumber=${epi.epi_number }&parentNovelId=${parentNovel.id}">수정</a></td>
								</c:if>								
							</tr>
						</c:forEach>
					</table>
				</td>
				<td><c:if test="${currentPage < pageCount }">
						<a href="../home/loadSeries.html?pageNo=${currentPage +1 }&novelId=${novelId }">[다음]</a>
					</c:if></td>
			</tr>
		</table>


		<br/>

<c:if test="${startPage > 10 }">
<a href="../home/loadSeries.html?pageNo=${startPage -1 }&novelId=${novelId }">[10전]</a>
</c:if>

<c:forEach var="pageNo" begin="${startPage}" 
						end="${endPage }">
	<c:if test="${pageNo == currentPage }">
		<font size="110%">
		<a href="../home/loadSeries.html?pageNo=${pageNo }&novelId=${novelId }">${pageNo }</a>
		</font>
	</c:if>
	
	<c:if test="${pageNo != currentPage }">
		<a href="../home/loadSeries.html?pageNo=${pageNo }&novelId=${novelId }">${pageNo }</a>
	</c:if>
</c:forEach>




<c:if test="${endPage < pageCount }">
<a href="../home/loadSeries.html?pageNo=${endPage +1 }&novelId=${novelId }">[10후]</a>
</c:if>


<a href="../home/loadSeries.html?pageNo=${pageCount}&novelId=${novelId }">[마지막]</a>

</div>
</c:if>


</body>
</html>