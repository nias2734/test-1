<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 깨짐 방지를 위하여 문자열 인코딩, 반드시 최상단에 명시할 것
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	Integer age = Integer.parseInt(request.getParameter("age"));
	String[] hobbies = request.getParameterValues("hobby");
	
	String hobby = "" ;
	if(hobbies==null){
		hobby = "" ;
	}else{
		for(int i=0 ; i<hobbies.length ; i++){
			hobby += hobbies[i] + "," ;
		}
		hobby = hobby.substring(0, hobby.length() - 1) ;
	}	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id%><br/>
	이름 : <%=name%><br/>
	나이 : <%=age%><br/>
	취미 : <%=hobby%><br/>
</body>
</html>