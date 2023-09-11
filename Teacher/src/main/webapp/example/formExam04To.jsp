<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% 
	// 한글 깨짐 방지, 반드시 가장 상단에 명시할 것.
	request.setCharacterEncoding("UTF-8");
%>
<%	
	String name = request.getParameter("name") ;
	int age = Integer.parseInt(request.getParameter("age"));
	String image = request.getParameter("image") ; 	
	int money = Integer.parseInt(request.getParameter("money"));
	
	String _gender = request.getParameter("gender") ;
	String gender = "" ; 
	
	switch(_gender){
		case "1":
			gender = "남자";
			break ;
		case "2":
			gender = "여자";
			break ;			
	}
		
	String[] hobbies = request.getParameterValues("hobby");
	
	String hobby = "" ;
	if(hobbies == null){
		hobby = "" ; 
		
	}else{
		for(int i=0 ; i< hobbies.length; i++){
			hobby += hobbies[i] + "," ; 
		}
		hobby = hobby.substring(0, hobby.length() - 1);	
	}
	
	String job = request.getParameter("job") ;	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=age%></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><%=image%></td>
		</tr>
		<tr>
			<td>숨김 파라미터</td>
			<td><%=money%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender%></td>
		</tr>
		<tr>
			<td>취미</td>
			<td><%=hobby%></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%=job%></td>
		</tr>
		<tr>
			<td>코멘트</td>
			<td><%=request.getParameter("comment")%></td>
		</tr>
	</table>
</body>
</html>
