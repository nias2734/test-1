<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		/* 선택자(selector) : 스타일을 적용할 어떠한 대상 */
		/* 선택자{속성이름1:값1;속성이름2:값2;...} */
		/* 라벨 태그를 모두 찾아서 글자 크기를 25픽셀로 셋팅해 주세요. */
		label{font-size: 25px;}
		/* id 속성은 # 기호를 이용합니다. */
		#age{color:red;font-size: 40px;}
		#hobby{color:blue;font-size:50px;}
		
		/* class 속성은 .(dot) 기호를 이용합니다. */
		.mytarget{color: yellow;font-size: 40px;background-color: black;}
		.yourtarget{color: red;font-size: 40px;background-color: blue;}
		
		/* 콤마 기호를 사용하면 2개 이상의 요소에 스타일 지정이 가능 */
		#age, #hobby{background-color: red;color: green;}
		
		/* 스페이스는 특정 요소의 하위 요소를 찾을 때 사용합니다. */
		#myform #age{background-color: yellow;color: blue;}
		
		/* 라벨 요소 중에서 id가 hobby인 항목을 찾습니다. */
		label#hobby{background-color: green;color: black;}
		
		/* 라벨 요소 중에서 class가 mytarget인 항목을 찾습니다. */
		label.mytarget{font-size: 10px;background-color: orange;color: black;}
		
		label.mytarget, label.yourtarget{color:blue;font-size: 15px;}
		
	</style>
</head>
<body>
	<!-- html 주석 -->
	<h1>폼 양식</h1>
	<form id="myform" action="htmlTest01To.jsp">
		<label>이름 : </label>
		<input type="text" name="name" value="홍길동">
		<br/><!-- br 태그는 엔터키 효과 -->
		<label id="age">나이 : </label>
		<input type="text" name="age">
		<br/>
		<label class="mytarget">이미지 : </label>
		<input type="file" name="image">
		<br/>
		<label>숨김 파라미터 : </label>
		<input type="hidden" name="money" value="1200000">
		<br/>
		<label class="mytarget">성별 : </label>
		<input type="radio" name="gender" value="1" checked="checked">남자
		<input type="radio" name="gender" value="2">여자
		<br/>
		<label id="hobby">취미 : </label>
		<input type="checkbox" name="hobby" value="당구">당구
		<input type="checkbox" name="hobby" value="축구" checked="checked">축구
		<input type="checkbox" name="hobby" value="야구" checked="checked">야구
		<input type="checkbox" name="hobby" value="농구">농구
		<br/>
		<label class="yourtarget">직업 : </label>
		<select name="job">
			<option value="-">-- 선택해 주세요
			<option value="의사">의사
			<option value="판사" selected="selected">판사
			<option value="변호사">변호사
			<option value="검사">검사			
		</select>
		<br/>
		<label class="mytarget yourtarget">코멘트 : </label>
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