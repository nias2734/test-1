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
		.container{margin: 10px;}
		#backButton{margin: auto;}
	</style>
</head>
<body>
	<div class="container">
		<h2>[${requestScope.bean.no}]번 게시물 정보</h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">번호</td>
					<td>${requestScope.bean.no}</td>
				</tr>
				<tr>
					<td align="center">작성자</td>
					<td>${requestScope.bean.id}</td>
				</tr>
				<tr>
					<td align="center">글제목</td>
					<td>${requestScope.bean.subject}</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td>${requestScope.bean.content}</td>
				</tr>
				<tr>
					<td align="center">조회수</td>
					<td>${requestScope.bean.readhit}</td>
				</tr>
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기 
			</button>
		</div>
	</div>
</body>
</html>