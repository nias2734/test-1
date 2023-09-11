<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="makeForm01To.jsp">
		<table border="1">
			<tr>
				<td width="20%" align="center">아이디</td>
				<td width="80%" align="left">
					<input type="text" name="id">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">이름</td>
				<td width="80%" align="left">
					<input type="text" name="name">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">비밀 번호</td>
				<td width="80%" align="left">
					<input type="password" name="password">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">성별</td>
				<td width="80%" align="left">
					<input name="gender" type="radio" value="남자">남자
					<input name="gender" type="radio" value="여자" checked="checked">여자<br>
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">생일</td>
				<td width="80%" align="left">
					<input type="date" name="birth">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">결혼 여부</td>
				<td width="80%" align="left">
					<input name="marriage" type="radio" value="결혼">결혼
					<input name="marriage" type="radio" value="미혼">미혼
					<input name="marriage" type="radio" value="이혼">이혼<br>
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">급여</td>
				<td width="80%" align="left">
					<input type="number" name="salary">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">주소</td>
				<td width="80%" align="left">
					<input name="address" type="text">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">매니저</td>
				<td width="80%" align="left">
					<input type="text" name="manager">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">이미지</td>
				<td width="80%" align="left">
					<input type="file" name="image">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">히든</td>
				<td width="80%" align="left">
					<input name="point" type="hidden" value="1234"><br/>
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">읽기 전용</td>
				<td width="80%" align="left">
					<input name="readonly" type="text" value="abc" disabled="disabled">
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">취미</td>
				<td width="80%" align="left">
					<input name="hobby" type="checkbox" value="탁구">탁구
					<input name="hobby" type="checkbox" value="야구">야구
					<input name="hobby" type="checkbox" value="축구">축구<br>	
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">가고 싶은 국가</td>
				<td width="80%" align="left">
					<select name="country">
						<option value="-">--- 국가를 선택하세요 ---
						<option value="미국">미국
						<option value="일본">일본
						<option value="중국">중국
					</select>
				</td> 
			</tr>
			<tr>
				<td width="20%" align="center">코멘트</td>
				<td width="80%" align="left">
					<textarea rows="5" cols="20"></textarea>
				</td> 
			</tr>
			<tr>
				<td align="left" colspan="2">
					&nbsp;&nbsp;
					<input type="reset" value="초기화">
					&nbsp;&nbsp;&nbsp; 
					<input type="submit" value="가입하기">
				</td> 
			</tr>			
		</table>
					
	</form>	
</body>
</html>