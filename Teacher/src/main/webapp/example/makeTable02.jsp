<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>표 만들기</h1>
	<table border="1">
		<thead>
		</thead>
		<tbody>
			<tr>
				<td align="center" width="10%">가</td>
				<td align="center" width="10%">나</td>
				<td align="center" width="10%">다</td>
				<td align="center" width="10%">라</td>
				<td align="center" width="10%">마</td>
				<td align="center" width="10%">바</td>
				<td align="center" width="10%">사</td>			
			</tr>		
			<tr>
				<td align="center" colspan="3">세부 설명</td>
				<td align="left" colspan="4">어쩌구 저쩌구~~~</td>			
			</tr>		
			<tr>
				<td align="center" rowspan="2" colspan="2">코멘트</td>
				<td align="left" colspan="5">가나다 abc 123</td>				
			</tr>
			<tr>
				<td align="left" colspan="5">hello world</td>				
			</tr>			
		</tbody>
	</table>	
</body>
</html>

