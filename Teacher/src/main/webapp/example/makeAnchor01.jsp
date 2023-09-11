<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>그림</th>
			<th>주소</th>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<a href="htmlTest01.jsp"><!-- 나 자신과 동일한 폴더에 위치하고 있음 -->
					<img alt="항목a" src="./../image/avante.png" width="150" height="90">
				</a>
			</td>
			<td>
				<!-- absolute path : 절대 경로 지정 방식 -->
				<a href="https://www.naver.com/">네이버</a>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<!-- relative path : 상대 경로 지정 방식 -->
				<a href="./../hello.jsp">
					<img alt="항목b" src="./../image/grandeur.png"  width="150" height="90">
				</a>
			</td> 
			<td>
				<a href="https://www.daum.net/">다음</a>
			</td>
		</tr>
	</table>
</body>
</html>