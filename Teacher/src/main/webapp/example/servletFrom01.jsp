<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>    
<%@ include file="./../common/common.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="<%=appName%>/hello" method="post">
		아이디 : <input type="text" name="id" value="park"><br/>
		이름 : <input type="text" name="name" value="박영희"><br/>
		나이 : <input type="text" name="age" value="30"><br/>
		취미 : 
			<input type="checkbox" name="hobby" value="탁구">탁구
			<input type="checkbox" name="hobby" value="축구" checked="checked">축구
			<input type="checkbox" name="hobby" value="농구">농구
			<input type="checkbox" name="hobby" value="야구">야구
			<br/>
		<input type="submit" value="전송">	
	</form>
</body>
</html>