<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회사 : ${applicationScope.map['company']}<br/>
	대표 : ${applicationScope.map['ceo']}<br/>
	이메일 : ${applicationScope.map['email']}<br/>
	전화 : ${applicationScope.map['phone']}<br/>
	업로드 경로 : ${applicationScope.map['uploadPath']}<br/>
</body>
</html>