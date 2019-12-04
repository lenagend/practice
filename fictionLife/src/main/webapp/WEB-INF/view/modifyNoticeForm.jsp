<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#loginFormDiv{
   width:510px;
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
 width:300px;
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
<form action="../admin/modifyNotice.html" method="post">
공지번호: ${bno }<br/>
<input class="input" type="hidden" name="bno" value="${bno }"><br/>
<input class="input" type="text" name="title" value="${title }"><br/>
<textarea rows="10" cols="60" name="content">${content }</textarea>
<input class="button" type="submit" value="수정">
</form>
</div>
</body>
</html>