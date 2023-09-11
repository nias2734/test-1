<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="makeForm01To.jsp">
		아이디 : <input name="id" type="text"><br>
		이름 : <input name="name" type="text"><br>
		비밀 번호 : <input name="password" type="password"><br>
		성별 : 
			<input name="gender" type="radio" value="남자">남자
			<input name="gender" type="radio" value="여자" checked="checked">여자<br>
		생일 : <input name="birth" type="date"><br>
		결혼 여부 : 
			<input name="marriage" type="radio" value="결혼">결혼
			<input name="marriage" type="radio" value="미혼">미혼
			<input name="marriage" type="radio" value="이혼">이혼<br>
		급여 : <input name="salary" type="number"><br>
		주소 : <input name="address" type="text"><br>
		매니저 : <input name="manager" type="text"><br>
		이미지 : <input name="image" type="file"> <br>
		히든 : <input name="point" type="hidden" value="1234"><br/>
		읽기 전용 : <input name="readonly" type="text" value="abc" disabled="disabled"><br/>
		취미 :
			<input name="hobby" type="checkbox" value="탁구">탁구
			<input name="hobby" type="checkbox" value="야구">야구
			<input name="hobby" type="checkbox" value="축구">축구<br>		
		가고 싶은 국가 : 
			<select name="country">
				<option value="-">--- 국가를 선택하세요 ---
				<option value="미국">미국
				<option value="일본">일본
				<option value="중국">중국
			</select><br>		
		코멘트 :
			<textarea rows="5" cols="20"></textarea>		
		<br><br>
		<input type="reset" value="초기화"> 
		<input type="submit" value="가입하기">			
	</form>	
</body>
</html>