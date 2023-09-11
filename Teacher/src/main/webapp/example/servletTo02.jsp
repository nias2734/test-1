<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>개별 변수 바인딩</h3>
		상품 번호 : ${requestScope.pnum}<br/>
		상품명 : ${requestScope.name}<br/>
		제조 회사 : ${requestScope.company}<br/>
		단가 : ${requestScope.price}<br/>
	<hr/>
	<h3>bean 객체 바인딩</h3>
		상품 번호 : ${requestScope.bean.pnum}<br/>
		상품명 : ${requestScope.bean.name}<br/>
		제조 회사 : ${requestScope.bean.company}<br/>
		단가 : ${requestScope.bean.price}<br/>
	<hr/>
	<h3>세션 영역 바인딩</h3>
		전화 : ${sessionScope.tel}<br/>
		팩스 : ${sessionScope.fax}<br/>		
	<hr/>
	<h3>application 영역 바인딩</h3>
		메시지 : ${applicationScope.world}<br/> 
	<hr/>		
</body>
</html>