<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty param.id }">
<script type="text/javascript">

alert("변경되었습니다");
location.href="../write/writeList.html?SEQNO="+${param.id};
</script>

</c:if>
</body>
</html>