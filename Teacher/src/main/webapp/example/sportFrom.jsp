<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>     
<%@ include file="./../common/common.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body{margin: 10px;}
	</style>
</head>
<body>
	<br/>
	<form action="<%=appName%>/Sport" method="post">
		운동 경기 :
		<select name="command">
			<option value="-">-- 항목을 선택해 주세요.
			<option value="baseball">야구
			<option value="football" selected="selected">축구
		</select>		
		<input type="submit" value="전송">	
	</form>
</body>
</html>