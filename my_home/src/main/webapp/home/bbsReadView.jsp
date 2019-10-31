<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content{ 
height :100px;
width : 100%;
border : 1px solid blue;}

</style>

</head>
<body>
<h2 align="center">게시글 읽기</h2>
[글번호] : ${BBS_ITEM.seqno }<br/>
[글제목] : ${BBS_ITEM.title }<br/>
[작성자] : ${BBS_ITEM.id }<br/>
[작성일] : ${BBS_ITEM.bbs_date }<br/>
<div id="content">

<textarea rows="5" cols="20"> ${BBS_ITEM.content } </textarea> 

</div>


</body>
</html>