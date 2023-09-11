<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- jQuery = javascript + css + etc 등들을 집대성해놓은 라이브러리 -->
	<!-- jquery.js 파일 내에 여러 가지 함수 등을 정의해 두었습니다.  -->
	<script type="text/javascript" src="./../js/jquery.js"></script>
	
	<script type="text/javascript">		
		/*$(document).ready(function(){});*/
		/* 이 문서가 완전 로딩되었을 때 document ready 구문이 실행됩니다. */
		
		$(document).ready(function(){
			/* write here to do list */			
			/* alert('하하하'); */
			/* alert() 함수는 사용자에게 알림 메시지 창을 띄워 줍니다. */
			/* console.log() 브라우저 개발자 도구의 콘솔 창에 출력해 줍니다. */
			console.log('호호호') ;
			
			/* 변수 선언시 자바 스크립트는 var 키워드를 사용합니다. */
			var a = 10 ;
			var b = 5 ;
			var c = a + b ;
			var result = a + ' + ' + b + ' = ' + c ;
			console.log(result) ;
			
			var label_count = $('label').length ;
			console.log('라벨의 개수 : ' + label_count) ;
			
			$('#label_cnt').html('<b>' + label_count + '</b>');
			/* alert($('#label_cnt').html()); */
			
			/* addClass(className) : class="className"이라는 속성을 추가합니다. */
			$('label').addClass('label_style');
			
			$('#age').removeClass('label_style');
			
			$('#hobby').css('color', 'blue').css('background-color', 'red');
			$('#hobby').css('color', '');
			
			var label_string = '' ;
			
			$('label').each(function(){
				label_string += $(this).text().replace(' : ', '') + ' ' ; 
			});
			$('#label_text').html(label_string);
			
			$('#check01').click(function(){ 
				var checklist = $(':checkbox');
				console.log('type="checkbox"인 항목 개수 : ' + checklist.length);
				
				var result = '';
				for(var i=0 ; i < checklist.length ; i++){
					if(checklist[i].checked){
						result += checklist[i].value + ' ' ; 
					}	
				}
				$('#check_result_01').html(result);
			});
			
			
			$('#check02').click(function(){ 
				var checklist = $('input[type="checkbox"]:checked');
				
				var result = '' ;
				for(var i=0 ; i < checklist.length ; i++){
					result += checklist[i].value + ' ' ;
				}
				
				$('#check_result_02').html(result);
			});
			
			
		  	$('#radio01').click(function(){
		  		var list = $(':radio') ; /* type 속성이 radio인 항목들 */
		  		
		  		var result = '' ;
		  		for(var i=0 ; i<list.length ; i++){
		  			if(list[i].checked){
		  				result += list[i].value + ' ' ;
		  			}
		  		}
		  		$('#radio_result_01').html(result) ;
		  	});
		  	
			$('#radio02').click(function(){
				var checklist = $('input[type="radio"]:checked');
				
				var result = '' ;
				for(var i=0 ; i < checklist.length ; i++){
					result += checklist[i].value + ' ' ;
				}
				
				$('#radio_result_02').html(result);
			});
		});
	</script>
	<style type="text/css">
		.label_style{background-color: yellow;font-size: 30px;}
	</style>
</head>
<body>
	<!-- html 주석 -->
	<h1>폼 양식</h1>
	<form action="htmlTest01To.jsp">
		<label>이름 : </label>
		<input type="text" name="name" value="홍길동" >
		<br/><!-- br 태그는 엔터키 효과 -->
		<label id="age">나이 : </label>
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
		<label id="hobby">취미 : </label>
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
	<hr/>	
	라벨 개수 : <span id="label_cnt"></span>
	<br/>
	라벨 문구 : <span id="label_text"></span>
	<br/><br/><br/>
	
	<button id="check01">체크 요소 확인 01</button><br/>
	<button id="check02">체크 요소 확인 02</button><br/>	
	<button id="radio01">라디오 요소 확인 01</button><br/>
	<button id="radio02">라디오 요소 확인 02</button><br/>
	<br/>
	체크 결과 01 : <span id="check_result_01"></span><br/>	
	체크 결과 02 : <span id="check_result_02"></span><br/>		
	라디오 결과 01 : <span id="radio_result_01"></span><br/>	
	라디오 결과 02 : <span id="radio_result_02"></span><br/>
	
</body>
</html>







