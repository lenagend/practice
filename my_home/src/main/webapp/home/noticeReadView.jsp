<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">공지사항 읽기</h2>
[글번호] : ${NOTICE_ITEM.seqno }<br/>
[글제목] : ${NOTICE_ITEM.title }<br/>
[작성자] : ${NOTICE_ITEM.id }<br/>
[작성일] : ${NOTICE_ITEM.notice_date }<br/>
<div id="content">

<textarea rows="5" cols="20"> ${NOTICE_ITEM.content } </textarea> 

</div>


</body>
</html>