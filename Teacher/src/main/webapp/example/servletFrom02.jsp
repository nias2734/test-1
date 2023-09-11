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
	<form action="<%=appName%>/world" method="post">
		번호 : <input type="text" name="pnum" value="10"><br/>
		상품명 : <input type="text" name="name" value="명품 과자"><br/>
		제조사 : <input type="text" name="company" value="갑을 식품"><br/>
		단가 : <input type="text" name="price" value="12345"><br/>
			<br/>
		<input type="submit" value="전송">	
	</form>
</body>
</html>