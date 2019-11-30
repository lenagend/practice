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
<meta name="viewport" content="width=device-width, initial-scale=1">

 <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<style type="text/css">

</style>
</head>

<body>
	
	<div data-role="page">	
		<div data-role="header"> <!-- 로고, 로그인 메뉴 -->
			<div align="center">
			<table>
				<tr>
					<td><a href="../home/goMain.html"><img alt="" src="../cssImage/FictionLife.png"></a></td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.LOGINMEMBER == null }">
									<a href="../home/loadLogin.html">로그인</a>
							</c:when>
							<c:otherwise>
								<jsp:include page="${LOGINRESULT }"></jsp:include>
							</c:otherwise>
						</c:choose>				
					</td>
				</tr>
				
			</table>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<div data-role="content">
		<div id="content" align="center">
			<c:choose>
				<c:when test="${BODY == null }">
			<div><!-- 첫번째 이미지 슬라이드와 그 소개 -->
				<table>
					<tr>
						<td>#TOP5 작가님들 작품</td>
						
						
					</tr>
					<tr>
						<td align="center">
						<c:if test="${! empty TOP5_LIST  }">
						
					
						
								<c:forEach items="${TOP5_LIST }" var="top">
								<a href="../home/loadSeries.html?novelId=${top.id }">
								<img alt="" src="../upload/${top.image }" width="200" height="300"  >
								</a>
								</c:forEach>
						
							</c:if>
						</td>
							
					</tr>
					<tr>
						<td align="center">
						<c:if test="${ empty TOP10_LIST }">
						오늘 추천받은 글이 없습니다 ㅠ
						</c:if>
						
						<c:if test="${! empty TOP10_LIST }">
								<c:forEach items="${TOP10_LIST }" var="top2">
								<a href="../home/loadSeries.html?novelId=${top2.id }">
								<img alt="" src="../upload/${top2.image }" width="200" height="300"  >
								</a>
								</c:forEach>
						
						</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div>
			<c:if test="${! empty NOTICE_LIST }">
			<table>
				<c:forEach items="${NOTICE_LIST }" var="notice"> 
					<tr>
						<td><a href="">${notice.title }</a></td>
						<td>${notice.nickname }</td>
						<td>${notice.regi_date }</td>
					</tr>
					<tr>
						<td>
						${notice.content }
						</td>
					</tr>
				</c:forEach>
			</table>
			</c:if>
			</div>
			<div><!-- 연재게시판 -->
				<table>
					<tr>
						<td>#연재 게시판</td>
					</tr>
					<tr>
						<td>
							<c:choose>
								<c:when test="${BOARD != null }">
									<jsp:include page="${BOARD }"/>
								</c:when>
								<c:otherwise>
									연재게시판은 아직 준비중입니다
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>
							<a href="../home/goMain.html">전체</a>
							<a href="../home/goMain.html?novelType=판타지">판타지</a>
							<a href="../home/goMain.html?novelType=무협">무협</a>
							<a href="../home/goMain.html?novelType=로맨스">로맨스</a>
							<a href="../home/goMain.html?novelType=기타">기타</a>
						</td>						
				
					</tr>
				</table>
			</div>		
			</c:when>
			<c:otherwise>
				<jsp:include page="${BODY }"></jsp:include>
			</c:otherwise>	
			</c:choose>
			</div>
		
		</div>
		
		<div data-role="footer">
		<div align="center">
			<table>
				<tr>
					<td>
						<table>
							<tr><td>대표: 김광민</td></tr>
							<tr><td>문의전화: 010-7159-2578</td></tr>
						</table>
					</td>
					<td>
						<a href="../home/loadNotice.html">공지사항</a>
					</td>
				</tr>
			</table>
		</div>
	</div>	
</div>
</body>
</html>