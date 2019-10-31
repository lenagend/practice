<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn{
		background-image: url("");
	}
</style>
<script type="text/javascript">
function formCheck(fm) {
	if(fm.idchecked.value==''){
		alert("ID중복 검사를 해주세요");
		return false;
	}
	if(fm.user_name.value==''){
		alert("이름을 입력하세요");
		fm.user_name.focus();
		return false;
	}
	if(fm.user_id.value==''){
		alert("계정을 입력하세요");
		fm.user_id.focus(); return false;
	}
	if(fm.password.value==''){
		alert("암호을 입력하세요"); 
		fm.password.focus();	return false;
	}	
	if(fm.password.value != fm.CONFIRM.value){
		alert("암호가 일치하지 않습니다");
		fm.password.focus();
		return false;
		
	}
	if(!fm.gender[0].checked &&!fm.gender[1].checked){
		alert("성별을 선택하세요");
		fm.gender[0].focus(); return false;
	}
	if(fm.email.value==''){
		alert("이메일을 입력하세요");
		fm.email.focus();
		return false;
	}
	if(fm.job.selectedIndex<1){
		alert("직업을 선택하세요");
		fm.job.focus(); return false;
	}
	if( confirm("입력한 내용이 맞습니까?")){
		return true;
	}else{
		return false;
	}
	
	
}
function idCheck() {
	if(document.frm.user_id.value==''){
		alert("아이디를 입력하세요");
		document.frm.user_id.focus(); return false;
	}
	var url="../idcheck/idcheck.html?ID="+document.frm.user_id.value;
	window.open(url, "_blank", "width=450, height=200");
}
</script>



</head>
<body>
<h2 align="center">개인정보 입력</h2>
<form:form action="../entry/entry.html" modelAttribute="user" method="post" 
 onsubmit="return formCheck(this)" name="frm">
<input type="hidden" name="idchecked" id="idchecked"/>
이름: <form:input path="user_name" /><br/>
아이디: <form:input path="user_id" /> 
<input type="button" value="중복 검사" onclick="idCheck()"><br/>
패스워드: <form:password path="password"/><br/>
패스워드 확인: <input type="password" name="CONFIRM"><br/>
성별: 남<form:radiobutton path="gender" value="M"/>
여<form:radiobutton path="gender" value="F"/><br/><br/>
메일: <form:input path="email"/><br/>
직업: <form:select path="job">
<form:option value="--선택하세요--"/><form:option value="회사원"/><form:option value="학생"/><form:option value="기타"/>
</form:select><br/><br/>
<input type="submit" value="확인" class="btn"/>
<input type="reset" value="취소"/>
</form:form>






</body>
</html>