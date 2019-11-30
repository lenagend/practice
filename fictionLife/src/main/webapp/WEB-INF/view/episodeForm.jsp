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
	<h2>연재</h2>
	<form:form id="regiForm" modelAttribute="novel_board" method="post" action="../novel/regiEpi.html">
	<form:hidden path="novel_id" value="${novelId }"/>
	
		<table>
			<tr>	
				<td><input type="text" value="작품 제목: ${novelTitle }" readonly="readonly"></td>
			</tr>
			<tr>	
				<td><form:input path="epi_number" value="${epinum }" readonly="true"/>화</td>
			</tr>
			<tr>	
				<td><form:input path="epi_title" placeholder="에피소드 제목"/></td>
			</tr>
			<tr>	
				<td><form:errors path="epi_title"/></td>
			</tr>
			<tr>	
				<td><form:textarea path="content" placeholder="본문"/></td>
			</tr>
			<tr>	
				<td><form:errors path="content"/></td>
			</tr>
			<tr>
				<td><a href="javascript:finish();">이 화를 완결로 등록하기</a></td>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
		<input type="hidden" id="finish" name="finish">
	</form:form>
	<script type="text/javascript">
	function finish(){
	
		$("#finish").val("finish");
		$("#regiForm").submit();
	}
	
	</script>
</body>
</html>