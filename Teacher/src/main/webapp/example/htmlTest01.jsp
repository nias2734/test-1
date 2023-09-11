<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html 주석 -->
	<h1>폼 양식</h1>
	<form action="htmlTest01To.jsp">
		<label>이름 : </label>
		<input type="text" name="name" value="홍길동">
		<br/><!-- br 태그는 엔터키 효과 -->
		<label>나이 : </label>
		<input type="text" name="age">
		<br/>
		<label>이미지 : </label>
		<input type="file" name="image">
		<br/>
		<label>숨김 파라미터 : </label>
		<input type="hidden" name="money" value="1200000">
		<br/>
		<label>성별 : </label>
		<input type="radio" name="gender" value="1" checked="checked">남자
		<input type="radio" name="gender" value="2">여자
		<br/>
		<label>취미 : </label>
		<input type="checkbox" name="hobby" value="당구">당구
		<input type="checkbox" name="hobby" value="축구" checked="checked">축구
		<input type="checkbox" name="hobby" value="야구" checked="checked">야구
		<input type="checkbox" name="hobby" value="농구">농구
		<br/>
		<label>직업 : </label>
		<select name="job">
			<option value="-">-- 선택해 주세요
			<option value="의사">의사
			<option value="판사" selected="selected">판사
			<option value="변호사">변호사
			<option value="검사">검사			
		</select>
		<br/>
		<label>코멘트 : </label>
		<textarea name="comment" rows="10" cols="50"></textarea>
		<br/>
		<br/>
		<input type="submit" value="전송">
		
		<!-- entity : 특수 문자나 whitecharacter 등을 표현하기 위한 기법 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input type="reset" value="초기화">
	</form>
</body>
</html>