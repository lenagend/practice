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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.text_link{
font-size: 150%;


}
.menu{
font-size: 200%;

}
#loginButton{
width: 100%;
border: 1;
font-family: 맑은 고딕;
background-color: white;
color black;
}

#div_notice{
  width:40%;
	    height:100%;
	    margin-top: none;
	    margin-bottom:3%;
  		padding-top: none;
  		padding-bottom:  none;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		padding-left:5%;
  		padding-right:5%;
  		border: 1px solid black;

}
#div_board{

  width:40%;
	    height:100%;
	    margin-top:none;
	    margin-bottom: 3%;
  		padding-top: none;
  		padding-bottom:  none;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}
.imageContents{
 width:40%;
	    height:100%;
	    margin-top:none;
	    margin-bottom: 3%;
  		padding-top: none;
  		padding-bottom:  none;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}

</style>
</head>

<body>
<script type="text/javascript">
function loginButton(){
	location.href="../home/loadLogin.html";
}
</script>
	
	<div data-role="page">	
		<div data-role="header"> <!-- 로고, 로그인 메뉴 -->
			<div align="center">
			<table>
				<tr>
					<td><a href="../home/goMain.html"><img alt="" src="../cssImage/FictionLife.png"></a></td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.LOGINMEMBER == null }">
									<button id="loginButton" onclick="loginButton();">로그인</button>
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
			<div class="imageContents"><!-- 첫번째 이미지 슬라이드와 그 소개 -->
				<table>
					<tr>
						<td><div class="menu"> #TOP5 작가님들 작품 </div></td>
						
						
					</tr>
					<tr>
						<td align="center">
						<c:if test="${! empty TOP5_LIST  }">
						
					
						<table>
								<tr>
								<td><img alt="" src="../cssImage/crown1.png"></td>
								<td><img alt="" src="../cssImage/crown2.png"></td>
								<td><img alt="" src="../cssImage/crown3.png"></td>
								<td><img alt="" src="../cssImage/crown4.png"></td>
								<td><img alt="" src="../cssImage/crown5.png"></td>
								</tr>
								<tr>
								<c:forEach items="${TOP5_LIST }" var="top">
								
								
								<td>
								<a href="../home/loadSeries.html?novelId=${top.id }">
								<img alt="" src="../upload/${top.image }" width="100" height="150"  >
								</a>
								</td>
								
									</c:forEach>
									</tr>
								</table>
							
						
							</c:if>
						</td>
							
					</tr>
					</table>
					</div>
					<div class="imageContents">
					<table>
					<tr>
						<td><div class="menu"> #오늘 추천수 TOP5 </div></td>
					</tr>
					<tr>
						<td align="center">
							<table>
								<tr>
									<td><img alt="" src="../cssImage/crown1.png"></td>
								<td><img alt="" src="../cssImage/crown2.png"></td>
								<td><img alt="" src="../cssImage/crown3.png"></td>
								<td><img alt="" src="../cssImage/crown4.png"></td>
								<td><img alt="" src="../cssImage/crown5.png"></td>
								</tr>
								<tr>
								<c:forEach items="${TOP10_LIST }" var="top2">
								<td>
								<a href="../home/loadSeries.html?novelId=${top2.id }">
								<img alt="" src="../upload/${top2.image }" width="100" height="150"  ></a>
								</td>
								</c:forEach>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</div>
			
		
			
			<div id="div_notice">
			<c:if test="${! empty NOTICE_LIST }">			
			<table class="table table-striped">
			<thead>
				<tr>
					<td><div class="menu">#공지사항</div></td>
				</tr>
				<tr>
					<th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${NOTICE_LIST }" var="notice"> 
					<tr>
						<td><a id="notice" href="../home/loadNoticeReader.html?content=${notice.content }">${notice.title }</a></td>
						<td>${notice.nickname }</td>
						<td>${notice.regi_date }</td>
					</tr>
				
				</c:forEach>
			</tbody>
			</table>
			<div align="left" class="text_link"><a href="../home/loadNotice.html">more...</a></div>
			</c:if>
			</div>
			
			
			<div id="div_board" align="center"><!-- 연재게시판 -->
				<table>
					<tr>
						<td><div align="left" class="menu">#연재 게시판</div></td>
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
						<td><div class="text_link">
							<a href="../home/goMain.html">전체</a>&nbsp;&nbsp;
							<a href="../home/goMain.html?novelType=판타지">판타지</a>&nbsp;&nbsp;
							<a href="../home/goMain.html?novelType=무협">무협</a>&nbsp;&nbsp;
							<a href="../home/goMain.html?novelType=로맨스">로맨스</a>&nbsp;&nbsp;
							<a href="../home/goMain.html?novelType=기타">기타</a>
						</div>
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
				
				</tr>
			</table>
		</div>
	</div>	
</div>
</body>
</html>