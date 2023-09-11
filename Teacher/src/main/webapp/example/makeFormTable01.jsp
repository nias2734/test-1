<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>	
</head>
<body>
	<h1>폼과 테이블</h1>
	<form action="">
		<table border="1">
			<tr>
				<td width="20%" align="center">이름</td>
				<td width="80%" align="left">
					<input type="text" name="name">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">나이</td>
				<td width="80%" align="left">
					<input type="text" name="age">
				</td> 
			</tr>		
			<tr>
				<td width="20%" align="center">이미지</td>
				<td width="80%" align="left">
					<input type="file" name="image">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">숨김 파라미터</td>
				<td width="80%" align="left">
					<input type="hidden" name="money" value="1200000">
				</td> 
			</tr>		
			<tr>
				<td width="20%" align="center">성별</td>
				<td width="80%" align="left">
					<input type="radio" name="gender" value="1" checked="checked">남자
					<input type="radio" name="gender" value="2">여자
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">취미</td>
				<td width="80%" align="left">
					<input type="checkbox" name="hobby" value="당구">당구
					<input type="checkbox" name="hobby" value="축구" checked="checked">축구
					<input type="checkbox" name="hobby" value="야구" checked="checked">야구
					<input type="checkbox" name="hobby" value="농구">농구
				</td> 
			</tr>		
			<tr>
				<td width="20%" align="center">직업</td>
				<td width="80%" align="left">
					<select name="job">
						<option value="-">-- 선택해 주세요
						<option value="의사">의사
						<option value="판사" selected="selected">판사
						<option value="변호사">변호사
						<option value="검사">검사			
					</select>
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">코멘트</td>
				<td width="80%" align="left">
					<textarea name="comment" rows="10" cols="50"></textarea>
				</td> 
			</tr>
			<tr>
				<td align="left" colspan="2">
					&nbsp;&nbsp;
					<input type="submit" value="전송">
					&nbsp;&nbsp;&nbsp;
					<input type="reset" value="초기화">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>