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
#loginFormDiv{
   width:35%;
	    height:100%;
	    margin-top:5%;
	    margin-bottom: 30%;
  		padding-top: 20%;
  		padding-bottom: 5%;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		
  		border: 1px solid black;
}
.input{

  width:300px;
  height:50px;
  font-size:150%;
  font-family: Malgun Gothic;
 
}

.button{
 width:150px;
  height:50px;
  font-family: Malgun Gothic;
 background-color: #66CCFF;
 font-size:150%;
 color: #003399;
}



</style>
</head>
<body>
	
	<div id="loginFormDiv">
		<form:form id="modifyForm" modelAttribute="member" action="../login/doMemberModify.html" method="post">
			
			<table>
				<tr>
					<td>비밀번호만 변경 가능합니다</td>
				</tr>
				<tr>
					<td>
						<form:input class="input" path="email" value="${member.email }" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:password class="input" path="password" placeholder="기존 비밀번호" id="pwd"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="password"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:password class="input" path="newPassword" placeholder="바꿀 비밀번호" id="newPwd"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="newPassword"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:password class="input" path="rePwd" placeholder="바꿀 비밀번호 확인" />
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="rePwd"/></font>
					</td>
				</tr>
				<tr>
					<td>
						<form:input class="input" path="nickname" value="${member.nickname }" readonly="true" />
					</td>
				</tr>
			
				<tr>
					<td>
						<form:input class="input" path="phone" value="${member.phone }" readonly="true" />
					</td>
				</tr>
				<tr>
					<td>
						<font color="red"><form:errors path="phone"/></font>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="변경" onclick="modi();" class="button" />
					<input type="button" value="탈퇴" onclick="quit();" class="button"/></td>
				</tr>
			</table>
			<form:hidden path="act" id="act"/>
		</form:form>
	</div>
	<script type="text/javascript">
	function modi(){
		 document.getElementById("act").value='수정';
		document.getElementById("modifyForm").submit();

	};
	
	function quit() {
		 document.getElementById("act").value='탈퇴';
		document.getElementById("modifyForm").submit();
	};
	
	</script>
</body>
</html>